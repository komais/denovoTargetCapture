#class exercise: brownian motion model
x <- 0
set.seed(1)
for (i in 1:10) {
	x <- x + rnorm(1,mean=0,sd=2)
	cat(x, "\n")
	}

#1. infinite loops
#(a) might result in infinite loop because nothing exists to make something not true
#(b) might result in infinite loop because nothing exists to make something true
#(c) is an infinite loop for sure because '1' is true, so the while loop will always be executed
#(d) is an infinite loop because x is 5, so the while loop is always going to be true and executed
#(e) shouldn't be an infinite loop as x will eventually get bigger than 100
#(f) might be an infinite loop because it seems unlikely that you will ever make the loop's condition not true -- i.e., that x will exactly equal 100 and the loop will break

#digression on random numbers
#(a) 
hist(rnorm(1000, mean = 5, sd = 2))
#(b) 
hist(rnorm(100, mean = 0, sd = 10))
#(c)
hist(rnorm(100, mean = 0, sd = 2))
#(d), for part b
sum(rnorm(100, mean = 0, sd = 10) > 2)
#(d), for part c
sum(rnorm(100, mean = 0, sd = 2) > 2)

#2 simulating random numbers
#(a) Normal, mean=0, standard deviation = 1 
system.time(rnorm(1e7,mean=0,sd=1))
#(b) Poisson with lambda = 2
system.time(rpois(1e7,2))
#(c) Uniform with min=0, max = 10 
system.time(runif(1e7,min=0,max=10))
#(d) Geometric, with prob = 0.5 
system.time(rgeom(1e7,0.5))
#(e) Binomial with n=1, prob = .5
system.time(rbinom(1e7,1,0.5))
#it is fastest to simulate from uniform; slowest from geometric

#3 time to simulate
for (i in 0:6) {
	set.seed(1)
	cat(system.time(rnorm(5e6,10^i,sd=0))[1], "\n")
	}
#this is weird -- if I separate out the code into individual parts, the amount of time does differ...

#4 rbinom exploration
rbinom(5,size=1,prob=0.5) 
#1 and 0 means if the number drawn is greater than 0.5 or not
rbinom(5,size=1,prob=0.8) 

#5 distribution of times
#(a) pseudocode -- do i have to? :(
#(b)
trials <- 1000
ngen <- numeric(trials)
set.seed(1);
for (i in 1:trials) {
	MAXPOPSIZE <- 10000; 
	curr_pop_size <- 20;
	popvector <- curr_pop_size; 
	while (curr_pop_size < MAXPOPSIZE) { 
		babies <- rgeom(curr_pop_size, .33333); 
		curr_pop_size <- sum(babies); 
		popvector <- c(popvector, curr_pop_size);
	}
	ngen[i] <- length(popvector)
}
#(c)
hist(ngen)
#(d)
trials <- 1000
ngen <- numeric(trials)
set.seed(1);
for (i in 1:trials) {
	MAXPOPSIZE <- 10000; 
	curr_pop_size <- 20;
	popvector <- curr_pop_size; 
	while (curr_pop_size < MAXPOPSIZE) { 
		babies <- rgeom(curr_pop_size, .25); 
		curr_pop_size <- sum(babies); 
		popvector <- c(popvector, curr_pop_size);
	}
	ngen[i] <- length(popvector)
}
#(d), continued
trials <- 1000
ngen <- numeric(trials)
set.seed(1);
for (i in 1:trials) {
	MAXPOPSIZE <- 10000; 
	curr_pop_size <- 20;
	popvector <- curr_pop_size; 
	while (curr_pop_size < MAXPOPSIZE) { 
		babies <- rgeom(curr_pop_size, .20); 
		curr_pop_size <- sum(babies); 
		popvector <- c(popvector, curr_pop_size);
	}
	ngen[i] <- length(popvector)
}
#(e) mind blowing time
#an average of 2,3 and 4 kids respectively
kids <- c(0.33,0.25,0.20)
names(kids) <- c("2","3","4")
trials <- 1000
ngen <- list(numeric(trials),numeric(trials),numeric(trials))
xmax <- 0
xmin <- 10000
for (k in 1:length(kids)) {
	set.seed(1);
	for (i in 1:trials) {
		MAXPOPSIZE <- 10000; 
		curr_pop_size <- 20;
		popvector <- curr_pop_size; 
		while (curr_pop_size < MAXPOPSIZE) { 
			babies <- rgeom(curr_pop_size, kids[k]); 
			curr_pop_size <- sum(babies); 
			popvector <- c(popvector, curr_pop_size);
			}
		ngen[[k]][i] <- length(popvector)
		if (length(popvector) > xmax) {
			xmax <- length(popvector)
			}
		if (length(popvector) < xmin) {
			xmin <- length(popvector)
			} 	
		}
	cat("For progeny ", names(kids)[k], ", mean number gens =", mean(ngen[[k]]), "\n")
	}	
par(mfrow=c(1,3))
for (n in 1:length(ngen)) {
	hist(ngen[[n]],xlim=c(xmin,xmax),main=paste("Histogram of kids ", names(kids)[n]))
	}

#6 central limit theorem
#(a)
nosum <- rgeom(1000,0.25)
sums10 <- numeric(1000)
for (i in 1:1000) {
	sums10[i] <- sum(rgeom(10,0.25))
	}
sums1000 <- numeric(1000)
for (i in 1:1000) {
	sums1000[i] <- sum(rgeom(1000,0.25))
	}	
par(mfrow=c(1,3)); hist(nosum); hist(sums10); hist(sums1000);
#b	
nosum <- runif(1000,-1,5)
sums10 <- numeric(1000)
for (i in 1:1000) {
	sums10[i] <- sum(runif(1000,-1,5))
	}
sums1000 <- numeric(1000)
for (i in 1:1000) {
	sums1000[i] <- sum(runif(1000,-1,5))
	}	
par(mfrow=c(1,3)); hist(nosum); hist(sums10); hist(sums1000);

#7 binomial random generator
#(a) the outcome of 1000 experiments (where success is 70% likely)
#(b) the number of successes we had in 14 tries, where success is 50% likely -- smallest is 0 and largest is 14
#(c) the number of successes in 1000 experiments (where success is 50% likely); largest number is 1000, but seems super unlikely
#(d) rbinom(1,size=1000,prob=0.5)

#8 rabid compulsive gambling
#(a) Assuming my coin is fair, I should be able to count the number of "successes", or heads in 200 coin flips. Do this a gazillion times and see how often I get 139 or greater... Because R is so fast, I might as well sample this a lot, so I am going to do this a lot.
#(b) feeling brash, so no pseudocode
#(c)
tests <- 5000
heads <- numeric(tests)
for (i in 1:tests) {
	heads[i] <- rbinom(1,size=200,prob=0.5)
	}
prob <- sum(heads >= 139)/tests
cat("Probability of the data under the null hypothesis: ", prob, "\n")
	