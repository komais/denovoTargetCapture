#1) Which of the following expressions might result in an infinite loop?
Why?
#a)
#while(TRUE)
#print('TRUE!')
#This will result in an infinite loop because the condition is always true-- nothing in the loop ever changes it to become false, so it keeps going.

#b)
#while(FALSE)
#print('NOT TRUE!')
#This is the same as a), but the condition is always false.  Nothing in the loop changes it, so it keeps printing.

#c)
#while(1)
#print("having fun in the loop!")
#(this will not be obvious. Is 1 TRUE or FALSE? How about 2? 0? 100?)
#1 is TRUE, so the loop would be infinite.  But on the other 
#For non-1 integers, this will not result in an infinite loop, because they are neither T or F.

#d)
#x<-5;
#while(x==5)
#cat('x =', x, sep=' ');
#This will result in an infinite loop, since x is always 5.

#e)
#x<-0;
#while (x < 100)
#x<-x+rgeom(1, .5);
#This will not result in an infinite loop.  rgeom(1, 0.5) is always greater than or equal to 0, so x will slowly get larger and eventually reach 100, therefore causing the loop to stop.

#f)
#x<-0;
#while (x != 100)
#x<-x+rgeom(1, .333);
#This might or might not result in an infinite loop-- you can't tell.  The output of rgeom(1, .333) varies, so if you happen to hit 100 exactly, the loop will stop.  However, if you go over 100 without hitting 100 exactly (as will usually be the case), the loop will continue infinitely.


system.time(rnorm(1000000));
system.time(sum(1:10000));


#Create vectors of random numbers with the following specifications and
#visually inspect histograms of each:
#(a) 1000 random numbers from a normal distribution with mean of 5 and standard deviation of 2.
a <- rnorm(1000, mean = 5, sd=2);
hist(a);

#(b) 100 random numbers from a normal distribution with mean of 0 and standard deviation of 10
b <- rnorm(100, mean = 0, sd = 10);
hist(b);

#(c) 100 random numbers from a normal distribution with a mean of 0 and a standard deviation of 2
c <- rnorm(100, mean = 0, sd = 2);
hist(c);

#(d) In the vector of length 100 you created for part (b), how many numbers are greater than 2? How about the vector of numbers you created for part (c)?
b.greater.than.2 <- (b > 2);
sum(b.greater.than.2);

c.greater.than.2 <- (c > 2);
sum(c.greater.than.2);


?rbinom;
?rgamma;
?rpois;
?rgeom;
?rexp;
?runif;

for(i in 1:5){
	print(runif(5));
}

for(i in 1:5){
	set.seed(1);
	print(runif(5));
}


#Random number exercises:
#2) Compare the total elapsed system time in seconds required to produce ten million (yes, 10,000,000) random numbers from the following distributions:
#(a) Normal, mean=0, standard deviation = 1
#(b) Poisson with lambda = 2
#(c) Uniform with min=0, max = 10
#(d) Geometric, with prob = 0.5
#(e) Binomial with n=1, prob = .5.

a <- system.time(rnorm(10000000));
b <- system.time(rpois(10000000, lambda = 2));
c <- system.time(runif(10000000, min = 0, max = 10));
d <- system.time(rgeom(10000000, 0.5));
e <- system.time(rbinom(10000000, 1, 0.5))

comparison <- rbind(a, b, c, d, e);
comparison;

#It is fastest to simulate from the uniform distribution.
#It is slowest to simulate from the geometric distribution.


#3) Does the time required to simulate from a normal distribution depend on the mean of the distribution from which you are simulating? Start with a seed of 1, and use a for loop to generate 5,000,000 random numbers from a normal distribution with mean of 10^0, 10^1, 10^2, 10^3...through 10^6. Print the timings returned by system.time to your console with each iteration. Provide your code

q3.output <- NULL

for(i in 0:6){
	set.seed(1);
	my.result<- system.time(rnorm(5000000, mean = 10^i));
	q3.output <- rbind(q3.output, my.result)
	cat('For 10^',i, ' elapsed time is ', my.result[3], '\n', 		sep = '')
}
#Or make a comparison table this way:
rownames(q3.output) <- c('10^0', '10^1', '10^2', '10^3', '10^4', '10^5', '10^6');
q3.output;

