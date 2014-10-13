d <- read.table("/Users/singhal/seminars/Rcourse/Rweek6/diatomsF.txt",header=T,sep="\t")

minAge = 0
maxAge = 30
bin = 1

numBins <- (maxAge - minAge)/bin
ages <- rep(0,numBins)
for (i in 1:numBins) {
	ages[i] <- minAge + bin * (i - 1)
	}
numSpecies <- rep(0,length(ages))
numSamples <- rep(0,length(ages))
for (i in 1:length(ages)) {
	low <- ages[i]
	up <- ages[i]+bin
	numSpecies[i] <- length(unique(d[d$sample_age >= low & d$sample_age < up,  ]$species))
	numSamples[i] <- length(unique(d[d$sample_age >= low & d$sample_age < up,  ]$list))
	}
	
quartz.options(width=6, height=10, dpi=72);
plot.new();
par(oma=c(2,2,1,1));
par(mfcol=c(2, 1)); 

#plot 1 -- number of species
frame();
par(mar = c(6, 6, 1, 1));
plot.window(xlim = range(ages), ylim=c(0, max(numSpecies)));

points(x = ages, y = rev(numSpecies), pch=21, bg= 'lightblue')
axis(side=1, at= seq(minAge, max(ages), by=bin), labels=rev(ages), cex.axis=0.75);
axis(side=2, at=seq(0, 350, by=50), cex.axis=0.75 , las=1);
mtext(side = 1, text = 'ages (mya)', line=3.5, cex=1, font = 2 );
mtext(side = 2, text='number of species', line=3.5, cex=1, font=2);
box()

#plot 2 -- number of samples
frame();
par(mar = c(6, 6, 1, 1));
plot.window(xlim = range(ages), ylim=c(0, max(numSamples)));

points(x = ages, y = rev(numSamples), pch=21, bg= 'lightblue');
#	seq: gives a sequence of numbers
axis(side=1, at= seq(minAge, max(ages), by=bin), labels=rev(ages), cex.axis=0.75);
axis(side=2, at=seq(0, 500, by=50), cex.axis=0.75 , las=1);
mtext(side = 1, text = 'ages (mya)', line=3.5, cex=1, font =2 );
mtext(side = 2, text='number of samples', line=3.5, cex=1, font=2);
box()
