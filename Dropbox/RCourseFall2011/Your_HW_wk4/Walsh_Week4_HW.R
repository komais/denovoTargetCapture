#Let’s test whether the number 25 is prime, without yet entering the function in R.
#Fill out the following information for the first seven iterations of the loop in
#testPrime.

#Value of argument to testPrime: 25

#Iteration	i	isPrime at START	Remainder at end	isPrime at END
#1			2		TRUE				1					TRUE
#2			3		TRUE				1					TRUE
#3			4		TRUE				1					TRUE
#4			5		TRUE				0					FALSE
#5			6		FALSE				1					FALSE
#6			7		FALSE				4					FALSE
#7			8		FALSE				1					FALSE

#Final value of isPrime: FALSE

#TOTAL number of iterations of loop: 23

testPrime <- function(some_integer)
{
	is.prime <- TRUE;
	for (i in 2:(some_integer - 1))
	{
		remainder <- some_integer %% i;
		if (remainder == 0)
		is.prime <- FALSE;
}

if (is.prime == TRUE){
	cat(some_integer, " is prime!\n", sep='');
} else {
	cat(some_integer, " is NOT prime\n", sep='');
	}
}

#Try testPrime with a few integers: 5, 6, 25, 32, 47, 49, 12345, ...
testPrime(5);
testPrime(6);
testPrime(25);
testPrime(47);
testPrime(12345);

#The while loop might make more sense with a simple example. Try running the
#following code in your R editor:
MAX <- 7;
index <- 0;
while(index <= MAX){
	index <- index + 1;
	cat('index value current: ', index, '\n', sep='');
}
cat('loop is done\nValue of index at ');
cat('loop termination was ', index, '\n', sep='');

#1) Last week, you used a for loop to sum all of the numbers from 1:17. Repeat the exercise, but use a while loop. You will need to use a counter variable (like index seen in the preceding example).

my.sum <- 0;
counter <- 0;
while(counter < 17) {
	my.sum <- my.sum + (counter + 1);
	counter <- counter + 1;
	cat('counter value current: ', counter, '\n', sep = '');
	cat('my.sum value current: ', my.sum, '\n', sep = '', '\n')
}
cat('Loop is done', '\n', 'Value of my.sum at');
cat('loop termination was ', my.sum, '\n', sep ='');


 MAXPOPSIZE <- 2000;
 curr_pop_size <- 1;
 popvector <-  curr_pop_size;
progeny <- 2;
while ( curr_pop_size <  MAXPOPSIZE){
 curr_pop_size <-  curr_pop_size*progeny;
 popvector <-  c( popvector,  curr_pop_size);
}
#Here popvector holds the population size at each generation.

#2) Make a plot of the population size as a function of generation time, noting that
#the first value in popvector corresponds to generation t = 0.
MAXPOPSIZE <- 2000;
curr_pop_size <- 1;
popvector <- curr_pop_size;
progeny <- 2;

gen.time <- 0;
x.for.plot <- rep(NA, 11)
y.for.plot <- rep(NA, 11)

while (curr_pop_size < MAXPOPSIZE){
	x.for.plot[gen.time+1] <- gen.time;
	y.for.plot[gen.time+1] <- curr_pop_size;
	
	curr_pop_size <- curr_pop_size*progeny;
	popvector <- c(popvector, curr_pop_size);
	gen.time <- gen.time + 1;
	
}

plot(x.for.plot, y.for.plot, xlab = "Generation Time", ylab = "Population Size");

#3) Draw 5000 random numbers from a geometric distribution with parameter p = 0.3333. What is the mean of this set of numbers? Plot a histogram of the numbers: this is the distribution of progeny for a population of 5000 individuals that give birth to 2 progeny (on average) each generation. How many progeny did this population give birth to? Repeat the random-draw part several times with the appropriate p parameter to convince yourself that each individual is in fact giving birth to an average of two progeny.
numbers<- rgeom(5000, 0.3333);

mean(numbers);
#Mean changes slightly each time you run this, but it's close to 2, so this means each individual does give birth to ~2 progeny.

hist(numbers, breaks = 20);

#How many progeny did the pop give birth to?
sum(numbers);
#This fluctuates around 10,000


 MAXPOPSIZE <- 5000;
 curr_pop_size <- 8;
 popvector <-  curr_pop_size;