#4) rbinom(n, size = 1, prob= .5) simulates coin tossing with a fair coin (the prob argument is like ‘probability of heads’ in this context). Try a few runs with n = 5, 10, and 20. What are the 1s and 0s? Repeat the exercise with prob = 0.8 and see whether it clarifies things.
rbinom(5, size = 1, prob = 0.5);
rbinom(10, size = 1, prob = 0.5);
rbinom(20, size = 1, prob = 0.5);
#The 0's and 1's are the two different outcomes-- 1 = "success", 0 = failure.  You can relate this to heads and tails by defining 1 as heads and 0 as tails, or vice versa.

rbinom(5, size = 1, prob = 0.8);
rbinom(10, size = 1, prob = 0.8);
rbinom(20, size = 1, prob = 0.8);
#Here prob = 0.8 means you have an 80% chance of getting a success (1).  This simulates a coin toss with an unfair coin.

#5) You are interested in the distribution of times it takes to get a population of MAXPOPSIZE. In homework 4, I had you do 10 manual simulations and tabulate the generation times for each. Now I want you to automate it, such that you can do many trials. In other words, if you did 1000 trials of the above and counted the number of generations (NGENS) required to get to MAXPOPSIZE for each trial, what would it look like if you plotted a histogram of NGENS? This type of simulation project will arise repeatedly as you tackle more biologically relevant problems.
#(a) Write pseudocode (or modify the above pseudocode) to deal with this problem (you want to be able to run 1000 simulations, getting a new value of NGENS for each simulation).

#FOR each of 1000 trials, DO the following:

	#WHILE the current population size is less than the maximium 	population size (MAXPOPSIZE):

		#DO have each individual give birth (with geometric 			dist. of progeny, where mean # progeny = 2)
	
		#DO sum all progeny totals.  This give you the new 				population size.
	
		#Do append the new population size to the vector of 			population sizes.

#FOR each trial, store the value of number of generations (NGENS) it takes to get to the MAXPOPSIZE.

#Once all trials are complete, PLOT a histogram of all 1000 values of NGENS.

#(b) Only when you are absolutely convinced that your pseudocode is logically sound, you can implement your code. Do it piecewise. Start with what you know works. Add complexity one small step at a time. Never, ever try running large numbers of simulations until you are positive that you can get it to work for one (and then several) runs, or you may never figure out why it isn’t working. Make sure you have ample comments in your code. Do this with MAXPOPSIZE = 10000 (ten thousand), an initial population size of 20, an average of 2 progeny per individual, and set.seed equal to 1 at the very beginning of the simulation.
#(c) Plot a histogram of NGENS when you have successfully simulated 1000
#episodes of population growth.

NGENS.vector <- rep(NA, 1000);
#This is the vector in which I'm going to store the results from each replicate.

set.seed(1);

for( i in 1:1000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 20;
	popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .33333);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		NGENS <- NGENS + 1;  
 		
	}
	NGENS.vector[i] <- NGENS;
	}

hist(NGENS.vector);

#(d) Repeat 1000 simulations, but modify it such that the average number of progeny per individual is 3, rather than 2. To have an average of 3 progeny per individual, you have to have a parameter p in rgeom of 0.25. Do it again with an average of 4 progeny per individual (p = 0.20).

#3 progeny per individual
NGENS.vector <- rep(NA, 1000);

set.seed(1);

for( i in 1:1000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 20;
	popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .25);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		NGENS <- NGENS + 1;  
 		
	}
	NGENS.vector[i] <- NGENS;
	}

hist(NGENS.vector);


#4 progeny per individual
NGENS.vector <- rep(NA, 1000);

set.seed(1);

for( i in 1:1000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 20;
	popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .2);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		NGENS <- NGENS + 1;  
 		
	}
	NGENS.vector[i] <- NGENS;
	}

hist(NGENS.vector);

#(e) Write everything down in a single file that when sourced, does the following:
	#- Sets up the simulation (initializations, etc).
	#- Runs the simulation with average of 2 progeny per individual (1000 replicates)
	#- Prints, to your display, the following sentence:
		#For progeny = 2, mean number gens = x
	#where x is the mean number of generations to reach MAXPOPSIZE.
	#- Then: repeats simulation with mean number of progeny = 3 and, at the end, prints out 	the corresponding message.
	#- AND repeats yet again with a mean number of progeny = 4, prints out the message, 		etc.

