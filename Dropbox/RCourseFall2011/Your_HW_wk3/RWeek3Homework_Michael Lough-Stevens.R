#3a ) Modify one of the for loop statements above so that it runs from 1:9 and prints the following output to the R console:
for(i in 1:9){
	
	cat('*')
	cat('\n')
	
}

#3b) Modify your loop so that it prints 10 asterisks, with each asterisk separated by exactly one pound sign (#), with no spaces or new line characters.

for(i in 1:10){
	
	cat('*')
	cat('#')
	
}
# *#*#*#*#*#*#*#*#*#*#
#One of the most useful features of for loops is the ability to modify variables within the foor loop. Consider the following bit of code:

x <- 2;
for(i in 1:4){
	
	x <- x^2
	cat(x)
	cat('\n')
}

nameVector <- c("Charlie", "Helga", "Clancy", "Matilda", "Jones")

for (i in 1:length(nameVector)){
	
	cat("Nice to meet you,", nameVector[i], "\n")
	
}

#current financial holdings in thousands of dollars of a random sample of cornell grad students
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0525;
compound <- rep(0,length(bankAccounts));

for (i in 1:length(bankAccounts)){
	
	compound[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
	
}

#7) Pretend that the function sum() does not exist. If sumThis is a vector of numbers, provide code that sums all of the elements of sumThis, incrementally. Do this using a for loop. Do this with the following vector of numbers: (you should also check your results somehow):
set.seed(1);
sumThis <- rnorm(10)
summed <- 0

for (i in 1:length(sumThis)){
	
	summed <- summed + sumThis[i]
	
}
> summed
[1] 1.322028
> sum(sumThis)
[1] 1.322028

#8) Using a vector of all letters (*hint: what is letters in R?) and a for loop, do the following:

#(i): print the letters "a" through "g" side by side, with no space between them; then:

letterVector <- c("a", "b", "c", "d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")

for (i in 1:7){
	
	cat(letterVector[i])
	
}

abcdefg

#(ii) print the letters "a" to "g" on separate lines, in reverse order (g, f, e...a):

for (i in 7:1){
	
	cat(letterVector[i])
	cat("\n")
	
}
g
f
e
d
c
b
a

#(iii) A bit trickier: Print the letters "a" to "g" separated by a space:

for (i in 1:7){
	
	cat(letterVector[i])
	cat(" ")
	
}
a b c d e f g 

#(iv) Print letters "a" to "g" separated by "xx":

for (i in 1:7){
	
	cat(letterVector[i])
	cat("xx")
	
}
#Question: How can I make it so that I don't print xx unless it is between two letters of the alphabet?

#9) Write a function "beerBottles" that takes an integer x as an argument (actually, I have already done this part for you). When you execute the function, beerBottles(5), for example, you should have get the following output on your screen:
#Here is the template function. Fill in the relevant bits for SOME CONDITION and EXECUTE SOMETHING:

beerBottles <-function(x){
	
	for(i in x:1){
		
		cat(i,"bottles of beer on the wall")
		cat("\n")
		
	}
}
5 bottles of beer on the wall
4 bottles of beer on the wall
3 bottles of beer on the wall
2 bottles of beer on the wall
1 bottles of beer on the wall

#10) Fun with Fibonacci: The Fibonacci numbers are a famous series tht run from 0 to infinity. The first two numbers in the series are 0 and 1, but all other numbers in the series are formed by summing the two previous elements of the series. Thus, if FIB is a vector corresponding to the Fibonacci series, FIB[1]=0, FIB[2]=1, but FIB[3]=FIB[1]+FIB[2].Likewise, FIB[4]=FIB[2]+FIB[3]. In general, for any element n of the series greater than 2, we can calculate the corresponding Fibonacci number as FIB[n] <- FIB[n-1] + FIB[n-2]

#Use a for loop to make a new vector containing the first 17 elements of the Fibonacci series. At each iteration, your loop should something like "Fib number 5 is 3" . Thus, you need to start by initializing a vector of length 17. You'll need to assign the first and second elements of the series before you begin the loop. Remember that your loop variable does not need to begin with i = 1 or i = 0.

fibVector <- rep(0,17);
fibVector[1] <- 0;
fibVector[2] <- 1;

for (i in 3:length(fibVector)){

	fibVector[i] <- fibVector[i-1] + fibVector[i-2]
	cat("Fib number", i, "is" ,fibVector[i])
	cat("\n")
	
}
Fib number 3 is 1
Fib number 4 is 2
Fib number 5 is 3
Fib number 6 is 5
Fib number 7 is 8
Fib number 8 is 13
Fib number 9 is 21
Fib number 10 is 34
Fib number 11 is 55
Fib number 12 is 89
Fib number 13 is 144
Fib number 14 is 233
Fib number 15 is 377
Fib number 16 is 610
Fib number 17 is 987

bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525

for (j in 1:5){
	
	for (i in 1:length(bankAccounts)){
		
		bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
		
	}
	print(bankAccounts)
	
}

#11) The three students in the above example have estimated annual expenditures for food, housing and fun of: (in thousands of dollars)

house <- c(4.8, 3.8, 5.7);
food <- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5);
income <- c(21,21,21);

