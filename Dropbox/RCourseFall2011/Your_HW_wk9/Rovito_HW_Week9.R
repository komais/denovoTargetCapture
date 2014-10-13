#HW Week 9

#1) Pseudocode corresponds to first example where vector of locations is not stored
#2)

#Set number of trials to 5000
#Set number of steps to 50
#Make a numeric vector of length 5000

#For each of 5000 trials
	#Set initial position of Brownie to x = 0
	#For each time step
		#Choose step size for Brownie from normal distribution
		#Get new position by addint step size to current position
	#Record final position of Brownie after 50 steps
	
#3) a) only possible values are color = blue, bird = hammerkop, event = marathond, food = hamhock	

#b) color = blue, bird is anything but hammerkop or pigeon

#c) no - if "I love birds" is printed, "not quite a loon..." will also be output

#d) mutually exclusive pairs of expressions: "yum"  and "not quite a loon...", "yum" and "I love birds", "yum" and "ostrich???", "yum" and "green", "not quite a loon" and "ostrich", "not quite a loon" and "green", "I love birds" and "ostrich???", "I love birds" and "green", "ostrich???" and "green"

#4 Robocop fails when someone is exactly 21 years old

#5
testPrime <- function(numberToTest){
	prime <- TRUE;
	for (i in 2: (numberToTest-1)){
		if (numberToTest %% i == 0){
			prime <-FALSE;
		}
	}
	if (prime == FALSE){
		cat(numberToTest, 'is not prime\n');
	} else {
		cat(numberToTest, 'is prime\n')
	}	
}

#6
set.seed(1)
x <- rnorm(10)

for (i in 1:10){
	if (x[i] < -0.5){
		cat(x[i], 'is less than -0.5!\n');
	} else if (x[i] > -0.5 & x[i] < 0.5){
		cat(x[i], 'is in the middle!\n');
	} else {
		cat(x[i], '. Whopper!\n', sep='');
	}
}

#7
for (i in 1:100){
	if ((i %% 3) == 0){
		if (i %% 5) == 0){
			cat('FizzBuzz\n');
		} else {
			cat('Fizz\n');
		}
	} else if ((i %% 5) == 0){
			cat('Buzz\n');
		} else {
		cat(i, '\n');
	}
}
# not clever enough to do it with only 3 conditionals

#8

myFxn <- function(x, y){
	if (x >= 0 & y >= 0){
		res <- x + y;
	}
	if (x >=0 & y < 0){
		res <- x + y^2;
	}
	if (x < 0 & y >= 0){
		res <- x^2 + y;
	}
	if (x < 0 & y < 0){
		res <- x^2 + y^2;
	}
	return(res)
}

#9 a)
MAXPOPSIZE <- 10000
curr_pop_size <- 10
set.seed(1);

gen <- 1;
while (curr_pop_size < MAXPOPSIZE){
	if (gen %% 2 == 0){
		babies <- rgeom(curr_pop_size, 0.5);
	} else {
		babies <- rgeom(curr_pop_size, 0.25);
	}
	curr_pop_size <- sum(babies);
	gen <- gen + 1;
}

#b
genvector <- numeric(5000);
MAXPOPSIZE <- 10000;

for (i in 1:5000){
	curr_pop_size <- 10
	gen <- 1
	while (curr_pop_size < MAXPOPSIZE){
		if (gen %% 2 == 0){
			babies <- rgeom(curr_pop_size, 0.5);
		} else {
			babies <- rgeom(curr_pop_size, 0.25);
		}
		curr_pop_size <- sum(babies);
		gen <- gen + 1;
	}
	genvector[i] <- gen;
}
hist(genvector)


#10 
#a
#a Problem: to simulate genetic drift for fifty generations, given a starting population size of 20 and equal initial allele frequencies
#b inputs: initial population size (20), initial allele frequenecies (a=b=0.5), number of generations (50), a numeric vector of length equal to the number of generations
	#outputs: a vector with length equal to the number of generations, with each element equal to the number of a and b alleles in the population at that generation
#c Pseudocode:

	#set initial population size to 20
	#set number of alleles to twice population size
	#set initial population allele frequencies to 0.5
	#initialize a numeric vector of length equal to the number of generations
	#for each of 50 generations
		#calculate number of alleles given current allele frequencies
		#sample number of alleles with replacement from population
		#calculate new allele frequencies
		#store new allele frequencies in ith element of pop vector
		
popsize <- 20;
num_alleles <- 2 * popsize;
a <- 0.5;
ngen <-50;
alleleFreq <- numeric(ngen);

