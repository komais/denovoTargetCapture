
#1
set.seed(3);
MAXPOPSIZE	<- 10000;
INIT <- 2;
NSIMS <- 5000;
genvec <- rep(NA, NSIMS);

for (i in 1:NSIMS)
{
	curr <- INIT;
	popvector <- NULL;
	while(curr < MAXPOPSIZE)
	{
		curr<- sum(rgeom(curr, 0.333));
		popvector<-c(popvector, curr)
		if (curr == 0)
			break;
	}
	if (curr > 0)
		genvec[i] <- length(popvector);		
}

hist(genvec);

#with set.seed(3), 1270 out of 5000 will go extinct.


2) default arguments etc:

rnorm: mean = 0, sd = 1
needs: n, which is the number of randoms to generate

sum: na.rm = F, which tells function whether to ignore NA values when doing sum
needs: vector to be summed

t.test: y = NULL (only null if 1-sample t-test), alternative = "two.sided", mu=0, paired=F, var.equal=F, conf.level = 0.95
needs: vector to be tested

sample: replace = F, prob = NULL
needs: items to sample, number of times to sample them.

sort: descending = F
needs: vector of values to be sorted.


3) 

mailKittens <- function(len, wid, ht)
{
	if(!is.numeric(len) | !is.numeric(wid) | !is.numeric(ht)) 		stop('non numeric input.  Re-evaluate input\n');
	vol <- len*wid*ht;
	kittens <- floor(vol/1500);
	cat('The volume of the box is ', vol, '\n', sep='');
	return(kittens);	
}
#note use of | to deal with input validation...


4) 

fact <- function(n)
{
	res<-1;
	for (i in 1:n)
		res<-res*i;
	return(res);
}

5) 

doGrowthSimulation <- function(initsize, growth)
{
	curr<-initsize;
	popvec <- NULL;
	while(curr > 0 & curr < MAXPOPSIZE)
	{
		curr<-sum(rgeom(curr, growth));	
		popvec<-c(popvec, curr);
	}	
	if (curr == 0){
		return(NA)
	}else{
		return(length(popvec));	
	}
}

#Example:
MAXPOPSIZE <- 10000;
NSIMS <- 5000;
results <- rep(NA, NSIMS);
for (i in 1:NSIMS)
	results[i] <- doGrowthSimulation(2, 0.333);

#see how much cleaner this is?  


6) rand sequence simulator


randSeq <- function(x)
{
	if(!is.numeric(x)){
    	stop('this program needs a numeric value for the length of DNA sequence to generate')    
  	}
	cv <- c('a', 'c', 't', 'g');
	res <- sample(cv, x, replace=TRUE);
	res<-paste(res, collapse='')
	return(res);	
}


7) quadratic fun

quadFx <- function(a, b, c)
{
	if (!is.numeric(a) | !is.numeric(b) | !is.numeric(c))
		stop('bad input...\n');
	term1 <- b^2 - 4*a*c;
	
	if (term1 < 0 ){
		cat('complex roots\n')	
	}else{
		x1 <- (-b + sqrt(term1))/(2*a);
		x2 <- (-b - sqrt(term1))/(2*a);	
		if (x1 == x2){
			cat('two identical real roots:', x1, '\n');			return(x1);
		}else{
			cat('roots are ', x1, x2, '\n', sep=' ');			return(c(x1, x2));
		}
	}
}

8) 
Brownie stuff:

# using NULL is better than NA for the condition where
# there are no bounds on the bounce of Brownie.
#This version of Brownie's bounce never leaves the room. See why?
move <- function(pos = 0, stdev=1, minbound = NULL, maxbound = NULL)
{
	newpos <- pos + rnorm(1, 0, sd=stdev);
	if (!is.null(minbound) & !is.null(maxbound)){
		while (newpos < minbound | newpos > maxbound){
			if (newpos < minbound)
				newpos <- 2*minbound - newpos;
			if (newpos > maxbound)
				newpos <- 2*maxbound - newpos;		}
	}else if (!is.null(minbound) & is.null(maxbound)){
		if (newpos < minbound)
			newpos <- 2*minbound - newpos;
	}else if (is.null(minbound) & !is.null(maxbound)){
		if (newpos > maxbound)
			newpos <- 2*maxbound - newpos;
	}else{
		#do nothing! 
	}
	return(newpos);	
}

xpos <- 5;
ypos<-5;

for (i in 1:100)
{
	xpos <- c(xpos, move(xpos[length(xpos)], 4, 0, 10));
	ypos <- c(ypos, move(ypos[length(ypos)], 4, 0, 10));
}