set.seed(1);
while ( curr_pop_size <  MAXPOPSIZE){
babies <-  rgeom( curr_pop_size,  .33333);
 curr_pop_size <-  sum(babies);
 popvector <-  c( popvector,  curr_pop_size);
}

#4) How many generations does it take to exceed the MAXPOPSIZE? Repeat for 10 replicates, using 1:10 as the seed for the random number generator (eg., for run 5, use set.seed(5)) and record the number of generations required to exceed MAXPOPSIZE. What is the mean number of generations required to exceed MAXPOPSIZE across the 10 replicates?

gen.vector <- rep(NA, 10);
#This is the vector in which I'm going to store the results from each replicate.

for( i in 1:10){
	
	#Reset values to originals at start of each iteration of for loop
	MAXPOPSIZE <- 5000;
	curr_pop_size <- 8;
	popvector <- curr_pop_size;
	num.gen <- 0;
	#num.gen = number of generations
	set.seed(i);
	
	while (curr_pop_size <  MAXPOPSIZE){
		babies <- rgeom(curr_pop_size, .33333);
 		curr_pop_size <- sum(babies);
 		popvector <- c(popvector, curr_pop_size);
 		num.gen <- num.gen + 1;  
 		
	}
	gen.vector[i] <- num.gen;
	}
gen.vector;
mean(gen.vector);


#5) Is a for loop appropriate for the above simulation? Why or why not?
#I think you could use a for loop.  You'd have to have some sort of if function in the loop to respond appropriately when you hit the max population size, but it seems like you could set that up without using a while loop.

#6) Based on your analysis of the geometric distribution of progeny, is it necessarily the case that population size will always increase? Why or why not?
#The population size will always increase, because the mean number of progeny is close to 2.  You'd have to have a mean less than one for the population not to increase, and that would be pretty dramatic (and therefore improbable) stochastic variation.

#7) Are you impressed with how easy it is to simulate stochastic population growth?
#Impressed with R, sure.  Impressed with my R skills.  Wellll.... not so much.

#8) The following code is supposed to print the squares of integers from 1 to 10. What is wrong with it?
for (i in 1:10); #The semicolon in this line should not be there-- it makes R think that this is the end of the statement to be executed, when really R hasn't yet executed what it needs to execute (the code for the loop that starts in the next line).
{
cat(i, ' squared is ', i^2, '\n', sep='');
}

#The correct code should look like this:
for (i in 1:10){
	cat(i, ' squared is ', i^2, '\n', sep='');
}


#9A) While doing fieldwork in some faraway land, you and a field assistant pick up a parasite that grows exponentially until treated. Your case is more severe than your assistant’s: you have picked up 400 parasites, and your assistant has only picked up 120. However, your tough immune system is better able to deal with the parasites, and the parasite population only grows by 10% in your body each day, compared with 20% per day in your assistant. Write code that uses a for loop to calculate the number of parasites in your body and your assistant’s body over the next 30 days. Then, using these vectors of parasites at each time point, draw a single plot of parasite load as a function of time for 30 days. Now make a similar plot, but do log-transformed parasite loads as a function of time.

my.parasites <- 400;
asst.parasites <- 120;
my.rate <- 1.1;
asst.rate <- 1.2;
my.parasite.vector <- rep(NA, 30);
asst.parasite.vector <- rep(NA, 30);
num.days <- 1:30;

for (i in 1:30){
	my.parasites <- my.parasites * my.rate;
	asst.parasites <- asst.parasites * asst.rate;
	my.parasite.vector[i] <- my.parasites;
	asst.parasite.vector[i] <- asst.parasites;
}
plot(num.days, my.parasite.vector, col = 'blue');
points(num.days, asst.parasite.vector, col = 'red');

plot(num.days, log(my.parasite.vector), col = 'blue');
points(num.days, log(asst.parasite.vector), col = 'red');

#9B) Assume each parasite has a fixed mass of .000001 kg. Assuming no constraints on growth of the parasite population in your assistant, how long before she harbors a mass of parasites equal to her body mass (55 kg)? Use a while loop to model this: exit the loop when the mass of parasites exceeds her body mass and be sure you can recover the number of days required to acquire such a large parasite load.
#My code
mass.per.parasite <- 0.000001;
num.parasites <- 120;
growth.rate <- 1.2;
curr.mass <- mass.per.parasite*num.parasites;
day.number <- 0;

