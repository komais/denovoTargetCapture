 
nicerLttPlot <- function(phy, height=6, width=6, pch=19, cex=1.3, col='black', pb=TRUE){
	
	bt <- rev(sort(as.numeric(branching.times(phy))));
	bt <- bt/max(bt);
	lins <- log(2:(length(bt)+1));
	
	quartz.options(height=height, width=width, dpi=72);
	plot.new();
	par(mar=c(6,6,1,1));
	plot.window(xlim=c(0,1), ylim=c(0.5, max(lins)*1.05));
	tmax <- max(bt);
	st <- max(bt)-bt; #convert to time t=0 at root
	if (pb){
		lines(x=c(0, 1), y=c(min(lins), max(lins)), lwd=2, col='red');		
	}

	points(st, lins, pch=pch, cex=cex, col=col);

	axis(1, at=seq(-0.2, 1.2, by=0.2));
	axis(2, at=seq(0, 7, by=1), las=1);
	mtext(side=1, text="Time from basal divergence (relative)", line=3.5, cex=1.5);
	mtext(side=2, text="Log(lineages)", line=3.5, cex=1.5);
}






############################################
#	Core functions
#			
############################################
#


#
# will accept 2 parameters: 2 for speciation 
buildLikelihoodFunction.purebirth <- function(bt, lam){
 
	lfx <- function(pars){
		if (length(pars) != 2)
			stop('Problem with parameter vector length: must be 2!')
		
		mu <- function(time, pars){
			return(0)
		}
		
		stimes <- sort(max(bt)-bt);
		N <- length(bt)+1;	
		lvals <- lam(stimes[2:length(stimes)], pars[1:2]);
	
		base <- sum(log(lvals));
		basal.lins <- 2*rhoFxMod(0, max(bt), lam, mu, pars);
		lh <- base + basal.lins;
		for (i in 2:length(stimes))
			lh <- lh + rhoFxMod(stimes[i], max(bt), lam, mu, pars); 
		return(lh);
		
	}
	
	return(lfx);	
}

# will accept 4 parameters: 2 for speciation, 2 for extinction
buildLikelihoodFunction.extinction <- function(bt, lam, mu){
 
	lfx <- function(pars){
		if (length(pars) != 4)
			stop('Problem with parameter vector length: must be 4!')
		
		stimes <- sort(max(bt)-bt);
		N <- length(bt)+1;	
		lvals <- lam(stimes[2:length(stimes)], pars[1:2]);
	
		base <- sum(log(lvals));
		basal.lins <- 2*log(probSurviveMod(0, max(bt), lam, mu, pars))+2*rhoFxMod(0, max(bt), lam, mu, pars);
		lh <- base + basal.lins;
		for (i in 2:length(stimes))
			lh <- lh + 2*log(probSurviveMod(stimes[i], max(bt), lam, mu, pars)) + rhoFxMod(stimes[i], max(bt), lam, mu, pars); 
		return(lh);
		
	}
	
	return(lfx);	
}




probSurviveMod <- function(t1, t2, lam, mu, pars){
	
	fx <- function(x){
		# loop necessary here to vectorize stuff
		res <- numeric(length(x));
		for (i in 1:length(x))
			res[i] <- mu(x[i], pars[3:4])*exp(rhoFxMod(t1, x[i], lam, mu, pars));
			
		return(res);
	}
	temp <- integrate(fx, t1, t2)$value;
	return(1/(1+temp));
	
}

rhoFxMod <- function(t1, t2, lam, mu, pars){
	
	fx <- function(x){
		res <- numeric(length(x));
		for (i in 1:length(x))
			res[i] <- mu(x[i], pars[3:4])-lam(x[i], pars[1:2]);
		return(res);
	} 
	
	res <- integrate(fx, t1, t2)$value;
	return(res);

}



 






#	tmat (time matrix)
#		t.start
#		t.end
#		lambda
#		mu
#	obs.term.div = starting diversity
#	obs.events = known speciation events that occurred on the interval
#		e.g., a vector of speciation times
#	tol 
#		= tolerance - important for conditioning on the obs.events
#	returns vector of missing speciation events
 


