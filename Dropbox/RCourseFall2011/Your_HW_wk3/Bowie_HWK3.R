
#Rauri Bowie Homework WK3

#Q3a
for (i in 1:9){
	
	
	cat('*', '\n') #works with "sep='\n'
	
}


#Q3b
for (i in 1:10){
	
	
	cat('*#') #*#*#*#*#*#*#*#*#*#*#
	
	#could also use cat ('*', '#', sep='')
	
}



#Q4
#Initial value of dogs - 10

#loop	i		START		END
#1		1		10			11
#2		2		11			12
#3		3		12			13
#4		4		13			14
#5		5		14			15


#Q5
#Initial value of meatloaf - 0

#loop	i		START		END
#1		5		0			-4
#2		6		-4			-9
#3		7		-9			-15
#4		8		-15			-22
#5		9		-22			-30

#Final value of meatloaf -30

#Q6
#Initial value of bubbles - 12

#loop	i		START		END
#1		-1		12			-1
#2		-2		-1			-2
#3		-3		-2			-3	
#4		-4		-3			-4


#-------------------------------------------------------------------------

namevector <- c('charlie', 'Helga', 'Clancy', 'Matlida', 'Jones');

for (i in 1:length(namevector)){
	
	cat('nice to meet you', namevector[i], '\n');
	
}


#current financial holdings in thousands of dollars

bankaccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);

interestRate <- 0.0525;

compounded <- rep(0, length(bankaccounts));

for (i in 1:length(bankaccounts)){
	
	compounded[i] <- interestRate*bankaccounts + bankaccounts[i];
	
}

#-------------------------------------------------------------------------

#Q7
set.seed(1);
sumThis <- rnorm(10);

Addition <- 0;

for (i in 1:length(sumThis)){
	
	Addition <- Addition + sumThis[i];
	
}

#Addition = 2.48845
sum(sumThis); #2.48845


#Q8
#(i)
?letters

for (i in 1:7){
	
	cat(letters[i]);
	
}

#(ii)
for (i in 7:1){
	
	cat(letters[i], '\n');
	
}

#(iii)
for (i in 1:7){
	
	cat(letters[i]);
	cat(' ');
}	

#(iv)
for (i in 1:7){
	
	cat(letters[i]);
	if (i < 7) cat('xx');
}	


#9
beerBottles <- function(x) { 
		
	{ for (i in x:1)
	
	cat(i, 'bottles of beer on the wall', '\n');
	
	}
}

beerBottles(5);


#10 Fibonacci numbers

vector <- c(1:17);
Fibonacci <- rep(0, length(vector));
Fibonacci[1] <- 0;
Fibonacci[2] <- 1;

for (n in 3:17){
	
	Fibonacci[n] <- Fibonacci[n-1] + Fibonacci[n-2];

{ 
	cat('Fib number', sep=' ', n, 'is', Fibonacci[n], '\n');
}
	
}

#Fib number 3 is 1 
#Fib number 4 is 2 
#Fib number 5 is 3 
#Fib number 6 is 5 
#Fib number 7 is 8 
#Fib number 8 is 13 
#Fib number 9 is 21 
#Fib number 10 is 34 
#Fib number 11 is 55 
#Fib number 12 is 89 
#Fib number 13 is 144 
#Fib number 14 is 233 
#Fib number 15 is 377 
#Fib number 16 is 610 
#Fib number 17 is 987 


#-------------------------------------------------------------------------

bankaccounts <- c(10, 9.2, 5.6);
interestrate <- 0.0525;

for (j in 1:5)
{
	
	for (i in 1:length(bankaccounts))
	{
		
		bankaccounts[i] <- interestRate*bankaccounts[i] + bankaccounts[i];
	}
	print(bankaccounts)
}

#-------------------------------------------------------------------------


#11
house <- c(4.8, 3.8, 5.7);
food <- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5);
income <- c(21, 21, 21);

bankaccounts <- c(10, 9.2, 5.6);
interestrate <- 0.0525;

for (j in 1:5)
{
	
	for (i in 1:length(bankaccounts))
	{
		bankaccounts[i] <- bankaccounts[i] - house[i] - food[i] - fun[i] + income[i]
		bankaccounts[i] <- interestRate*bankaccounts[i] + bankaccounts[i];
	}
	print(bankaccounts)
}

#[1] 15.68225 21.05000  5.68350
#[1] 21.662818 33.522125  5.771384
#[1] 27.957366 46.649037  5.863881
#[1] 34.582378 60.465111  5.961235
#[1] 41.55520 75.00653  6.06370


#12
for (i in 10:1){
	
	for (j in 1:i){
		cat('#')
	}
	cat('\n')
}

#13 Have to head to bed, will give the last three another go tomorrow morning. Posting
#this in case you decide to have a look at my cumbersome code. Thanks!