curr.mass.vector <- curr.mass
day.number.vector <- day.number

while(curr.mass <= 55){
	num.parasites <- num.parasites*growth.rate
	curr.mass <- num.parasites*mass.per.parasite;
	curr.mass.vector <- c(curr.mass.vector, curr.mass);
	#The above line is only necessary if you want a vector of parasite numbers over time.  (I did, so I could check that I set things up 			right.)
	day.number <- day.number + 1;
	day.number.vector <- c(day.number.vector, day.number);	
	
}
length(day.number.vector);

#Dan's code from class
parasite <- 0.000001;
tech <- 55; #Field assistant mass, kg

#Parasites grow by 20% per day.
#Starting conditions
nparasites <- 120;
totalmass <- parasite*nparasites;

day <- 1;

#Pseudo code:
#While total para mass < 55
#	Increase para pop
#	Compute new total mass
#	Increment the day
#This is useful for figuring out the logic of setting up the loop.

while(totalmass < tech){
	nparasites <- nparasites * 1.2;
	totalmass <- nparasites* parasite;
	day <- day + 1;
	
}
day;



#10) Write an R script “format.R” which, when sourced, reproduces
exactly the following output on your screen (don’t worry about the font or
color...):
cat('\t','this is tab-indent.  now I will show you','\n');
cat('the new-','\n');
cat('line character \\n', '\n', '\n');
cat('and the backslash is \\', '\n', '\n');
cat('this formatted output stuff is slick!!');

source('format.R')


#11) Create a dataframe ‘lizards’ by reading in ‘skinks.txt’, which you used last week.  For example, let’s suppose that we want to sequentially compute the mean snout-vent-length (“snout_vent”) of each species of skink in ‘lizards’. We can easily envision a situation where, with a large number of species, this would prove exceedingly tedious to do manually. Rather, we might do:

lizards <- read.table('skinks.txt', header = T);
lizards.no.nas <- na.omit(lizards);
species_names_vector <- unique(lizards.no.nas$species);
svl.means <- rep(NA, length(species_names_vector));

for (i in 1:length(species_names_vector)){
	my.index <- grep(species_names_vector[i], lizards.no.nas$species);
	ith.species <- lizards.no.nas[my.index, ];
	
	svl.means[i] <- mean(ith.species$snout_vent);
	
}
names(svl.means) <- species_names_vector;
svl.means;

#12) Using the looping construct described above, create a new vector of the largest (snout_vent) sizes recorded for each of the n species. Yes, there is a ‘shortcut’ function that finds the maximum of a set of numbers, but I am going to make you guess. R is a fairly intuitive language and I am confident that you can do this. Use ‘names()’ and species_name_vector to assign names to the elements of the vector.

largest <- rep(NA, length(species_names_vector));

for(i in 1:length(lizard.spp)){
	my.index <- grep(lizard.spp[i], lizards.no.nas$species);
	ith.species <- lizards.no.nas[my.index, ];
	
	largest[i] <- max(ith.species$snout_vent);
}
names(largest) <- species_names_vector;
largest;


#13) Using a loop, make another vector that contains the number of sites (‘site’) at which each species was found. Make sure this vector has names, as above. Write a line of code that extracts the species found at the maximum number of sites.
species_names_vector <- unique(lizards.no.nas$species);
number.of.sites <- rep(NA, length(species_names_vector));

for(i in 1:length(species_names_vector)){
	my.index <- grep(lizard.spp[i], lizards.no.nas$species);
	ith.species <- lizards.no.nas[my.index, ];
	
	number.of.sites[i] <- length(unique(ith.species$site));
	
}
names(number.of.sites) <- species_names_vector;
number.of.sites;

#14) Write a single line of code that extracts the name of the species with the largest snout-vent length, using the original lizards dataframe.
#The wording is unclear... do you mean the species of the individual with the largest svl, or the species with the largest mean svl?

#This gets you the species of the largest individual
largest.individual <- lizards$species[max(lizards$snout_vent)];





