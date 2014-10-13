#3a ) Modify one of the for loop statements above so that it runs from 1:9 and prints the
#following output to the R console:
#*
#*
#*
#*
#*
#*
#*
#*
#*


for (i in 1:9){
	cat('*', sep = '\n');
	
	
}

#3b) Modify your for loop so that it prints 10 asterisks, with each asterisk separated by
#exactly one pound sign (#), with no spaces or new line characters.  You will need to modify #some arguments to the cat() function.

for (i in 1:10){
	cat('*#', sep = '\t');	
	
}
#This doesn't quite work... you get an extra # sign at the end.

#4)
dogs <- 10;
for (i in 1:5){
dogs <- dogs + 1;
}

#Initial value of dogs: 10
#i		#value at start		#value at end
#1		10					11
#2		11					12
#3		12					13
#4		13					14
#5		14					15


#5)
meatloaf <- 0;
for (i in 5:9){
	meatloaf <- meatloaf - i + 1
}

#Initial value of meatloaf: 0
#i		#value at start		#value at end
#5			0				0-5+1 = -4
#6			-4				-4-6+1 = -9
#7			-9				-9-7+1 = -15
#8			-15				-15-8+1 = -22
#9			-22				-22-9+1 = -30
#Final value of meatloaf = -30

#6)
bubbles <- 12;
for (i in -1:-4){
bubbles <- i;
}

#Initial value of bubbles: 12
#i		#value at start		#value at end
#-1			12				-1
#-2			-1				-2
#-3			-2				-3
#-4			-3				-4


 nameVector <-  c("Charlie", "Helga", "Clancy", "Matilda", "Jones");
for ( i in 1: length( nameVector)){
 cat("Nice to meet you,",  nameVector[ i], "\n");
}

#current financial holdings in thousands of dollars
# of a random sample of cornell grad students
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0525;
for (i in 1:length(bankAccounts))
{
compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
}

 compounded <-  rep(0,  length( bankAccounts));
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0525;
for (i in 1:length(bankAccounts))
{
compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
}


#7) Pretend that the function sum() does not exist. If sumThis is a vector of numbers,
#provide code that sums all of the elements of sumThis, incrementally. Do this using a for
#loop.  Do this with the following vector of numbers: (you should also check your results
#somehow):
set.seed(1);
sumThis <- rnorm(10);

#Summing using the for loop:
question7 <- 0;
for (i in 1:length(sumThis)){
	question7 <- question7 + sumThis[i]
	
}
question7;

#Check using sum function
sum(sumThis);


8) Using a vector of all letters (*hint: what is letters in R?) and a for loop, do the
following:
(i) print the letters “a” through “g” side by side, with no space between them; then
#Create a vector of all letters:
all.letters <- c(letters);
for (i in 1:7){
	cat(all.letters[i])
	
}

(ii) print the letters “a” to “g” on separate lines, in reverse order (g, f, e….a).
for (i in 7:1){
	cat(all.letters[i], sep = '\n')
	
}

(iii) A bit trickier: Print the letters “a” to “g” separated by a space
for (i in 1:7){
	cat(c(all.letters[i], ' ') , sep = '')
	
}

9) Write a function “beerBottles” that takes an integer x as an argument (actually, I
have already done this part for you). When you execute the function,
beerBottles(5) , for example, you should have get the following output on your
screen:
5 bottles of beer on the wall
4 bottles of beer on the wall
3 bottles of beer on the wall
2 bottles of beer on the wall
1 bottles of beer on the wall
Here is the template function. Fill in the relevant bits for SOME CONDITION and
EXECUTE SOMETHING.


beerBottles <- function(x);
{
	for(i in x:1)
	{
		cat(i, 'bottles of beer on the wall', '\n');
	}
}


#10) Fun with Fibonacci: The Fibonacci numbers are a famous series that run from 0 to
#infinity. The first two numbers in the series are 0 and 1, but all other numbers in the
#series are formed by summing the two previous elements of the series. Thus, if FIB is a
#vector corresponding the Fibonacci series, FIB[1] = 0 and FIB[2] = 1, but FIB[3] is equal
#to FIB[1] + FIB[2]. Likewise, FIB[4] = FIB[2] + FIB[3]. In general, for any element n
#of the series greater than 2, we can calculate the corresponding Fibonacci number as
#FIB[n] <- FIB[n-1] + FIB[n-2]
#Use a for loop to make a new vector containing the first 17 elements of the Fibonacci
#series. At each iteration, your loop should print something like “Fib number 5 is
#3” Thus, you need to start by initializing a vector of length 17. You’ll need to assign
#the first and second elements of the series before you begin the loop. Remember that
#your loop variable does not need to begin with i = 1 or i = 0
fib.17 <- rep(0, 17);
fib.17[2] <- 1;

for( i in 3:17){
	fib.17[i] <- fib.17[i-1] + fib.17[i-2];
	cat('Fib number ', i, ' is', fib.17[i], '\n');
}
fib.17
#The vector fib.17 includes Fib numbers 1 and 2, but those don't appear in the text (cat) output.  Is that OK?

bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;
for (j in 1:5)
{
for (i in 1:length(bankAccounts))
{
bankAccounts[i] <- interestRate*bankAccounts[i]+ bankAccounts[i]
}
print(bankAccounts)
}


#11) The three students in the above example have estimated annual expenditures for
#food, housing, and fun of: (in thousands of dollars)
house <- c(4.8, 3.8, 5.7);
food<- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5); 
#and incomes (through TAships) of
income <- c(21, 21, 21);
#Modify the 5-year interest-compounding code above so that each year, it deducts the
#expenditures and adds the income (BEFORE compounding) for each student. You can
#assume (for example) that food[2] and food[3] correspond to the food expenditures of #the 2nd & 3rd students, respectively. Etc.

q11.bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;
for (j in 1:5)
{
for (i in 1:length(q11.bankAccounts))
{
amount.left <-q11.bankAccounts[i] - house[i] - food[i] - fun[i] + income[i];
q11.bankAccounts[i] <- interestRate*(amount.left) + amount.left;
}
print(q11.bankAccounts)
}


#You can even pass loop variables from an outer loop to an inner loop. Watch what
#happens in the following construct:
for (i in 1:5)
{
for (k in i:5)
{
cat('i is ', i, ' k is ', k, '\n', sep='');
}
}


#12) Write a script that prints the pattern below. Save your script as file
#“invert_pyramid.R”. When you source this file, it should print the pattern below to your
#R display. You need to use the function cat() to print output to screen and two for loops
#(nested). You can just include the code that does this in your main homework script file
#(you don’t need to upload a separate file to Dropbox).
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

#This works
for (i in 10:1)
{
	for (k in 1:i){
	q12 <- cat('#',sep = '');
	
	}
	cat(q12, sep = '\n');
}
source('invert_pyramid.R')

#Source doesn't work.


#13) Challenge! Use nested for loops in a script ‘pyramid_fun.R’, which prints the
#following to the display when sourced:
#ABCDEF
# ABCDE
#  ABCD
#   ABC
#    AB
#     A
#Think about it! Tricky! You can do this with only 2 for loops (and maybe even 1). This
#is optional (for now, anyway), but you’ll demonstrate your mastery of loops if you
#can solve this!
q13.LETTERS <- LETTERS[1:6];

for (i in 6:1)
{cat(rep(' ', 6-i), sep= '')
	for (k in 1:i){
	
	q13 <- cat(q13.LETTERS[k],sep = '');
	
	}
	cat(q13, sep = '\n');
}

#I also tried saving my code for this question in a separate script file (q13.R) and sourcing that file, but that didnt' work either.  Booooooo.

#14) The data file ‘skinks.txt’ consists of pitfall capture data for Ctenotus skinks from
#Lorna Glen station in central Western Australia. Columns of the data file include species
#names (‘species’), the site (24 sites total), the individual trap (letter code), the mass
#(grams), snout-vent-length (mm), sex, and capture date of each lizard.
#Create a dataframe ‘lizards’ by reading in ‘skinks.txt’.
lizards <- read.table('skinks.txt', header = T);

#How many species of Ctenotus were captured at Lorna Glen? Answer this question
#exactly, using a combination of length() and unique(). What does unique do?
#I’m not telling.
length(unique(lizards$species))

#15) Write several lines of code that (1) create a new data frame with all missing data
#(NAs) for sex and weight omitted. Hint: what does the function is.na do?
lizards.no.NA <- na.omit(lizards)

#NOW: make yet another dataframe containing only individuals identified as “leonhardii”,
#using subsetting tricks that you already know. Be careful: does this dataframe have
#rownames?
leonhardii <- subset(lizards.no.NA, lizards.no.NA$species == 'leonhardii');

#Or if I didn't know the function subset...
myindex <- grep('leonhardii', lizards.no.NA$species);
leonhardii2<- lizards.no.NA[myindex, ];


#FINALLY: Provide code that counts the number of male leonhardii individuals that were
#captured, unambiguously sexed, and weighed. Now repeat for females. Note that I have
#not necessarily denoted males and females by “male” and “female” – you can easily
#check the classifications used in $sex with the functions unique(). Ignore any
#questionable males or females.
#Check categories for sex
levels(leonhardii$sex)
#or...
unique(leonhardii$sex)

#Males
m.leonhardii <- subset(leonhardii, leonhardii$sex == 'M')
nrow(m.leonhardii)

#Females
f.leonhardii <- subset(leonhardii, leonhardii $sex == 'F')
nrow(f.leonhardii)

#Or without using subset:
my.m.index <- grep ('M', leonhardii$sex);
m.leonhardii2 <- leonhardii[my.m.index, ];
nrow(m.leonhardii2)

my.f.index <- grep ('F', leonhardii$sex);
f.leonhardii2 <- leonhardii[my.f.index, ];
nrow(f.leonhardii2)

#These two ways give me different answers (the second way says there is one more M and one more F).  I don't understand why they are different.
#Also, why doesn't length(m.leonhardii) work to tell you how many males there are?











