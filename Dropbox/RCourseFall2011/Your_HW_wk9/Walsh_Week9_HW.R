# Question 3
# a) Possible or impossible values for color, bird, event, & food if you only observe "yum" printed to your screen
	# Values have to be:
		# color == blue
		# bird == hammerkop
		# event == marathon
		# food == hamhock
# b) You observe only "ostrich"
		# Possible:
			# color == blue
			# event and food can be anything
		# Impossible:
			# bird == pigeon, hammerkop
# c) Is it possible to observe only "I love birds" as output?
	# No.  You'd also get 'not quite a loon...' along with 'I love 		birds'.

# d) Of the 5 expressions that result in output, which are mutually exclusive? E.g., can you run the code and observe both ‘green’ and ‘ostrich???’ printed to your screen?
	# You can't observe 'yum' with anything else
	# You can't observe 'not quite a loon' and 'I love birds.' with 	anything else (but those 2 outputs are always together).
	# You can't observe 'green' with anything else
	
	
# Question 4
# Robocop fails if the person is exactly 21 years old.

# Question 5
# Write a function that tests if a number is prime

testprime <- function(NumberToTest){
	if(round(NumberToTest) != NumberToTest){
		cat('Not an Integer!');
	}else if (NumberToTest < 0){
		cat('Negative!');
	}else{
	results <-NULL;
	for(i in 2:(NumberToTest-1)){
		results[i-1] <- NumberToTest %% i
	}
	# If min(results) is 0, that means the number is not prime
	# If all the entries in the results vector are nonzero, the 	number is prime.
	if(min(results) == 0){
		cat('Not Prime!');
	}else{
		cat('Prime!');
	
	}
}
}	

# Question 6
#Create vector x of random numbers, where x <- rnorm(10), generated with set.seed(1). Loop over the vector and consider each element in turn: if x[ i ] is less than or equal to -0.5, cat something like this to screen:
# If number is less than -0.5, print "# is less than -0.5!"
# If number is between -0.5 and 0.5, print "# is in the middle!"
# Otherwise, print "#.  Whopper!"

set.seed(1);
x <- rnorm(10);
for( i in 1: length(x)){
	if(x[i] < -0.5){
		cat(x[i], 'is less than -0.5!\n');
	}else if(x[i] > -0.5 & x[i] <0.5){
		cat(x[i], 'is in the middle!\n');
	}else{
		cat(x[i], '. Whopper!\n', sep = '');
	}
	
}


# Question 7
# Write code that prints to screen the numbers from 1 to 100 on separate lines. However, for multiples of three, print “Fizz” instead of the number, and print “Buzz” if the number is divisible by five. If the number is divisible by both 3 and 5, print “FizzBuzz” on the same line. You are limited to three conditional expressions (whatever combination of if, if else, and else you may desire).
# I can't figure out how to do this with only 3, so here it is with more:
for(i in 1:100){
	if(i %% 15 == 0){
		cat('FizzBuzz\n');
	}else if(i %% 3 == 0){
		cat('Fizz\n');
	}else if(i %% 5 == 0){
		cat('Buzz\n')
	}else{
		cat(i, '\n');
	}				
}

# This is my attempt with only 3... I can't get the output on the right lines.
for(i in 1:100){
	if(i %% 3 == 0){
		cat('Fizz');
	}
	if(i %% 5 == 0){
		cat('Buzz');
		
	}else {
		cat(i, '\n');
	}
				
}


# Question 8
# Here we will write a function that takes two numbers x and y as arguments and returns the result of a mathematical operation. The function will evaluate arguments (x, y) as follows:
	#result = x + y ( when x >= 0 and y >= 0)
	#result = x + y^2 (when x >=0 and y < 0)
	# result = x^2 + y (when x < 0 and y >=0)
	# result = x^2 + y^2 (when x < 0 and y < 0)

myFxn <- function(x, y){
	if(x >= 0 & y >= 0){
		result <- x + y;
	}
	if(x >= 0 & y < 0){
		result <- x + y^2;
	}
	if(x < 0 & y >= 0){
		result <- x^2 + y;
	}
	if(x < 0 & y < 0){
		result <- x^2 + y^2;
	}
	return(result)
}

myFxn(0, 1);
myFxn(1, 1);
myFxn(-1, -10);
myFxn(-5, 3);
myFxn(3, -5);


# Question 9
#Go back to our exercise on geometric population growth. We will now assume that the population experiences “good” and “bad” growth years. During good years, each individual in the population averages 3 progeny (geometric parameter p = 0.25). During bad years, each individual averages just a single progeny (parameter p = 0.5). It just so happens that the environment in which our hypothetical population lives experiences alternating good and bad years: when the number of generations is odd, the population experiences a good year. When the number of generations is even, the population experiences a bad year.

#a) develop code that simulates population growth in this fashion, using conditional execution within a while loop to specify how progeny are to be chosen depending on the current generation. You may need to use the modulo operator (%%; also known as ‘remainder’ operator). Assume a starting population size of n = 10 individuals and a MAXPOPSIZE of n = 10000.

MAXPOPSIZE <- 10000;
curr_pop_size <- 10;
#popvector <- curr_pop_size;
NGENS <- 0;
	
	
while (curr_pop_size <  MAXPOPSIZE){
	if(NGENS %% 2 == 1){
		# Odd year
		babies <- rgeom(curr_pop_size, .25);
 		curr_pop_size <- sum(babies);
 		#The line below was in our old code, but isn't needed 			now
 		#popvector <- c(popvector, curr_pop_size);
 
	}else{
		# Even year
		babies <- rgeom(curr_pop_size, .5);
 		curr_pop_size <- sum(babies);
 		#The line below was in our old code, but isn't needed 			now
 		#popvector <- c(popvector, curr_pop_size);
 		
	}
	NGENS <- NGENS + 1; 
}
NGENS;


#b) get the distribution of 5000 such population growth events (this part should be easy by now!) and plot in a histogram.
# R gets stuck (or just takes a reallllly long time to execute my code) when I use 5000... my code works fine for a smaller number of events, but I'm not sure if there's a better approach that is faster for large numbers of events.

NGENS.vector <- NULL;
for( i in 1:5000){
	
	#Reset values to originals at start of each iteration of for 	loop
	MAXPOPSIZE <- 10000;
	curr_pop_size <- 10;
	#popvector <- curr_pop_size;
	NGENS <- 0;
	
	
	while (curr_pop_size <  MAXPOPSIZE){
		if(NGENS %% 2 == 1){
			# Odd year
			babies <- rgeom(curr_pop_size, .25);
 			curr_pop_size <- sum(babies);
 
		}else{
			# Even year
			babies <- rgeom(curr_pop_size, .5);
 			curr_pop_size <- sum(babies);
 			
		}
		NGENS <- NGENS + 1; 
	}
	NGENS.vector[i] <- NGENS;
	}
hist(NGENS.vector);









