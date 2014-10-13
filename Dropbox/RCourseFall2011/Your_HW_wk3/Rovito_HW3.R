#Homework week 3: Sean Rovito
#Problem 3a
for (i in 1:9){
	cat('*', '\n');
}


#Problem 3b
for (i in 1:10){
	cat('*', '#', sep='');
}


#Problem 4
#Initial value of dogs: 10
#i	start	end
#1	10		11
#2	11		12
#3	12		13	
#4	13		14
#5	14		15

#Problem 5
#initial value of meatloaf: 0
#i	start	end
#5	0		-4	
#6	-4		-9
#7	-9		-15
#8	-15		-22
#9	-22		-30
#final value of meatloaf: -30

#Problem 6
Initial value of bubbles: 12
#i	start	end
#-1	12		-1
#-2	-1		-2
#-3 -2		-3
#-4 -3		-4

#Problem 7
set.seed(1);
sumThis<-rnorm(10);
sumvariable=0;
for (i in 1:length(sumThis)){
	sumvariable=sumvariable+sumThis[i];
}

#Problem 8
letters<-c('a', 'b', 'c', 'd', 'e', 'f', 'g');
#8a
for (i in 1:length(letters)){
	cat(letters[i]);
}

#8b
for (i in length(letters):1){
	cat(letters[i], '\n');
}

#8c
for (i in 1:length(letters)){
	cat(letters[i], ' ');
}
#8d
for (i in 1:length(letters)){
	cat(letters[i], 'xx', sep='');
}

#Problem 9
beerBottles <- function(x)
{
	for (i in x:1){
	cat(i, 'bottles of beer on the wall', '\n', sep=' ');
	}
}

#Problem 10
FIB<-rep(0, 17);
FIB[2]<-1;
for (i in 3:length(FIB)){
	FIB[i]<-FIB[i-2]+FIB[i-1];
	cat('Fibonacci number', i, 'is', FIB[i], '\n', sep=' ');
}

#Problem 11
bankAccounts<- c(10, 9.2, 5.6);
interestRate<- 0.0525;
house<- c(4.8, 3.8, 5.7);
food<- c(3.5, 4.3, 5.0);
fun<-c(7.8, 2.1, 10.5);
income<- c(21, 21, 21);

for (j in 1:5){
	for (i in 1:length(bankAccounts)){
		bankAccounts[i]<- bankAccounts[i] - house[i] - food[i] - fun[i] + income[i];
		bankAccounts[i]<- interestRate*bankAccounts[i]+bankAccounts[i];
	}
	print(bankAccounts);
}

#Problem 12

for (i in 10:1){
	for (j in 1:i){
		cat('#');
	}
	cat('\n');
	
}

#Problem 13
let<-c('A', 'B', 'C', 'D', 'E', 'F');
for (i in (0:5)){
	cat(rep(' ',(i)), sep='');
	for (j in i:6){
		cat(let[j-i]);
	}
	cat('\n');
}

#Problem 14
lizards<-read.table(file='/Users/Sean/Desktop/R Course/data/skinks.txt', sep='\t', header=TRUE);
uniqueSpecies<-unique(lizards$species);
length(uniqueSpecies);

#Problem 15
noNA<-lizards[is.na(lizards$sex)==FALSE & is.na(lizards$weight)==FALSE,];
leon<-lizards[lizards$species=='leonhardii',];
lmales<-leon[is.na(leon$sex)==FALSE & is.na(leon$weight)==FALSE & leon$sex=='M',]
nrow(lmales);
lfem<-leon[is.na(leon$sex)==FALSE & is.na(leon$weight)==FALSE & leon$sex=='F',]
nrow(lfem);
