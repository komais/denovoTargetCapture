#3a

for (i in 1:9){ 
	
	cat('*', sep='\n');

}

#3b

for (i in 1:9) {
	
	cat ('*', '#', sep= '');
	
}

#4  	i		dogs start		dogs end
#		1		10				11
#		2		11				12
#		3		12				13
#		4		13				14
#		5		14				15
		

#5 		i		meat start		meat end
#		5		0				-4
#		6		-4				-9
#		7		-9				-15
#		8		-15				-22
#		9		-22				-30
		
#meatloaf final = -30

#6 initial value of bubbles 12

#	i		bubblestart	bubbleend
#	-1		12				-1
#	-2		-1				-2
#	-3		-2				-3
#	-4		-3				-4
	
##### initializing vectors
nameVector <- c("Charlie", "Helga", "Clancy", "Matilda", "Jones"); 

for (i in 1:length(nameVector)){
	
	cat("Nice to meet you,", nameVector[i], "\n");
	
}				


bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0525; 
compounded <- rep(0, length(bankAccounts));

for (i in 1:length(bankAccounts)){ 

	compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
	print(compounded[i]);
}
####7 not sure if this is right, but gets it to incrementally add random numbers.  

set.seed(1); 
sumThis <- 0;
sumThis;
for (i in rnorm(10)){
	
	sumThis <- sumThis + i;
	cat('sumThis is', sumThis, '\n');
	
}

##Check
sum(sumThis);

#####8
## i
lett <- c('a', 'b', 'c', 'd', 'e', 'f', 'g');

for (i in 1:length(lett)){
	
	cat(lett[i], sep='');
}

##ii

for (i in length(lett):1){
	
	cat(lett[i], sep='\n');
}
## iii

for (i in 1:length(lett)){
	
	cat(lett[i], ' ');
}

##iv - got it except that sep won't put xx's in there, only can do by adding to end of statement, which adds xx's at end too - could only do this with cat outside of a loop, or by modifying the loop kindof crazily
for (i in 1:length(lett)){
	
	cat(lett[i],'xx', sep='');
}

###10

fib1 <- 0
fib2 <- 1
fib <- 0

fibonacci <- c(fib1, fib2) 

for (i in 3:17){
	
	fib <- fib1 + fib2;
	fib1 <- fib2;
	fib2 <- fib;
	fibonacci <- c(fibonacci, fib);
	cat('fib number', i, 'is', fib, '\n');
}

fibonacci;

##part 2
bankAccounts <- c(10, 9.2, 5.6); 
interestRate <- 0.0525;
for (j in 1:5) {

	for (i in 1:length(bankAccounts)) {

		bankAccounts[i] <- interestRate*bankAccounts[i]+ bankAccounts[i];
		
		}
		
		print(bankAccounts)
}

###11
bankAccounts <- c(10, 9.2, 5.6); 
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5);	
income <- c(21, 21, 21);
interestRate <- 0.0525;
for (j in 1:5) {

	bankAccounts <- bankAccounts - house - food - fun + income;
 		cat('starting bank accounts are', bankAccounts, '\n');

	for (i in 1:length(bankAccounts)) {
 		
		bankAccounts[i] <- interestRate*bankAccounts[i]+ bankAccounts[i];
		
		}
		
		print(bankAccounts)
}


###part2 

for (i in 1:5)
{
		for (k in i:5)
		{ 
			cat ('i is ', i, ' k is ', k, '\n', sep='');
			}
}


###12 can't get this to save to a file, could just copy and paste it into a file, also, don't use two for loops, don't know if its ok to do this way

for (i in 10:1){
	cat (rep ('#', i),'\n', sep='');
}

###13 ahh, i give up, this is as far as i could go

fun <- c('A', 'B', 'C', 'D', 'E', 'F');
spaces <- 0;
for (i in 1:6)) {
	cat (fun[i], sep='');
	
	for (j in i:1) {
	cat (fun[i], sep='');
	}
}
	
	
#####14

lizards <- read.table('skinks.txt', header=TRUE, sep='\t');

length (unique(lizards[,1]));

###15
liz2 <- na.omit(lizards)
liz2 

liz3 <- liz2 [liz2$species=='leonhardii', ]

nrow (liz3 [liz3$sex == 'M', ])

nrow (liz3 [liz3$sex == 'F', ])


	
	
	
	
	
	
	
	
	
	
	
	
	