simtree_conditioned <- function(tmat, obs.term.div, obs.events = NULL, tol=0.00001){
	
	
	
	MAXTIME <- max(tmat$t.end)*100;
	
	end.div <- 0;
	count.fail <- TRUE;
	event.fail <- TRUE;
	if (is.null(obs.events)){
		no.events <- TRUE;
		obs.events <- MAXTIME #sets to value larger than longest time..
	}else{
		no.events <- FALSE;
		
	}

	
	while (count.fail | event.fail){ #not worry about this yet...
		
		count.fail <- TRUE;
		event.fail <- TRUE;
		
		oe <- sort(obs.events);	
		edge <- matrix(c(1, 2), nrow=1, ncol=2);
		alive <- TRUE;

		b.start <- tmat$t.start[1];
		b.end <- 0;
		
		for (i in 1:nrow(tmat)){
			
			if (sum(alive)==0)
				break; #full extinction
			
			curr.time <- tmat$t.start[i];
			lambda <- tmat$lambda[i];
			mu <- tmat$mu[i];
			
			repeat{
				
				t.temp <- rexp(1, rate= (sum(alive)*(lambda+mu)));
				
				trial.time <- curr.time+t.temp;
				#print(trial.time);
				
				
				if (oe[1] > tmat$t.end[i]){
					if (trial.time >= tmat$t.end[i]){
						curr.time <- tmat$t.end[i];
						break;							
					}
								
				}
				
					# speciation or extinction
					
					if (trial.time > oe[1]){
						curr.time <- oe[1];						
						event <- 0;
						if (length(oe) > 1){
							oe <- oe[2:length(oe)];	
						}else{
							oe <- MAXTIME;	
						}
						
						
					}else{
						curr.time <- curr.time + t.temp;						
						event <- runif(1);						
					}
	
					if (event < lambda/(lambda+mu)){
						if (length(edge[,2][alive]) == 1){
							new.parent <- edge[,2][alive];
						}else{
							new.parent <- sample(edge[,2][alive], size=1);				
						}

						new.node <- max(edge[,2])+1;
						edge <- rbind(edge, c(new.parent, new.node), c(new.parent, new.node+1));
						alive <- c(alive, TRUE, TRUE);
						
						b.start <- c(b.start, rep(curr.time,2));
						
						alive[edge[,2]==new.parent] <- FALSE;
						b.end <- c(b.end, 0, 0);
						b.end[edge[,2]==new.parent] <- curr.time;						
						
					}else{
						if (length(edge[,2][alive]) == 1){
							dead <- edge[,2][alive];
							alive[edge[,2]==dead] <- FALSE;
							b.end[edge[,2] == dead] <- curr.time;
							
							break;
						}else{
							dead <- sample(edge[,2][alive], size=1);
							alive[edge[,2]==dead] <- FALSE;
							b.end[edge[,2] == dead] <- curr.time;
				
						}
							
					}
					

				
				
			} #repeat / # here we keep going until end of time interval
			#	out of time interval- set end time of all ALIVE lineages to
			#	end time
			b.end[alive] <- tmat$t.end[i];
				
		} #for loop
		
		count.fail <- sum(alive) != obs.term.div;
		# if count.fail is TRUE, stays in while loop
		
		#cat(sum(alive), obs.term.div, '\n', sep='\t');
		
		
		# count number of living species here
		# then drop extinct tips
		#	then make sure OBSERVED speciation events also match those in tree
		
		## must fix tree....
		
		
		# If the right number of species,
		#	build tree 
		if (!count.fail){
			root.edge <- b.end[1]-b.start[1];
			edge <- edge-1;
			edge <- edge[2:nrow(edge), ];
			alive <- alive[2:length(alive)];
			edge.length <- b.end-b.start;
			edge.length <- edge.length[2:length(edge.length)];
		
			interns <- sort(unique(edge[,1]));
			edge[edge %in% interns] <- edge[edge %in% interns]*-1;		
		
			terms <- sort(setdiff(edge[,2], interns));
			terms <- terms[terms > 0];

			for (i in 1:length(terms))
				edge[edge == terms[i]] <- i;

			for (i in 1:length(interns))
				edge[edge == -interns[i]] <- length(terms)+i;

			tree <- list(edge=edge, edge.length=edge.length, Nnode=length(interns), tip.labels=as.character(1:length(terms)), root.edge=root.edge);
			class(tree) <- 'phylo';				
			
			tree <- prune.extinct.taxa(tree);
			
			tree$root.edge <- max(tmat$t.end) - max(branching.times(tree));
			
			## Now must make sure that observed events are in tree
			
			if (!no.events){
				st <- max(tmat$t.end)-branching.times(tree);
				matchvec <- rep(FALSE, length(obs.events));
				for (i in 1:length(obs.events)){
					temp <- abs(obs.events[i]-st);	
					if (min(temp)[1] < tol)	
						matchvec[i] <- TRUE;
				}
				if (sum(matchvec)==length(matchvec)){
					event.fail <- FALSE;
				}					
			}else{
				event.fail <- FALSE;
			}

			
		}
		
		
		#cat(sum(alive), '\n', sep='\t');	
	} #	while end diversity not right:
	
		
	return(tree);
}


#	gets time matrix for simulations
#	 
#	lambda and mu are functions that take a single argument, time
#		and return the rate
#	these functions are generated by buildRateFx

getTimeMatrix <- function(t.start, t.end, n.ints, lambda, mu){
	tmat <- matrix(0, nrow=n.ints, ncol=4);
	tvec <- seq(t.start, t.end, length.out=n.ints+1);
	tmat[,1] <- tvec[1:n.ints];
	tmat[,2] <- tvec[2:(n.ints+1)];	
	
	tmat[,3] <- lambda(rowMeans(tmat[,1:2]));
	tmat[,4] <- mu(rowMeans(tmat[,1:2]));
	tmat <- as.data.frame(tmat);
	names(tmat) <- c('t.start', 't.end', 'lambda', 'mu');
	return(tmat);	
	
}







