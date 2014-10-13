## HW 4
# 4 hours

#________

rm(list= ls());
setwd("/Users/MCL/Desktop/R_Course/RCourseFall2011/Week4")

#_________

#1) Given Examples

MAXPOPSIZE <- 2000;
curr_pop_size <- 1;
popvector <- curr_pop_size; #popvector holds the population size at each generation
progeny <- 2;
while (curr_pop_size < MAXPOPSIZE){
curr_pop_size <- curr_pop_size*progeny;
popvector <- c(popvector, curr_pop_size);
}

#2)  Make a plot of the population size as a function of generation time, noting that the first value in popvector corresponds to generation t = 0.

gen <- c(1:length(popvector))
plot(popvector~gen, type='l')


#3) Draw 5000 random numbers from a geometric distribution with parameter p = 0.3333. What is the mean of this set of numbers? # Plot a histogram of the numbers: this is the distribution of progeny for a population of 5000 individuals that give birth to 2 progeny (on average) each generation. How many progeny did this population give birth to? Repeat the random-draw part several times with the appropriate p parameter to convince yourself that each individual is in fact giving birth to an average of two progeny.

RN5000 <- rgeom(5000, 0.3333)
head(RN5000)
mean(RN5000)
hist(RN5000)
sum(RN5000)
for (i in 1:10){
	births <- rgeom(5000, 0.333)
	cat(i, mean(births), sep=':')
	cat('\n')
}

#4 How many generations does it take to exceed the MAXPOPSIZE? Repeat for 10 replicates, using 1:10 as the seed for the random number generator (eg., for run 5, use set.seed(5)) and record the number of generations required to exceed MAXPOPSIZE. What is the mean number of generations required to exceed MAXPOPSIZE across the 10 replicates?

plot(popvector)
length(popvector) # = 12 generations
gen <- rep(0,10) #initialize gen w/ zeros

for (i in 1:10){
	MAXPOPSIZE <- 5000;
	curr_pop_size <- 8;
	popvector <- curr_pop_size;
	set.seed(i);
		while (curr_pop_size < MAXPOPSIZE){
			babies <- rgeom(curr_pop_size, .33333);
			curr_pop_size <- sum(babies);
			popvector <- c(popvector, curr_pop_size);
			}
	gen[i] <- length(popvector)	
	cat("run number ", i, sep=':')
	cat('\n')
	cat("average number of babies is ", mean(babies), sep=':')
	cat('\n')
	cat("number of generations is ", gen[i], sep=':')
	cat('\n')
}
mean(gen) # = 11.3

# 5) Is a for loop appropriate for the above simulation? Why or why not?
#Yes, I used it to run the replications, because I knew the number of replicates that I wanted. I don't know why it might not be suitable...

# 6) Based on your analysis of the geometric distribution of progeny, is it necessarily the case that population size will always increase? Why or why not?
#The average number of progeny in each repetition is positive, thereofre it will always increase.

# 7) Can make even simpler: find current population size using:

curr_pop_size <- sum(rgeom(curr_pop_size, 0.3333)) #instead of babies

for (i in 1:10){
	MAXPOPSIZE <- 5000;
	curr_pop_size <- 8;
	popvector <- curr_pop_size;
	set.seed(i);
		while (curr_pop_size < MAXPOPSIZE){
			curr_pop_size <- sum(rgeom(curr_pop_size, 0.3333));
			popvector <- c(popvector, curr_pop_size);
			}
}
plot(popvector)


# 8) The following code is supposed to print the squares of integers from 1 to 10. What is wrong with it?

for (i in 1:10) # there was a ";" at the end of this line that needed to be removed.{	cat(i, ' squared is ', i^2, '\n', sep='');}

# 9A) While doing fieldwork in some faraway land, you and a field assistant pick up a parasite that grows exponentially until treated. Your case is more severe than your assistant’s: you have picked up 400 parasites, and your assistant has only picked up 120. However, your tough immune system is better able to deal with the parasites, and the parasite population only grows by 10% in your body each day, compared with 20% per day in your assistant. 

#Write code that uses a for loop to calculate the number of parasites in your body and your assistant’s body over the next 30 days. 