#Modify the 5-year interest-compounding code above so that each year, it deducts the expenditures and adds the income (BEFORE compounding) for each student. You can assume (for example) that food[2] and food[3] correspond to the food expenditures of the 2nd and 3rd students, respectively. Etc.

bankAccounts <- rep(0,3);
interestRate <- 0.0525;

for (j in 1:5){
	
	for (i in 1:length(bankAccounts)){
		
		bankAccounts[i] <- interestRate*(bankAccounts[i] + income[i] - house[i] - food[i] - fun[i]) + bankAccounts[i]
		
	}
	print(bankAccounts)
	
}
[1]  0.25725  0.56700 -0.01050
[1]  0.52800562  1.16376750 -0.02155125
[1]  0.81297592  1.79186529 -0.03318269
[1]  1.11290716  2.45293822 -0.04542478
[1]  1.42858478  3.14871748 -0.05830958

#My only problem with the above question is that once you are in the red, you still are having that debt compounded and it's impossible to get back into the black. But obviously, the student is still spending more than they can afford.

for (i in 1:5){
	
	for (k in i:5){
		
		cat('i is ', i, ' k is ', k, "\n", sep='')
		
	}
	
}

#12) Write a script that prints the pattern below. Save your script as file "invert_pyramid.R" When you source this file, it should print the pattern below to your R display. You need to use the function cat() to print output to screen and two for loop (nested). You can just include the code that does this in your main homework script file (you don't need to upload a separate file to Dropbox).

for (j in 1:10){
	
	for (k in j:10){
		
		cat("#")
		}
	
	cat("\n")
}

source("Invert_Pyramid.R")

##########
#########
########
#######
######
#####
####
###
##
#


#13) Challenge! Use nested for loops in a script 'pyramid_fun.R', which prints the following to the display when sourced:

ABCDEF
 ABCDE
  ABCD
   ABC
    AB
     A
     
#14) The data file 'skinks.txt' consists of pitfall capture data for Ctenotus skinks from Lorna Glen station in central Western Australia. Columns of the data file include species names ('species'), the site (24 sites total), the individual trap (letter code), the mass (grams), snout-vent-length (mm), sex, and capture date for each lizard.

#Create a dataframe 'lizards' by reading in 'skinks.txt'

lizards <- read.table("skinks.txt", header = TRUE, sep = "")

#How many species of Ctenotus were captured at Lorna Glen? Answer this question exactly, using a combination of length() and unique(). What does unique do? I'm not telling.

length(unique(lizards$species))
[1] 10

#15) Write several lines of code that

#1) create a new data frame with all missing data (NAs) for sex and weight omitted. Hint: what does the function is.na do?

is.na(lizards$sex)

is.na(lizards$weight)

#Still working through this, I'll make another crack at it as soon as possible tomorrow



















































































































