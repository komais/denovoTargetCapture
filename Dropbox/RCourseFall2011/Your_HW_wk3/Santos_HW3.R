# TODO: Homework week 3
# 
# Author: Maria
###############################################################################


#3a) Modify one of the for loop statements above so that it runs from 1:9 and prints the following output to the R console
for (i in 1:9){
	cat("*", sep = "\n")
}

# 3b) Modify your for loop so that it prints 10 asterisks, with each asterisk separated by exactly one pound sign (#), with no spaces or new line characters
for (i in 1:10){
	cat("*", "#", sep = "")
}

#4. i = 1, start dogs = 10, end dogs = 11;
#i = 2, start dogs = 11, end dogs = 12; 
#i = 3, start dogs = 12, end dogs = 13; 
#i = 4, start dogs = 13, end dogs = 14; 
#i = 5, start dogs = 14, end dogs = 15;  
dogs <- 10;
for (i in 1:5){
	dogs <- dogs + 1;
}
dogs

#5 #i = 5, start meatloaf = 0, end meatloaf= -4;
#i = 6, start meatloaf = -4, end meatloaf= -9;
#i = 7, start meatloaf = -9, end meatloaf= -15; 
#i = 8, start meatloaf = -15, end meatloaf= -22;
#i = 9, start meatloaf = -22, end meatloaf= -30;
meatloaf <- 0;
for (i in 5:9){
	meatloaf <- meatloaf - i + 1;
}
meatloaf

#6 #i = -1, start bubbles = 12, end bubbles= -1;
#i = -2, start bubbles = -1, end bubbles= -2;
#i = -3, start bubbles = -2, end bubbles= -3;
#i = -4, start bubbles = -3, end bubbles= -4;
bubbles <- 12;
for (i in -1:-4){
	bubbles <- i;
}
bubbles


#7. Pretend that the function sum() does not exist. If sumThis is a vector of numbers, provide code that sums all of the elements of sumThis incrementally. 
# Do this using a for loop

set.seed(1);
sumThis <- rnorm(10);
a <-sumThis[1]
for(i in 2:10){
	a <- a+sumThis[i]
}
sum(sumThis)
a

# i=2 then a = -0.6264538+0.1836433=-0.4428105
# i=3 then a = -0.4428105+(-0.8356286)= -1.278439
# i=4 then a = -1.278439+1.5952808 = 0.3168418
# i=5 then a = 0.3168418+0.3295078=0.6463496
# i=6 then a = 0.6463496+(-0.8204684)=-0.1741188
# i=7 then a = -0.1741188+0.4874291=0.3133103
# i=8 then a = 0.3133103+0.7383247=1.051635
# i=9 then a = 1.051635+0.5757814=1.627416
# i=10 then a = 1.627416+(-0.3053884)= 1.322028


#8. Using a vector of all letters (*hint: what is letters in R?) and a for loop, do the following:
# (i) print the letters “a” through “g” side by side, with no space between them; 
?letters
lettre <- c(letters)
lettre
for(i in 1:7){
	cat(lettre[i])
}
# then(ii) print the letters “a” to “g” on separate lines, in reverse order (g, f, e….a).
for(i in 7:1){
	cat(lettre[i], sep='\n');
}

# (iii) A bit trickier: Print the letters “a” to “g” separated by a space
une <- lettre[1]
for(i in 2:7){
	une <- cat(une, lettre[i], sep=' ');
}

# (iv) Print letters “a” to “g” separated by “xx”
une <- lettre[1]
for(i in 2:7){
	une <- cat(une, lettre[i], sep='xx');
}


#9. Write a function “beerBottles” that takes an integer x as an argument (actually, I have already done this part for you). 
# Here is the template function. Fill in the relevant bits for SOME CONDITION and EXECUTE SOMETHING.
beerBottles <- function(x){
	for(x in 5:1){
		x <- cat(x, 'bottles of beer on the wall', sep=' ')
		cat (x, sep='\n')}
}
beerBottles(5)


#10. Fun with Fibonacci: The Fibonacci numbers are a famous series that run from 0 to infinity. 
#The first two numbers in the series are 0 and 1, but all other numbers in the series are formed by summing the two previous elements of the series. 
# Thus, if FIB is a vector corresponding the Fibonacci series, FIB[1] = 0 and FIB[2] = 1, but FIB[3] is equal to FIB[1] + FIB[2]. 
# Likewise, FIB[4] = FIB[2] + FIB[3]. In general, for any element n of the series greater than 2, 
# we can calculate the corresponding Fibonacci number as FIB[n] <- FIB[n-1] + FIB[n-2]
# Use a for loop to make a new vector containing the first 17 elements of the Fibonacci series. 
# At each iteration, your loop should print something like “Fib number 5 is 3”
# Thus, you need to start by initializing a vector of length 17. 
# You’ll need to assign the first and second elements of the series before you begin the loop. 
# Remember that your loop variable does not need to begin with i = 1 or i = 0.