A_parasite_size <- 400;
B_parasite_size <- 120;
Avector <- A_parasite_size;
Bvector <- B_parasite_size;

for (i in 1:30){
	A_parasite_size <- A_parasite_size + (A_parasite_size*0.1)
	B_parasite_size <- B_parasite_size + (B_parasite_size*0.2)
	
	Avector <- c(Avector, A_parasite_size)
	Bvector <- c(Bvector, B_parasite_size)
			
	cat("day", i, sep=': ')
	cat('\n')
	cat("The number of parasites in A is", A_parasite_size, sep=': ')
	cat('\n')
	cat("The number of parasites in B is", B_parasite_size, sep=': ')
	cat('\n')
}

#Then, using these vectors of parasites at each time point, draw a single plot of parasite load as a function of time for 30 days. 

plot(Avector, pch=19, ylim=c(0, max(Avector, Bvector)), xlab="days", ylab="parasites")
points(Bvector)

# Now make a similar plot, but do log-transformed parasite loads as a function of time.

plot(log(Avector), pch=19, ylim=c(0,log(max(Avector, Bvector))), xlab="days", ylab="log parasites")
points(log(Bvector))

#9B) Assume each parasite has a fixed mass of .000001 kg. Assuming no constraints on growth of the parasite population in your assistant, how long before she harbors a mass of parasites equal to her body mass (55 kg)? Use a while loop to model this: exit the loop when the mass of parasites exceeds her body mass and be sure you can recover the number of days required to acquire such a large parasite load.

B_parasite_size <- 120;
wt <- .000001
MAXwt <- 55
Bcurr_par_wt <- B_parasite_size*wt
WtVector <- Bcurr_par_wt # WtVector holds the weight at each generation

while (Bcurr_par_wt < MAXwt){
	B_parasite_size <- B_parasite_size + (B_parasite_size*0.2);
	Bcurr_par_wt <- B_parasite_size*wt;
	WtVector <- c(WtVector, Bcurr_par_wt);
}
length(WtVector) # = 73 days

#10) Write an R script “format.R” which, when sourced, reproduces exactly the following output on your screen (don’t worry about the font or color...):

#I saved the below in "format.R" file
cat('\t', "this is tab-indent. now i will show you")
cat('\n')cat('the new-', '\n')cat('line character: \\n', '\n', '\n')cat('and the backslash is \\', '\n', '\n')cat('this formatted output stuff is slick!!')

setwd("/Users/MCL/Desktop/R_Course/RCourseFall2011/Week4")
source('format.R')

#11) Read in lizards. want to sequentially compute the mean snout-vent-length (“snout_vent”) of each species of skink in ‘lizards’. First, you will need to get a vector of species names. (hint: what can the function unique() do for you?). Note that you will need to initialize a vector to store the mean snout_vent lengths for each species!

lizards <- read.table("skinks.txt", header=T)
head(lizards)

sum(is.na(lizards$snout_vent)) #there are no NA's in snout_vent, but to remove the rows with NA's in other cols, would enter somethign like: newlizards <- na.omit(lizards)

species <- unique(lizards$species)
snout_mean <- 0

for (i in 1: length(species)){
	subset<-lizards[which(lizards$species==species[i]),];
	snout_mean<-c(snout_mean,mean(subset[ ,"snout_vent"]));
}
snout_mean[-1]

#13) Using a loop, make another vector that contains the number of sites (‘site’) at which each species was found. Make sure this vector has names, as above. 

length(unique(lizards$site)) #total number of sites in lizards

species <- unique(lizards$species)
number_sites <- 0

for (i in 1: length(species)){
	subset<-lizards[which(lizards$species==species[i]),];
	number_sites <- c(number_sites, length(unique(subset[ ,"site"])))
}
number_sites <- number_sites[-1]
names(number_sites) <- species
number_sites

# Write a line of code that extracts the species found at the maximum number of sites.

names(which(number_sites == max(number_sites)));

#14) Write a single line of code that extracts the name of the species with the largest snout-vent length, using the original lizards dataframe.

lizards$species[lizards$snout_vent==max(lizards$snout_vent)];

