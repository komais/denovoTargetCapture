#Homework week 5:
#1)
#Infinite loop: a),b),c),d) (obvious), f) possible because 99+2!=100  
rnorm(1000,mean=5,sd=2)
a<-rnorm(100,mean=0,sd=10)
b<-rnorm(100,mean=0,sd=2)
length(which(a[]>2))
length(which(b[]>2))
rnorm(5,mean=5,sd=2)
set.seed(0)
rnorm(5,mean=5,sd=2)

#2)
system.time(rnorm(10000000,mean=0,sd=1))
system.time(rpois(10000000,lambda=2))
system.time(runif(10000000,min=0,max=1))
system.time(rgeom(10000000,prob=0.5))
system.time(rbinom(10000000,size=1,prob=.5))

#Fastest: runif Slowest: rgeom

#3)
set.seed(10)
for (i in 0:6){
	print(system.time(rnorm(5000000, mean=10^i,sd=1)),sep="\n");
}

#4)
#5)

#FOR 1000 iterations

#	WHILE the number of progeny is less than the maximum allowable pop
#	size:
#		DO have each individual give birth (with geometric dist. of
#		progeny, where mean # progeny = 2)
#		DO Sum all the progeny totals – this is the new population size
#		DO append the new population size to the vector of population
#		sizes
#		DO have a variable that count generations until the loop is over
#	
#	STORE number of generations
#HIST

par(mfrow=c(2,2));
for (k in 2:4){
	ngens<-0
	for (i in 1:1000){
		MAXPOPSIZE <- 10000;
		curr_pop_size <- 20;
		popvector <- curr_pop_size;
		set.seed(i);
			while (curr_pop_size < MAXPOPSIZE){
				babies <- rgeom(curr_pop_size, 1/(k+1));
				curr_pop_size <- sum(babies);
				popvector <- c(popvector, curr_pop_size);
			}
		ngens<-c(ngens,length(popvector))
	}
	ngens<-ngens[-1]
	ngens
	hist(ngens,breaks=(0:25))
	cat("For progeny =",k,"mean numbers gens =",mean(ngens),sep="\n")
}

#6)
#a)
set.seed(1)

a<-rgeom(1000,prob=0.25)

somme10<-0
for (i in 1:1000){
	somme10<-c(somme10,sum(rgeom(10,prob=0.25)));
}
somme10<-somme10[-1]

rgeom(1000,prob=0.25)
somme1000<-0
for (i in 1:1000){
	somme1000<-c(somme1000,sum(rgeom(10,prob=0.25)));
}
somme1000<-somme1000[-1]


par(mfrow=c(2,2));
hist(a);
hist(somme10);
hist(somme1000);
shapiro.test(somme10);
shapiro.test(somme1000);

#b)
set.seed(1)

a<-runif(1000,min=-1,max=5)

somme10<-0
for (i in 1:1000){
	somme10<-c(somme10,sum(runif(10,min=-1,max=5)));
}
somme10<-somme10[-1];

rgeom(1000,prob=0.25)
somme1000<-0
for (i in 1:1000){
	somme1000<-c(somme1000,sum(runif(10,min=-1,max=5)));
}
somme1000<-somme1000[-1];


par(mfrow=c(2,2));
hist(a);
hist(somme10,breaks=1:50);
hist(somme1000,breaks=1:50);
shapiro.test(somme10);
shapiro.test(somme1000);

#7)
#(a) rbinom(1000, size=1, prob=0.7)
#1000 pseudo RN of 1 toss with a biased coin

#(b) rbinom(1, size=14, prob=0.5) . Also – what are the largest
#and smallest numbers that could be returned by this? No using your
#computer here!
#1 pseudo RN of 14 toss of a perfect coin min=0, max=14

#(c) sum(rbinom(1000, size=1, prob=0.5)) . What is this
#number? What is the largest value you could obtain?
#the sum of 1000 pseudo RN each can be equal to 0 or 1 in same probabilities
#min=0 max=1000

#(d)
rbinom(1,size=1000,prob=0.5)

#8)
#a)
#By experiment we mean simulations.
#We will have to do enough simulations to create an accurate null hypothesis 
#distribution.
#For each experiment, we will count the number oh heads in 200 trial.

#b)

#DO simulate the number of heads in 200 trials with a .5 prob
#DO count how many values are above the test statistic under null hypothesis	
#DO Probability
#c)
hist(rbinom(5000,size=200,prob=0.5),breaks=50:150)
#Probability of the data under the null hypothesis: 
factorial(200)/(factorial(139)*factorial(61))*(0.5)^200
#or
combn(200,139)*0.5^200#with combinat package

#Windows calculator gives:1,0055481465114485942060386622903e-8

a<-rbinom(10000000,size=200,prob=.5)
length(which(a[]>139))

#Possible, but the coin is not likely to be fair.