source('question.5e.R');
#(Code is also pasted at the end of this HW)	

#6) Central Limit Theorem.
#(a) Generate 1000 pseudorandom numbers from a geometric distribution with parameter p = 0.25. 
#Now generate 1000 sums of 10 geometrically distributed random numbers with p = 0.25. In other words, you should end up with a vector of length 1000, where each element is defined by
#x[i] <- g1 + g2 + g3 + g4 + ... g10
#where g1 through g10 are just geometric random numbers. Note that you’ll have to draw 1000 * 10 geometric random numbers to do this exercise. You do not need to use two for loops for this (*hint: look at what I did in #7 in homework 4).
#Now generate 1000 sums of 1000 geometrically-distributed random numbers, with parameter p = .25. Plot histograms of the 3 sets of random numbers in the same plot window.

#This sets up the plotting window beforehand.
quartz.options(height = 5, width = 10, dpi = 72)
par(mfrow = c(1, 3));

#Here is the set of 1000 pseudorandom numbers
set.1 <- rgeom(1000, 0.25);
hist(set.1);

#Here is the set of 1000 sums of 10 geometrically distributed numbers.
set.2 <- rep(NA, 1000);
for(i in 1:1000){
	my.numbers <- rgeom(10, 0.25);
	my.sum <- sum(my.numbers);
	set.2[i] <- my.sum;
}
hist(set.2);

#Here is the set of 1000 sums of 1000 geometrically distributed numbers. 
set.3 <- rep(NA, 1000);
for(i in 1:1000){
	my.numbers <- rgeom(10, 0.25);
	my.sum <- sum(my.numbers);
	set.3[i] <- my.sum;
}
hist(set.3);

#Can you see evidence of the CLT?
#Yep.  The distribution becomes more normal-looking as you increase the number of sums.


#(b) Repeat the exercise above, but sample from a uniform distribution with a min of -1 and a max of 5 (again comparing the distribution of uniformly distributed numbers against sums of 10 and 1000 uniform random numbers.
#This sets up the plotting window beforehand.
quartz.options(height = 5, width = 10, dpi = 72)
par(mfrow = c(1, 3));

#Here is the set of 1000 pseudorandom numbers
set.1 <- runif(1000, min = -1, max = 5);
hist(set.1);

#Here is the set of 1000 sums of 10 geometrically distributed numbers.
set.2 <- rep(NA, 1000);
for(i in 1:1000){
	my.numbers <- runif(10, min = -1, max = 5);
	my.sum <- sum(my.numbers);
	set.2[i] <- my.sum;
}
hist(set.2);

#Here is the set of 1000 sums of 1000 geometrically distributed numbers. 
set.3 <- rep(NA, 1000);
for(i in 1:1000){
	my.numbers <- runif(10, min = -1, max = 5);
	my.sum <- sum(my.numbers);
	set.3[i] <- my.sum;
}
hist(set.3);

#Definitely evidence for the CLT here.


#7) Consider the binomial random number generator (rbinom).
#(a) rbinom(1000, size=1, prob=0.7)
#This simulates 1000 random numbers, where each random number is the number of heads that occurred in 1 coin flip, where the probability of heads is 0.7 for each flip.

#(b) rbinom(1, size=14, prob=0.5) . Also – what are the largest and smallest numbers that could be returned by this? No using your computer here!
#This simulates 1 random number.  This random number is the number of heads that occurred in 14 coin flips, where the probability of heads is 0.5 for each flip.
#The largest possible number is 14, the smallest is 0.  (But these both would be unlikely.)

#(c) sum(rbinom(1000, size=1, prob=0.5)) . What is this number? What is the largest value you could obtain?
#The code inside the sum function is a simulation of 1000 random numbers, where each random number is the number of heads that occurred in 1 coin flip, where the probability of heads is 0.5 for each flip.  Therefore, this line of code represents the sum of the 1000 numbers... or the total number of heads among the 1000 flips.
#The largest possible value you could obtain is 1000.

#(d) challenge: Re-write the expression from part (c) such that it returns a number with exactly the same distribution as sum(rbinom(1000, size=1, prob=0.5)) , but do not use the sum function. Hint: this can and should be done with at least five fewer characters (e.g., A, B, C, +, }) than the expression in part (c).
rbinom(1, size = 1000, prob = 0.5);

