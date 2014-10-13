dir ();
source('myAnalysis.R');
#source allows you to draw a file from a directory and run it..

x <- 'Draco lizards are cool';
x;
#x is a variable storing a text string

cat(x, file = 'output.txt');
dir ();

x <- 1:5;
x;
cat(x, 10, 30);
#cat just added 10 and 30 to the text in file x

cat('A', 'B', 'C', sep = '');
#sep is what we want to separate the variables by and '' means no space

cat('A', 'B', 'C', sep = '   ');




#moving on to "for" loops
#for(some condition) {do something}
#i = an iterator variable
#the curly closing bracket should be at same position as "for"
#\n = new line

for(i in 1:2){
	#do something
	cat('Value of i is ', i, '\n');
}


for(i in 1:10){
	cat('Value of i is ', i, '\n');
}

###
sumvariable <- 0; #sumvariable starts with value of 0

for(i in 1:10){
	cat('\n');
	cat('START: sumvariable = ', sumvariable);
	cat('\n');
	cat('Value of i is ', i, '\n');
	sumvariable <- sumvariable + i;
	cat('END: sumvariable = ', sumvariable);
	cat('\n');

}

#we don't have a table, so this is theoretical - to create a tab-delimited file
write.table(myData, sep = '\t');



for (i in 1:10){
	cat(sqrt(i), sep = '\n');	
}


for (i in 5:9){
	cat(sqrt(i), sep = '\n');	
}


for (i in -13:-28){
	cat(sqrt(i), sep = '\n');	
}



#HW Week 3

#3a

for (i in 1:10){
	cat("*", sep = '\n');	
}


#3B

for (i in 1:10){
	cat("*", '#');	
}

x <- 2;
for (i in 1:4){
x <- x^2;
}

x
#x=65536


#4 
#i=1 value at start of iteration 1 = 10, at end = 11
#i=2 value at start of iteration 2 = 11, at end = 12
#i=3 value at start of iteration 3 = 12, at end = 13
#i=4 value at start of iteration 4 = 13, at end = 14
#i=5 value at start of iteration 5 = 14, at end = 15

dogs <- 10;
for (i in 1:5){
dogs <- dogs + 1;
}
dogs
# dogs = 15, correct


#5
5 = -4
6 = -9
7 = -15
8 = -22
9 = -30

meatloaf <- 0;
for (i in 5:9){
meatloaf <- meatloaf - i + 1;
}
meatloaf;
#-30 (correct)


#6
# i=-1 value at at start of iteration -1 and decreases by -1 with each iteration. The initial value of 12 has no effect on then loop



nameVector <- c("Charlie", "Helga", "Clancy", "Matilda", "Jones");
nameVector;
for (i in 1:length(nameVector)){
cat("Nice to meet you,", nameVector[i], "\n");
}

#current financial holdings in thousands of dollars
# of a random sample of cornell grad students

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0525;
compounded <- rep(0, length(bankAccounts));

for (i in 1:length(bankAccounts)){
compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
}
compounded;



#7
set.seed(1);
sumThis <- rnorm(10);
sumThis
summedThis <- sum(sumThis[1:10]);
summedThis

for (i in 1){
	cat(sumThis[1:10]);
	sumThis <- sumThis[1:10];	
	}
sumThis;


#8i)
for (i in 1){
	cat(letters[1:7], sep = '');
}

#8ii)
for (i in 1){
	cat(letters[7:1], sep = '\n');
}

#8iii)
for (i in 1){
	cat(letters[1:7], sep = ' ');
}

#8iv)
for (i in 1){
	cat(letters[1:7], sep = 'xx');
}



#10
FIB <- rep(0,17);
FIB[1] <- 0;
FIB[2] <- 1;
for(i in 3:17){
	cat('\n');
	cat('FIB Number', i, '');
	FIB[i] <- FIB[i-1] + FIB[i-2];
	cat('=', FIB[i]);
	cat('\n');
}


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


#11
bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;

house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5);
income <- c(21, 21, 21);

bankAccountsnew <- rep(0:3);


for (j in 1:5)
{
	for (i in 1:length(bankAccounts)){
		bankAccountsnew[i] <- bankAccounts[i]+income[i]-house[i]-food[i]-fun[i];
		bankAccounts[i] <- interestRate*bankAccountsnew[i]+ bankAccountsnew[i]
	}
	print(bankAccounts)
}




for (i in 1:5)
{
	for (k in i:5)
	{
		cat('i is ', i, ' k is ', k, '\n', sep='');
	}
}



#12
myvector <- c(#', '#', '#', '#', '#', '#', '#', '#');
myvector2 <- sum(myvector[1:7]);

for (i in 7:1){
	myvector2 <- sum(myvector[i] - myvector[i-1]);
	myvector2 <- sum(myvector[i] - myvector[i-1]);
	}