for (i in 1:ngen){
	#i <- 1;
	alleles <- c(rep('a', a * num_alleles), rep('b', (1 - a) * num_alleles));
	#alleles;
	alleles <- sample(alleles, length(alleles), replace = TRUE);
	#alleles;
	onlyAs <- alleles[alleles == 'a'];
	#length(onlyAs)
	a <- length(onlyAs) / num_alleles;
	alleleFreq[i] <- a;
}	

#10b
#a) statement of problem: to determine how long each simulation of genetic drift runs before an allele is fixed, and then to generate a distribution of these waiting times
#b) inputs: all those from the first part, plus a numeric vector of length 5000

#c) Pseudocode:

	#set initial population size to 20
	#set number of alleles to twice population size
	#initialize a numeric vector of length equal to the number of generations
	
	#for each of 5000 simulations
		#set number of generations to zero
		#set initial population allele frequencies to 0.5
		#while frequency of a allele is not equal to 0 or 1.0
			#calculate number of alleles given current allele frequencies
			#sample number of alleles with replacement from population
			#calculate new allele frequencies
			#store new allele frequencies in ith element of pop vector
			#add one to generation count
		#store number of generations when allele went to fixation
#d)

popsize <- 20;
num_alleles <- 2 * popsize;
numTrials <- 5000;
fixed <- numeric(numTrials);

for (i in 1:numTrials){
	a <- 0.5;
	ngen <- 0;
	#i <- 1;
	#cat('Trial', i, '\n');
	# make initial vector of alleles with starting frequencies
	alleles <- c(rep('a', a * num_alleles), rep('b', (1 - a) * num_alleles));

	while (a != 0 & a != 1){
		#sample allele vector with replacement to get new allele vector of same length
		alleles <- sample(alleles, length(alleles), replace = TRUE);
		#alleles;
		onlyAs <- alleles[alleles == 'a'];
		#length(onlyAs)
		a <- length(onlyAs) / num_alleles;
		#cat('Frequency of a is', a, '\n');
		ngen <- ngen + 1;
		#cat('Generation number is', ngen, '\n');
	}
	fixed[i] <- ngen;
}	
hist(fixed)


#12 Two-dimensional Brownian motion walk

#initialize starting x and y values to 0, 0
#specify number of steps
#initialize position vectors for x and y of length numSteps
# for each of steps
	#draw a random number from N(0,1) and add to x coordinate
	#draw a random number from N(0,1) and add to y coordinate
	
#plot x and y using lines function
#a)

numSteps <- 100;
xpos <- numeric(numSteps + 1);
ypos <- numeric(numSteps + 1);
stdev <- 1;

xpos[1] <- 0;
ypos[1] <- 0;
for (i in 1 : numSteps + 1){
	#i <- 1;
	xstep <- rnorm(1, 0, stdev);
	xpos[i] <- xpos[i] + xstep;
	#cat('New x position is', xpos[i + 1], ', ');
	ystep <- rnorm(1, 0, stdev);
	ypos[i] <- ypos[i] + ystep;
	#cat('New y position is', ypos[i + 1], '.\n');
}

quartz.options(width = 8, height = 8, dpi = 72);
plot.new();
plot.window(xlim = c(-10,10), ylim = c(-10,10));

lines(xpos, ypos);

#b)
numSteps <- 100;
xpos <- numeric(numSteps + 1);
ypos <- numeric(numSteps + 1);
stdev <- 4;

xpos[1] <- 0;
ypos[1] <- 0;
for (i in 1 : numSteps + 1){
	#i <- 1;
	xstep <- rnorm(1, 0, stdev);
	if (xpos[i] + xstep > 10){
		extra <- (xpos[i] + xstep) - 10
		if (extra < 10){
		xpos[i] <- xpos[i] - extra;
		cat('reflect back by', extra, '\n');
		} else {
		xpos[i] <- xpos[i] - (10 - extra);
		cat('reflect back by', 10 - extra, '\n');
		}	
	} else if (xpos[i] + xstep < 0) {
		extra <- 0 - (xpos[i] + xstep);
		xpos[i] <- extra;
	} else {
		xpos[i] <- xpos[i] + xstep;
	}
	#cat('New x position is', xpos[i + 1], ', ');
	ystep <- rnorm(1, 0, stdev);
	ypos[i] <- ypos[i] + ystep;
	#cat('New y position is', ypos[i + 1], '.\n');
}

quartz.options(width = 8, height = 8, dpi = 72);
plot.new();
plot.window(xlim = c(-1,11), ylim = c(-1,11));

polygon(x = c(0, 0, 10, 10), y = c(0, 10, 10, 0));
lines(xpos, ypos);
