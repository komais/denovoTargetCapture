rm(list=ls());
dir();
diatoms<-read.table('diatomsF.txt', sep='\t', header=T);
dim(diatoms);
names(diatoms);
###"sample_age" in millions of years; "species" name; "list" = id for each sample (a sample may contain multiple species)

quartz.options(height=10, width=20, dpi=72);
plot.new();
par(mfrow=c(2,1));
par(oma=c(5,1,5,1));

###count the number of species in 1my intervals from 30my ago through the present
frame();
par(mar=c(6,6,2,0));
plot.window(xlim=c(1, 30), y=c(0,400));
timevec<-c(30:0);
axis(side=1, at=(seq(0.5, 30.5)), label=timevec);
mtext('Millions of Years Ago', side=1, line=2);
axis(side=2);
mtext('Number of Species', side=2, line=2);

maxtime<-30;
mintime<-29;
xvec<-c(1:31);
i<-0;
for (i in 1:30){
	speciespartition<-diatoms[diatoms$sample_age < maxtime & diatoms$sample_age > mintime,];
	points(x=xvec[i], y=length(unique(speciespartition$species)));
	maxtime<-maxtime-1;
	mintime<-mintime-1;
	i<i+1;
}


###count the number of samples (=list) for each time period
frame();
par(mar=c(6,6,2,0));
plot.window(xlim=c(1, 30), y=c(0,500));
timevec<-c(30:0);
axis(side=1, at=(seq(0.5, 30.5)), label=timevec);
mtext('Millions of Years Ago', side=1, line=2);
axis(side=2);
mtext('Number of Samples', side=2, line=2);

maxtime<-30;
mintime<-29;
xvec<-c(1:31);
i<-0;
for (i in 1:30){
	speciespartition<-diatoms[diatoms$sample_age < maxtime & diatoms$sample_age > mintime,];
	points(x=xvec[i], y=length(unique(speciespartition$list)));
	maxtime<-maxtime-1;
	mintime<-mintime-1;
	i<i+1;
}