#8. I am a rabid, compulsive gambler.
#I have had a string of bad luck, and I am concerned that my coin is unfair and unjust. In the past 200 flips of my coin, I have observed a total of 139 heads.
#I want to know whether my coin is fair (e.g., equal probabilities of heads and tails). Devise an experiment involving simulations from the binomial distribution that will allow you to assess whether my coin is fair.
#What is the probability of obtaining a test statistic value as large or larger than that which we observe (139 of 200 ) ? This is not as hard as it seems: this probability can be estimated simply as the frequency of simulated values as large or larger than our observed test statistic.

#(a) a brief statement of the logic behind the test. Here are some questions to help guide your thinking:
#What do we mean by “experiment”?
#How many total “experiments” will you do?
#What are you going to count/tabulate for each experiment?
#By experiment, we mean that we will use the binomial distribution to simulate coin flips.  To mimic the situation described, we can simulate many trials of 200 coin flips.
#A fair coin would have probability of heads = 0.5, so this what we will use as our null hypothesis.
#I will start out with 5000 simulations ('experiments') of 200 coin flips.
#For each experiment, I will count the total number of heads obtained in 200 coin flips.  I will store this information for each experiment, and when I'm done with the 5000 experiments, I will calculate the proportion of trials in which the success rate is greater than 139/200 (the observed test statistic).

#(b) Pseudocode required to perform the test
#Generate a set of 200 random numbers from a binomial distribution with probability of success = 0.5.
#Repeat this many (5000) times.
#Store the number of heads for each replicate as an element in a vector.
#Convert these numbers to frequencies, and count how many are greater than or equal to the observed frequency (139/200).
#Take the number that are greater and divide it by 5000 (the total number of trials) to get the frequency of simulated values as large or larger than our observed test statistic.
#Print this frequency as instructed.

#(c) the actual code that performs the test (with the null distribution determined by 5000 simulations of the test statistic). Upon completion, your code should print to your console something like this:
#Probability of the data under the null hypothesis: Z
#where Z is the relevant probability.

test.stat <- 139/200
num.heads.200.vector <- rep(NA, 5000);

for(i in 1:5000){
	
	num.heads.200.vector[i] <- sum(rbinom(200, size = 1, p = 		0.5));
	
}
heads.freqs <- num.heads.200.vector/200;
greater <- heads.freqs >= test.stat;
Z <- sum(greater)/5000;
cat('Probability of the data under the null hypothesis: ', Z, sep = '');








#Code for 5e:
#Set up plots
quartz.options(height = 5, width = 10, dpi = 72)
par(mfrow = c(1, 3));
breaks <- 0:15;

#2 progeny
NGENS.vector <- rep(NA, 1000);

set.seed(1);

for( i in 1:1000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 20;
	popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .33333);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		NGENS <- NGENS + 1;  
 		
	}
	NGENS.vector[i] <- NGENS;
	
	}

hist(NGENS.vector, breaks = 0:15, xlim = range(breaks), main = '2 progeny', cex.main = 2);
cat('For progeny = ', 2, ', mean number gens = ', mean(NGENS.vector), '\n', sep = '');


#3 progeny
NGENS.vector <- rep(NA, 1000);

set.seed(1);

for( i in 1:1000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 20;
	popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .25);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		NGENS <- NGENS + 1;  
 		
	}
	NGENS.vector[i] <- NGENS;
	
	}

hist(NGENS.vector, breaks = 0:15, xlim = range(breaks), main = '3 progeny', cex.main = 2);
cat('For progeny = ', 3, ', mean number gens = ', mean(NGENS.vector), '\n', sep = '');


#3 progeny
NGENS.vector <- rep(NA, 1000);

set.seed(1);

for( i in 1:1000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 20;
	popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .2);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		NGENS <- NGENS + 1;  
 		
	}
	NGENS.vector[i] <- NGENS;
	
	}

hist(NGENS.vector, breaks = 0:15, xlim = range(breaks), main = '4 progeny', cex.main = 2);
cat('For progeny = ', 4, ', mean number gens = ', mean(NGENS.vector), '\n', sep = '');