fibby <- c(0:16)
for(i in 3:length(fibby)){	
	fibby[1] <- fibby[1]
	fibby[2] <- fibby[2]	
	fibby[i] <- (fibby[(i-1)] + fibby[(i-2)])
	series <- c (cat("Fib number", i, "is", fibby[i], sep = " "))
	cat (series, sep= "\n")
}


#11. The three students in the above example have estimated annual expenditures for food, housing, and fun of: (in thousands of dollars)
# house <- c(4.8, 3.8, 5.7); food<- c(3.5, 4.3, 5.0); fun <- c(7.8, 2.1, 10.5); 
# and incomes (through TAships) of income <- c(21, 21, 21);
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5); 
income <- c(21, 21, 21);

bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;

for(j in 1:5){
	for (i in 1:3){
		bankAccounts[i] <- interestRate*bankAccounts[i]+bankAccounts[i]+income[i]-house[i]-food[i]-fun[i]
	}
	print(bankAccounts)
}


#if we assume a zero initial bank account - students are in trouble :-) too much fun
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5); 
income <- c(21, 21, 21);

interestRate <- 0.0525;

for(j in 1:5){
	for (i in 1:3){
		income[i] <- interestRate*income[i]+income[i]-house[i]-food[i]-fun[i]
	}
	print(income)
}



#12. Write a script that prints the pattern below. Save your script as file "invert_pyramid.R"
# when you source this file, it should print the pattern below to your R display. 
# You need to use the function cat() to print output to screen and two for loops (nested)
# You can just include the code that does this in your main homework script file

for (j in 1:1){
	for (i in 10:1){
		a <- rep("#", i)
		cat(a, sep = "")
		cat ("", sep = "\n")	
	}
}


#13. Use nested for loops in a script ‘pyramid_fun.R’, which prints the following to the display when sourced

for (i in 6:1){
	a <- LETTERS[1:i]
	cat(a, sep = "")
	cat("", sep = "\n")	
}
#MISSING SOME JUSTIFY FUNCTION

# 14. The data file ‘skinks.txt’ consists of pitfall capture data for Ctenotus skinks from Lorna Glen station in central Western Australia. 
# Columns of the data file include species names (‘species’), the site (24 sites total), 
# the individual trap (letter code), the mass (grams), snout-vent-length (mm), sex, 
# and capture date of each lizard.
# Create a dataframe ‘lizards’ by reading in ‘skinks.txt’.
# How many species of Ctenotus were captured at Lorna Glen? 
# Answer this question exactly, using a combination of length() and unique(). What does unique do?

lizards <- read.table(file="C:/R_course_MVZ/week3/skinks.txt", header = TRUE)
dim(lizards)
nrow(lizards)
ncol(lizards)
colnames(lizards)	

nspp<-unique(lizards$species);
length(nspp) # answer = 10

OR

nspp<-unique(lizards[,1]);
length(nspp)

#15. Write several lines of code that (1) create a new data frame with all missing data (NAs) for sex and weight omitted
# function is.na

?is.na
sexNA <- is.na(lizards$sex);
sexNNA <- sexNA != "TRUE";
lizards_sex <- lizards[sexNNA, ];
nrow(lizards_sex);

weightNA <- is.na (lizards_sex$weight);
weightNNA <- weightNA != "TRUE";
lizards_mined <- lizards_sex[weightNNA, ];
nrow(lizards_mined)


# select “leonhardii”
leos_mined <- lizards_mined[lizards_mined$species == "leonhardii", ]
nrow(leos_mined)

#Provide code that counts the number of male leonhardii individuals that were captured, unambiguously sexed, and weighed. 
# Now repeat for females. Note that I have not necessarily denoted males and females by “male” and “female” 
#  you can easily check the classifications used in $sex with the functions unique().
# Ignore any questionable males or females

unique(leos_mined$sex)# M  F  F? M? J  m?
unique(leos_mined$weight)# no problem with values
leos_male <- leos_mined[leos_mined$sex=="M", ]
nrow(leos_male) # answer 156


leos_female <- leos_mined[leos_mined$sex=="F", ]
nrow(leos_female) # answer 151

