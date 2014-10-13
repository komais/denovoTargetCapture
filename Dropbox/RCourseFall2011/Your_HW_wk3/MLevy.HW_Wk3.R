### Week 3 HW
Time: 5 hours

#-----

rm(list= ls());
setwd("/Users/MCL/Desktop/R_Course/RCourseFall2011/Week3")
getwd()

#------

#3a)
for (i in 1:9){
cat(i='*', sep='\n');
}

#3b)
for (i in 1:10){
	if (i==1){cat("*")};
	if (i>1){cat("#*")};
}

# 7) Pretend that the function sum() does not exist. If sumThis is a vector of numbers, provide code that sums all of the elements of sumThis, incrementally. Do this using a for loop.

set.seed(1);
sumThis <- rnorm(10);
sumThis
sum.start <- 0
sum.start
for (i in 1:length(sumThis)){
	sum.start <- sum.start + sumThis[i]
}
sum.start #check
sum(sumThis) #check

# 8) Using a vector of all letters (*hint: what is letters in R?) and a for loop, do the following:

# (i) print the letters “a” through “g” side by side, with no space between them; then
#can just use "letters" - already the alphabet

for (i in 1:7){
cat(letters[i]);
}

# (ii) print the letters “a” to “g” on separate lines, in reverse order (g, f, e….a).

for (i in 7:1){
cat(letters[i], sep="\n");
}

#(iii) A bit trickier: Print the letters “a” to “g” separated by a space

for (i in 1:7){
	cat(letters[i], "")
}

# (iv) Print letters “a” to “g” separated by “xx”

for (i in 1:7){
	if (i==1){cat(letters[i])}
	if (i>1){
		cat("xx")
		cat(letters[i])};
}

# 9) Write a function “beerBottles” that takes an integer x as an argument (actually, I have already done this part for you). When you execute the function, beerBottles(5) , for example, you should have get the following output on your screen:

beerbottles <- function(x)
{
	for (i in x:1){
		cat(i, "bottles of beer on the wall")
		cat("", sep="\n")
	}
}
beerbottles(5) #check

# 10) Use a for loop to make a new vector containing the first 17 elements of the Fibonacci series. At each iteration, your loop should print something like “Fib number 5 is 3” Thus, you need to start by initializing a vector of length 17. You’ll need to assign the first and second elements of the series before you begin the loop. Remember that your loop variable does not need to begin with i = 1 or i = 0. FIB[n] <- FIB[n-1] + FIB[n-2]

fib <- rep(0, 17)
fib[1] <- 0
fib[2] <- 1
fib

for(i in 1:17){
	if (i==1){cat("Fib number 1 is", fib[1])
		cat(sep="\n")}
	if (i==2){cat("Fib number 2 is", fib[2])
		cat(sep="\n")}
	if (i>=3) {
		fib[i] <- fib[i-1] + fib[i-2]
		cat("Fib number", i, "is", fib[i])
		cat(sep="\n")
	}
}
fib
mode(fib)

# 11) Modify the 5-year interest-compounding code above so that each year, it deducts the expenditures and adds the income (BEFORE compounding) for each student. You can assume (for example) that food[2] and food[3] correspond to the food expenditures of the 2nd & 3rd students, respectively

bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;

house <- c(4.8, 3.8, 5.7);
food<- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5);
income <- c(21, 21, 21);

for (j in 1:5){
	for (i in 1:length(bankAccounts)){
		bankAccounts[i] <- bankAccounts[i]+income[i]-house[i]-food[i]-fun[i]
		bankAccounts[i] <- interestRate*bankAccounts[i]+ bankAccounts[i]
	}
	print(bankAccounts)
}

# Check 1st year, first student
(10-4.8-3.5-7.8+21)+(10-4.8-3.5-7.8+21)*0.0525


# 12) Write a script that prints the pattern below. Save your script as file “invert_pyramid.R”. When you source this file, it should print the pattern below to your R display. You need to use the function cat() to print output to screen and two for loops (nested). You can just include the code that does this in your main homework script file (you don’t need to upload a separate file to Dropbox).

for (i in 1:10){
	for (k in i:10){
		cat("#")
	}
	cat(sep="\n")
}

setwd("/Users/MCL/Desktop/R_Course/RCourseFall2011/Week3")
source("invert_pyramid.R")


# 13) Use nested for loops in a script ‘pyramid_fun.R’, which prints the following to the display when sourced:
ABCDEF
ABCDE
ABCD
ABC
AB
A

capletters <- toupper(letters)
capletters

for (i in 1:6){
	for (k in 1:(7-i)){
		cat(capletters[k])
	}
	cat(sep="\n")
}


# 14) 

setwd("/Users/MCL/Desktop/R_Course/RCourseFall2011/data")
lizards <- read.table("skinks.txt", header=T)
head(lizards)

#How many species of Ctenotus were captured at Lorna Glen? Answer this question exactly, using a combination of length() and unique().

length(unique(lizards$species))
list(unique(lizards$species))

15) Write several lines of code that (1) create a new data frame with all missing data (NAs) for sex and weight omitted. Hint: what does the function is.na do?

newlizards <- na.omit(lizards) #removes rows where "NA" contained in a col
sum(is.na(newlizards)) #check for NA's = 0 found

#Check
x <- sum(is.na(lizards$sex)) #NA's in sex
y <- sum(is.na(lizards$weight)) #NA's in weight
z <- sum(is.na(lizards$sex) & is.na(lizards$weight)) #NA's in both
x+y-z

length(lizards$species)-length(newlizards$species) == x+y-z #Check number removed is right = TRUE

#NOW: make yet another dataframe containing only individuals identified as “leonhardii”, using subsetting tricks that you already know. Be careful: does this dataframe have rownames?

index <- grep('leonhardii', newlizards$species)
leonlizards <- newlizards[index, ]
length(rownames(leonlizards))

#FINALLY: Provide code that counts the number of male leonhardii individuals that were captured, unambiguously sexed, and weighed. Now repeat for females. Note that I have not necessarily denoted males and females by “male” and “female” – you can easily check the classifications used in $sex with the functions unique(). Ignore any questionable males or females.

list(unique(leonlizards$sex)) # = M  F  F? M? J  m?

length(which(leonlizards$sex=="M")) #leonlizards already meets requirements other than unambiguosly sexed, so just get that
length(which(leonlizards$sex=="F"))
#OR
length(which(leonlizards[ ,5]=="M"))
length(which(leonlizards[ ,5]=="F"))