#homework: make 2 panel plot
#upper panel: number of species in every 1Ma time bin between 30Ma and present (from past to present)
#lower panel:do the same with the number of total records
setwd('/Users/Sean/Desktop/R Course/Week7')
diatoms<-read.table(file='diatomsF.txt', sep='\t', header=T);

bin <- 1;
min <- 1;
max <- 30;
nbins <- max/bin;

diaBins<-data.frame(nbins,2);
for (i in min:max){
	#make new vector of just diatoms from i to i-1
	dia1Ma<-diatoms[(diatoms$sample_age<i) & diatoms$sample_age>(i-1), ];
	
	#calculate number of lists in bin
	diaBins[i,1]<-length(unique(dia1Ma$list));
	
	#calculate number of unique species in bin
	diaBins[i,2]<-length(unique(dia1Ma$species));
	
}


#make the two panel plot

quartz.options(width=10, height=8, dpi=72);
plot.new();
par(mfrow=c(2,1));

#make first plot - number of species

frame();
plot.window(xlim=c(0,30), ylim=c(0, 400));
par(mar=c(4,4,0,0));
dates<-1:30;
axis(side=1, at=seq(30, 1, by=-1), labels=dates);
mtext(side=1, text='Ma',line=2.0, cex=1.5, font=1);

axis(side=2, at=seq(0, 350, by=50), pos=0);
points(x=30:1, diaBins[ ,2], pch=21, bg='coral', cex=1.5);
mtext(side=2, text='Number of species',line=1.5, cex=1.5, font=1);

#make second plot - number of records
frame();
plot.window(xlim=c(0,30), ylim=c(0, 500));
par(mar=c(4,4,0,0));
dates<-1:30;
axis(side=1, at=seq(30, 1, by=-1), labels=dates);
mtext(side=1, text='Ma',line=2.0, cex=1.5, font=1);

axis(side=2, at=seq(0, 500, by=50), pos=0);
points(x=30:1, diaBins[ ,1], pch=21, bg='coral', cex=1.5);
mtext(side=2, text='Number of records',line=1.5, cex=1.5, font=1);

