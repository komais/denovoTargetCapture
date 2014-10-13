
#1
summaryStats <- function(x)
{
	if (!is.numeric(x))
		stop("x must be numeric\n");
	if (length(x) <= 10)
		stop('must have at least 10 numbers');
	res<-list();
	res$avg <- mean(x);
	res$med <- median(x);
	x <- sort(x);
	res$largest <- x[(length(x)-4):length(x)];
	res$small <- min(x);
	res$q975 <- quantile(x, 0.975);
	res$q025 <- quantile(x, 0.025);
	return(res);	
}

#3 (should be 2, but i can't count)

getCV <- function(x)
{
	return(sd(x)/mean(x));	
}


#4 

getLizardData<-function(db)
{
	species <- unique(db$species)
	res<- list();	
	for (i in 1:length(species))
	{
		temp <- db[db$species == species[i], ];
		res$sp[i] <- paste(species[i]);
		res$nMale[i] <- nrow(temp[temp$sex == 'M',]);
		res$nFem[i] <- nrow(temp[temp$sex == 'F', ]);
		res$sites[i] <- length(unique(temp$sites));
		res$avg_svl[i] <- mean(temp$snout_vent);
		res$mx_svl[i] <- max(temp$snout_vent);
		res$cv_svl[i] <- getCV(temp$snout_vent);
		res$dev[i] <- (max(temp$snout_vent)-mean(temp$snout_vent))/sd(temp$snout_vent);
		
	}
	res<-as.data.frame(res);
	return(res);
}


#3 (oops...back to 3 again....am i proofreading this stuff?)
If she takes a super-sized step, she can sometimes hit one boundary and reflect back into the room...all the way to the other boundary. If she is at x = 0.5 and she takes a step of -12, she will go to x = 0 and bounce back 11.5 units. Since you probably didnt implement a control for this double bounce, this presumably means that her final position will be x = 11.5 (and outside the room).  

#5 

# I first defined a function that would do a single simulation: it does a single broken stick simulation and calculates the CV for a given number of species and clades.

getNullStat<-function(sp, clades)
{
	breaks <- sample(1:(sp-1), clades-1);
	breaks <- c(0, breaks, sp);
	breaks <- sort(breaks);
	clade.diversity <- diff(breaks);
	if (length(clade.diversity) != clades)
		stop('wrong # of clades\n');
	if (sum(clade.diversity)!= sp)
		stop('wrong # of species!\n')
	stat<-getCV(clade.diversity);
	return(stat);
}

#note that this function uses getCV(), which was defined earlier.

#Here is my script to actually do the analysis:

af <- read.table(file = 'avian_families.txt', header=TRUE);
names(af);
species <- sum(af$species);
families<-nrow(af);
NREPS <- 5000;

test.stat<-getCV(af$species);
null.dist <- rep(NA, NREPS);
for (i in 1:NREPS)
	null.dist[i] <- getNullStat(species, families);

hist(null.dist, breaks =100);
p.value <- (length(null.dist[null.dist >= test.stat]))/NREPS;
p.value;

#notice how easy it is to follow this: because we have kept getNullStat as a separate function, 
# the entire simulation takes two lines of code.













