
getwd();

d <- read.table('diatomsF.txt', header=T, sep='\t');

# count # unique species per 1 my time bin 30 mya to 0 mya
# count # lists per 1 my time bin

# 25 and 24 mya
records25 <- d[d$sample_age > 24 & d$sample_age <= 25, ];
samples25<-length(unique(records25$list));
samples25;
species25<-length(unique(records25$species));
species25;

breakvec <- seq(30, 0, by = -0.25);
# length(breakvec) - 1 == the # of bins
numBins <- length(breakvec) - 1;

# Pre-allocating a vector of length numBins
spcounts <- numeric(numBins);

listcounts <- numeric(numBins);

for (i in 1:numBins){

	minbin <- breakvec[i];
	maxbin <- breakvec[i + 1];
	#cat('i = ', i, '\tMin: ', minbin, '\tMax: ', maxbin, '\n')
	tempdf <- d[d$sample_age < minbin & d$sample_age >= maxbin, ];
	spcounts[i] <- length(unique(tempdf$species));
	listcounts[i] <- length(unique(tempdf$list));
}


quartz.options(height=8, width=8, dpi=72);
plot.new();
par(mar=c(6, 6, 1, 6));

# set up plot window
plot.window(xlim=c(max(breakvec), min(breakvec)), ylim=c(0, 1.05*max(spcounts)));

binvec <- seq(29.875, 0.125, length.out = numBins);
points(binvec, spcounts, pch=21, bg='red', cex=1.5);

#add axes
axis(side=1, at= seq(35, -5, by = -5), cex.axis =1.1 );
axis(side=2, at=seq(-100, 400, by=100), cex.axis=1.1, las=1);
mtext(side=1, text='MY before present', line=3.5, cex=1.5, font=4);
mtext(side=2, text='Species richness', line=3.5, cex=1.5,font=4);

par(new=TRUE);
par(mar=c(6, 6, 1, 6));
plot.window(xlim=c(max(breakvec), min(breakvec)), ylim=c(0, max(listcounts)*1.05));
lines(x=binvec, y=listcounts, lwd=2, col='gray50')
axis(4, at=seq(-100, 500, by=100), cex.axis=1.1, las=1)
mtext(side=4, text='Number of lists', line=3.5, cex=1.5, font=4)

################################

greeter 
# 1 argument : a name "x"
"hello, x"

greeterFunction <- function(theName){
	cat('Hello, ', theName);
}

#making a default argument
greeterFunction <- function(theName = 'Elvira'){
	cat('Hello, ', theName);
}
 

greeterFunction <- function(theName = 'Elvira'){
	cat('Hello, ', theName);
	
	return(theName);
}

# function: 2 arguments, a & b
# multiply and return product

multiplier <- function(n1, n2){
	
	prod <- n1 * n2 * n3;
	return(prod);
	
}

multiplier <- function(n1, n2){
	
	return(n1 * n2);
	
}






