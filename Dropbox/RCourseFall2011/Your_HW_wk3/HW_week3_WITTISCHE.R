rm(list=ls());
###
HOMEWORK WEEK 3
#3a)

for (i in 1:9){
cat(i, sep='\n');
}

#3b)

for (i in 1:10){
if (i<10)
{cat('*#')}
if (i==10)
{cat('*')}
}

x <- 2;
for (i in 1:4){
x <- x^2;
}

#Problem 4:

dogs <- 10;
for (i in 1:5){
dogs <- dogs + 1;
}
dogs

#Problem 5:

meatloaf <- 0;
for (i in 5:9){
meatloaf <- meatloaf - i + 1;
}
meatloaf

#Problem 6:

bubbles <- 12;
for (i in -1:-4){
bubbles <- i;
}
bubbles

nameVector <- c("Charlie", "Helga", "Clancy", "Matilda", "Jones");
for (i in 1:length(nameVector)){
cat("Nice to meet you,", nameVector[i], "\n");
}

compounded <- rep(0, length(bankAccounts));
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0525;
for (i in 1:length(bankAccounts))
{
compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
}
compounded

#Problem 7:

set.seed(1);
sumThis <- rnorm(10);
sumThis;

somme<-0
for (i in 1:length(sumThis)){;
	somme<-somme+sumThis[i]
}
somme
sum(sumThis)

#Problem 8:

letters

#a)

for (i in 1:7){
	cat(letters[i]);
}

#b)

for (i in 7:1){
	cat(letters[i],sep="\n");
}

#c)

for (i in 1:7){
	cat(letters[i],"");
}

#d)

for (i in 1:7){
	if (i<7)
	{cat(letters[i])
	cat("xx")}
	if (i==7)
	{cat(letters[i])}	
}

#Problem 9:

beerBottles <- function(x)
{
for(i in x:1)
{
cat(i, "bottles of beer on the wall")
cat("",sep="\n")
}
}
beerBottles(666)

i<-1
cat(i)
cat(" bottles of beer on the wall", sep="\n")

#Problem 10:

FIB<-rep(0,17)
FIB[1]<-0 
FIB[2]<-1
for (i in 3:17){
FIB[i]<-FIB[i-1]+FIB[i-2]
cat("Fibonacci number",i,"is",FIB[i])
cat(sep="\n")
}

#Problem 11:

house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5); 
income <- c(21, 21, 21);
bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;
for (j in 1:5)
{
for (i in 1:length(bankAccounts))
{
bankAccounts[i]<-bankAccounts[i]+income[i]-food[i]-fun[i]-house[i]
bankAccounts[i]<-interestRate*bankAccounts[i]+ bankAccounts[i]
}
print(bankAccounts)
}



#Problem 12:

for (i in 1:40)
{
for (k in i:40)
{
cat("#");
}
cat(sep="\n")
}

#Problem 13:
n<-26
l<-c(LETTERS,"")
l
for (i in 1:n)
{
for (k in 1:(n+1-i))
{
cat(l[k])
}
cat(sep="\n")
}


n<-26
a<-rep("",n^2)
M<-matrix(data=a,nrow=n,ncol=n)
M[1,]<-LETTERS[1:n]
for (i in 2:n)
{
for (j in 2:n)
{
M[i,j]<-M[i-1,j-1]
}
}
for (i in 1:n)
{
cat(M[i,])
cat(sep="\n")
}

n<-26
a<-rep("",n)
for (i in n:1) {
number_spaces<-n+1-i
cat(a[0:number_spaces])
cat(LETTERS[1:i],sep="")
cat(sep="\n")
}

n<-26
a<-rep(" ",n)
for (i in n:1) {
number_spaces<-n+1-i
cat(a[0:number_spaces])
cat(LETTERS[1:i],sep="")
cat(sep="\n")
}
#Problem 14:

lizards<-read.table("skinks.txt",header=TRUE)
head(lizards)
tail(lizards)

length(unique(lizards[,1]))

#Problem 15:
lizards2<-lizards[!is.na.data.frame(lizards$sex) | !is.na.data.frame(lizards$weight),]
leonhardii<-lizards[lizards$species=="leonhardii",]
sexes<-unique(lizards$sex)

length(which(lizards2[,5]=="M"))
length(which(lizards2[,5]=="F"))