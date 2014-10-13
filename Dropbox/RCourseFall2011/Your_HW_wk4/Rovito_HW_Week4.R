#Value of argument to testPrime: 25
#Iteration	i	isPrime_Start	Remainder	isPrime_End
#1			2	TRUE			1			TRUE	
#2			3	TRUE			1			TRUE
#3			4	TRUE			1			TRUE
#4			5	TRUE			0			FALSE
#5			6	FALSE			1			FALSE
#6			7	FALSE			4			FALSE
#7			8	FALSE			1			FALSE

#Final value of isPrime: FALSE
#Total number of iterations of loop: 23

#Problem 1
i<-0;
sumvariable<-0;

while (i<=17){
	sumvariable<-sumvariable+i;
	i<-i+1;
}
cat('Sum of all numbers between one and 17 is ', sumvariable, '\n');

#Problem 2

MAXPOPSIZE<-2000;
curr_pop_size<-1;
currenttime<-0;
timevector<-currenttime;
popvector<-curr_pop_size;
progeny<-2;

while(curr_pop_size < MAXPOPSIZE){
	
	curr_pop_size<-curr_pop_size * progeny;
	currenttime<-currenttime+1
	popvector<- c(popvector, curr_pop_size);
	timevector<-c(timevector, currenttime);
	cat('Time is', currenttime, 'Size is', curr_pop_size, '\n', sep=' ');
}

plot(timevector, popvector);

#Problem 3
#Draw 5000 random numbers from geometric distribution
randomvec<-rgeom(5000, 0.3333);
mean(randomvec[1:5000]);
hist(randomvec);
#Population gave birth to 1.9956 progeny on average
sum(randomvec[1:5000]);
#Population gave birth to 9978 total progeny

#Problem 4

MAXPOPSIZE<-5000;
curr_pop_size<-8;
popvector<-curr_pop_size;
gen<-rep(0,10);

for (i in 1:10){
	set.seed(i);
	curr_pop_size<-8;
	popvector<-curr_pop_size;
	while (curr_pop_size< MAXPOPSIZE){
		babies<-rgeom(curr_pop_size, 0.33333);
		curr_pop_size<-sum(babies);
		gen[i]<-gen[i]+1;
		popvector<-c(popvector, curr_pop_size); 	
	}	
}
gen;
#Takes 11 generations to exceed 5000 individuals in first run
 
#across 10 replicates, takes 10.5 generations to exceed 5000 individuals
 
#Problem 5
# A for loop is not appropriate since it is a stochastic process. The number of generations to exceed MAXPOPSIZE is not determined beforehand (depends on population growth) and so the number of iterations of the for loop can't be set.
 
#Problem 6
#Population size will always increase because the mean of the geometric distribution of progeny numbers is >1. 
 
#Problem 8
#There is an extra semicolon after first line
 
#Problem 9
myload<-rep(0,30);
myload[1]<-400;
hapless<-rep(0,30);	#My assistant is hapless
hapless[1]<-120;

for (i in 2:30){
	myload[i]<-myload[i-1]*1.1;
	hapless[i]<-hapless[i-1]*1.2;
}
plot(myload, col='green');
par(new=TRUE);
plot(hapless, col='blue');

plot(log(myload), col='green', ylim=c(4,11));
par(new=TRUE);
plot(log(hapless), col='blue', ylim=c(4,11));


#Problem 9

hapless<-120;
mass<-hapless*0.000001;
day<-1;

while (mass<=55){
	day<-day+1;
	hapless<-hapless*1.2;
	mass<-hapless*0.000001;
}
day;
#It will take 73 days

#Problem 10
cat('\t', 'this is tab-indent. now i will show you', '\n', 'the new-', '\n', 'line character:', '\\n', '\n', '\n', 'and the backslash is', '\\', '\n', '\n', 'this formatted output stuff is slick!!');

#Problem 11
skinks<-read.table('/Users/Sean/Dropbox/RCourseFall2011/Week4/skinks.txt', sep='\t', header=TRUE);
meanSVL<-rep(0, length(spnames));

spnames<-unique(skinks$species);

for (i in 1:length(spnames)){
	subset<-skinks[skinks$species==spnames[i],];
	subset<-na.omit(subset);
	meanSVL[i]<-mean(subset$snout_vent);
}
names(meanSVL)<-spnames;

#Problem 12
maxSVL<-rep(0, length(spnames));
names(maxSVL)<-spnames;
i<-1;

for (i in 1:length(spnames)){
	subset<-skinks[skinks$species==spnames[i],];
	subset<-na.omit(subset);
	maxSVL[i]<-max(subset$snout_vent);
}

#Problem 13
sites<-rep(0, length(spnames));

for (i in 1:length(spnames)){
	subset<-skinks[skinks$species==spnames[i],];
	sites[i]<-length(unique(subset$site));
}
names(sites)<-spnames;
which(sites==max(sites));

#Problem 14
skinks[skinks$snout_vent==max(skinks$snout_vent),]$species