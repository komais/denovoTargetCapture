#Question 3
#(a) has to be blue, hammerkop, marathon, and hamhock respectively
#(b) color has to be blue, bird cannot be hammerkop or pigeon
#(c) No
#(d) all are mutually exclusive, but for "not quite a loon" and "i love birds"

#Question 4
#when the person is 21

#Question 5
primeVector <- function(start,end) {
	if (start %% 1 || end %% 1 ) {
		return("phooey! this is no integer");
		}
	else if (start < 0 || end < 0 ) {
		return("phooey! no negative numbers, please");
		}	
	else {
		prime <- c()
		if (start == 1) {
			start = start + 1
			}
		for (i in start:end) {
			if (isPrime(i)) {
				prime <- c(prime,i)
				}
			}
		return(prime);
		}	
	}
	
isPrime <- function(number) {
	end <- number - 1
	for (i in 2:end) {
		if (number %% i == 0) {
			return(0);
			}
		}
	return(1);
	}
	
#question 6
x <- rnorm(10)
for (i in 1:length(x)) {
	if (x[i] <= -0.5) {
		cat(x[i], " is less than -0.5\n")
		}
	else if (x[i] < 0.5 & x[i] > -0.5 ) {
		cat(x[i], " is in the middle\n")
		}	
	else {
		cat(x[i], " is a whopper\n")
		}	
	}	

#question 7
for (i in 1:100) {
	if (i %% 15 == 0) {
		cat("FizzBuzz\n")
		}
	else if (i %% 5 == 0 || i %% 3 == 0) {
		if (i %% 5 == 0) {
			cat("Fizz\n")
			}
		else {
			cat("Buzz\n")
			}	
		}
	else {
		cat(i,"\n")
		}	
	}	
#couldn't figure out a way to do this with using just 3 conditionals unless I used none
a<-seq(1,100)
aC <- as.character(a)
aC[a %% 15 == 0] <- "FizzBuzz"
aC[a %% 3 == 0] <- "Buzz"
aC[a %% 5 == 0] <- "Fizz"

for (i in 1:length(aC)) {
	cat(aC[i],"\n")
	}
	
#question 8
mathFun <- function(x,y) {
	if (x >= 0 & y >= 0) {
		return(x+y)
		}
	if (x >=0 & y < 0) {
		return(x+y^2)
		}	
	if (x < 0 & y >= 0) {
		return(x^2+y)
		}
	if (x < 0 & y < 0) {
		return(x^2+y^2)
		}	
	}
	
#question 9
popGrowth <- function(start,maxpop,ntrials) {
	gens <- rep(NA,ntrials)
	for (i in 1:ntrials) {
		gen <- 1
		pop = start
		while (pop < maxpop) {
			#odd year
			if (gen %% 2) {
				pop <- sum(rgeom(pop,0.25))
				}
			#even year	
			else {
				pop <- sum(rgeom(pop,0.5))
				}	
			gen = gen + 1	
			}
		gens[i] = gen	
		}
	return(gens)	
	}
gens <- popGrowth(10,10000,5000)	