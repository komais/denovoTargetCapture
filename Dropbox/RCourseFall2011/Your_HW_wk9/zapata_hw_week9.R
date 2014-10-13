# Homework week 9

# 1. corresponds to the first example.

# 2. Pseudocode:

# Initialize vector to track position; length = number of simulations
# For each simulation
# Set initial position fo Brownie to x = 0
# Set time steps
# 	For each time step
# 		Choose step size for Brownie from normal distribution m = 0, sd = 1
#		Get new postion by adding step size to current position
#	Append new location to vector that tracks position

# 3. Confusing conditionals
# 3a. Possible color = blue (only), bird = hammerkop (only), event = marathon, food = hamhock
# 3b. Color has to be blue and bird anything but hammerkop or pigeon 
# 3c. No, because to observe "I love birds" one only has to observe "not quite a loon..."
# 3d. All are mutually exclusive

# 4. When people are exactly 21

# 5. Function to test if ANY number is a prime number
rm(list = ls());

testPrime <- function(numberToTest){
	cat("My number to test is: ", numberToTest, "\n");
	divisors <- c(1:numberToTest);
	#cat("All the divisors less than or equal to:", numberToTest, "are: ", divisors, "\n")
	rmd <- rep(0, length(divisors));
	for (i in 1:length(divisors)){;
		rmd[i] <- numberToTest %% divisors[i]
	}
	#cat("The remainder of dividing my number by all divisors less than or equal to itself are:", rmd, "\n");
	if (length(which(rmd == 0)) == 2){
		# number is a prime number
		cat(numberToTest, "is a prime number!\n");
	}
	else{
		# number is not a prime number 
		cat(numberToTest, "is not a prime number!\n");
	}
}

testPrime(2);
testPrime(5);
testPrime(10);
testPrime(0);
testPrime(1);
testPrime(8.4);
testPrime(-20);

# 6. Vector of random numbers and printing
set.seed(1);
x <- rnorm(10);
#x
for (i in 1:length(x)){
	# evaluate whether x is less than or equal to -0.5
	if (x[i] <= -0.5){
		cat(x[i], "is less than -0.5\n");
	# or is between -0.5 and 0.5		
	}else if (x[i] > -0.5 && x[i] < 0.5){
		cat(x[i], "is in the middle!\n");
	# or is anythig else
	}else{
		cat(x[i], "Whoper!\n");
	}
}

# 7. FizzBuzz
for (i in 1:100){
	rmd5 <- i %% 5
	rmd3 <- i %% 3
	# Evaluate multiples of 3
	if (rmd3 == 0){
		cat("Fizz");
	}
	# Evaluate multiples of 5
	if (rmd5 == 0){
		cat("Buzz");
	}
	# Numbers not multiples of 3 AND 5
	if (rmd3 != 0 && rmd5 != 0){
		cat(i);
	}
	# Make new line after evaluating each number; if a number is multiple of 3 AND 5 FizzBuzz will appear in the same line
	cat("\n")	
}

# 8. Function with multiple if statements

myFxn <- function(x, y){
	if (x >= 0 && y >=0);
		res <- x + y;
	if ( x >=0 && y < 0);
		res <- x + y^2;
	if (x < 0 && y >= 0);
		res <- x^2 + y;
	if (x < 0 && y < 0);
		res <- x^2 + y^2;
	cat(res)	
}

myFxn(x=0, y=1);
myFxn(x=1, y=1);
myFxn(x=-1, y=-10);
myFxn(x=-5, y=3);
myFxn(x=3, y=-5);

# 9. Population growth in bad and good years. In good years use geometric distribution with p=0.25, in bad years use geometric distribution with p=0.5.  When number of generations is odd, the population expereicnes good year, and when it's even, a a bad year

set.seed(1);
gen <- rep(0, 5000);
for (i in 1:length(gen)){
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 10;
	gen_time <- 0;
	popvector <- curr_pop_size;
	while (curr_pop_size < MAXPOPSIZE){
		#bad year, even number of generations
		if (gen_time %% 2 == 0){
			curr_pop_size <- sum(rgeom(curr_pop_size, 0.5));
		#good year, odd nuber of generations
		}else{
			curr_pop_size <- sum(rgeom(curr_pop_size, 0.25));
		}
		gen_time <- gen_time + 1;
		popvector <- c(popvector, curr_pop_size);
	}
	gen[i] <- length(popvector);
}
#gen
hist(gen); # It takes too long to run this simulation with 5000 population growth events. I tried it with 40 and it works.
