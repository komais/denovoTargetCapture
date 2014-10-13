#Week 5 homework

#Problem 1
#a could result in an infinite loop - if statement starts off true. no way to make it false
#b same as a) if statement is false
#c will result in an infinite loop if 1 is true
#d infinite loop - no way for x to not equal 5
#e will not result in an infinite loop - eventually addition of random numbers to x will make it greater than 100
#f will almost certainly result in infinite loop, unless addition of random number to x during iteration makes it exactly equal to 100

#Random numbers
#1a)
randa<-rnorm(1000, 5, 2);
#b)
randb<-rnorm(100,0,10);
#c
randc<-rnorm(100,0,2);
#d)
sum(randb>=2);
#44 of the numbers from part b are greater than 2
sum(randc>=2);
#19 of the numbers from part c are greater than 2

for (i in 1:5){
	set.seed(1);
	print(runif(5));
}
#Problem 2
system.time(rnorm(10000000, 0, 1));
system.time(rpois(10000000, 2));
system.time(runif(10000000, 0, 10));
system.time(rgeom(10000000, 0.5));
system.time(rbinom(10000000, 1, 0.5));
#It is fastest to simulate from the uniform distribution
#It is slowest to simulate from the geometric distribution

#Problem 3
set.seed(1)
for (i in 1:6){
	print(system.time(rnorm(5000000, 10^i)));	
}

#Problem 4
rbinom(20, 1, 0.5);
#The ones are the times when the outcome was 1 (success)
rbinom(20, 1, 0.8)

#Problem 5
#a FOR 1000 replicates
	#WHILE the number of progeny is less than the maximum allowable pop size:
	#	DO have each individual give birth (with geometric dist. of progeny, where mean # 			progeny=2)
	#	DO Sum all the progeny toals - this is thenew population size
	#	DO append the new population size to the vector of population sizes
	#	Do record the number of generations it took to exceed MAXPOPSIZE
	
#5b
set.seed(1);
timevector2<-numeric(1000);

for (i in 1:1000){
	MAXPOPSIZE<-5000;
	curr_pop_size<-20;
	popvector<-curr_pop_size;
	while(curr_pop_size< MAXPOPSIZE){
		babies<-rgeom(curr_pop_size, 0.3333);
		curr_pop_size<-sum(babies);
		popvector<-c(popvector, curr_pop_size);
	}
	timevector2[i]<-length(popvector);
}
cat('For progeny = 2, mean number gens =', mean(timevector2), sep=' ')

#5c
hist(timevector)

#5d with an average of three progeny:
set.seed(1);
timevector3<-numeric(1000);

for (i in 1:1000){
	MAXPOPSIZE<-5000;
	curr_pop_size<-20;
	popvector<-curr_pop_size;
	while(curr_pop_size< MAXPOPSIZE){
		babies<-rgeom(curr_pop_size, 0.25);
		curr_pop_size<-sum(babies);
		popvector<-c(popvector, curr_pop_size);
	}
	timevector3[i]<-length(popvector);
}
cat('For progeny = 3, mean number gens =', mean(timevector3), sep=' ')

#with an average of four progeny:
set.seed(1);
timevector4<-numeric(1000);

for (i in 1:1000){
	MAXPOPSIZE<-5000;
	curr_pop_size<-20;
	popvector<-curr_pop_size;
	while(curr_pop_size< MAXPOPSIZE){
		babies<-rgeom(curr_pop_size, 0.2);
		curr_pop_size<-sum(babies);
		popvector<-c(popvector, curr_pop_size);
	}
	timevector4[i]<-length(popvector);
}
cat('For progeny = 4, mean number gens =', mean(timevector4), sep=' ')

#In separate file, have above code, plus:

par(mfrow=c(1,3));
hist(timevector2, xlim=c(4,11));
hist(timevector3, xlim=c(4,11));
hist(timevector4, xlim=c(4,11));

source(Ngen_simulation.R);

#Problem 6a
rand_geo<-rgeom(1000, 0.25);

sum10_geo<-numeric(1000);
for (i in 1:1000){
	sum10_geo[i]<-sum(rgeom(10, 0.25));
}


sum1000_geo<-numeric(1000);
for (i in 1:1000){
	sum1000_geo[i]<-sum(rgeom(1000, 0.25));
}

par(mfrow=c(1,3));
hist(rand_geo);
hist(sum10_geo);
hist(sum1000_geo);

#6b
rand_unif<-runif(1000, -1,5);

sum10_unif<-numeric(1000);
for (i in 1:1000){
	sum10_unif[i]<-sum(runif(1000, -1,5));
}


sum1000_unif<-numeric(1000);
for (i in 1:1000){
	sum1000_unif[i]<-sum(runif(1000, -1,5));
}

par(mfrow=c(1,3));
hist(rand_unif);
hist(sum10_unif);
hist(sum1000_unif);

#Problem 7
#a	Simulates 1000 random numbers, where each random number is 1 coin toss where the probability of success (heads) is 0.7
#b Simulates one random number, which is the sum of 14 coin tosses with a fair coin (prob of heads=0.5)
	# smalles number that could be returned is 0, largest is 14
#c	Simulates 1000 coin flips with a fair coin, then takes the sum of all these numbers
	#Largest possible value is 1000 (1000 heads), smallest is 0 (zero heads)
#d
rnorm(1, mean=500);

#a Flipping the coin 200 times is one realization of the experiment. We need to run this a bunch of times (like 5000) and see how often you expect to get 139 heads.
#b FOR number of simulations
	#DO Draw 200 numbers from a binomial distribution with p=0.5
	#DO Sum these numbers to figure out how many "heads" you get each time
	#Store this number in a vector
#Figure out how many elements of the vector are larger than 139.
#Divide this number by the number of simulations to get a probability of the observed data, if the coin were fair.


successes<-numeric(5000);
for (i in 1:5000){
	successes[i]<-rbinom(1, 200, prob=0.5);
}
fair<-sum(successes>=139);
Z<-fair/5000;
cat('Probablility of the data under the null hypothesis:', Z, sep=' ');

