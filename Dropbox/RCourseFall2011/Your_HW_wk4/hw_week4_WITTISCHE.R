#Homework week 4:
rm(list=ls())

x <- 1;
y <- 1;
for (i in 1:50)
{
x <- c(x, rnorm(1, x[length(x)]));
y <- c(y, rnorm(1, y[length(y)]));
}
plot(y~x, type = 'l');

MAX <- 7;
index <- 0;
while(index <= MAX){
index <- index + 1;
cat('index value current: ', index, '\n', sep='');
}
cat("loop is done",sep="\n");
cat("Value of index at loop termination was ", index, "\n", sep="");

#Problem 1:

n<-17
a<-0
m<-0
while (a<n){
a<-a+1;
m<-m+a;
}
m

#Problem 2:

MAXPOPSIZE <- 2000;
curr_pop_size <- 1;
popvector <- curr_pop_size;
progeny <- 2;
while (curr_pop_size < MAXPOPSIZE){
curr_pop_size <- curr_pop_size*progeny;
popvector <- c(popvector, curr_pop_size);
}

plot(popvector)
#I don't know how to modify the plot so the first x value starts at 0

#Problem 3:
b<-rgeom(5000,1/3)
mean(b)
#It will always be around 2.
hist(b,breaks=30,right=FALSE)
c<-sum(b)
cat("This population gave birth to ",c,"progeny.")


#Problem 4:

popvectorvector<-0;
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
popvectorvector<-c(popvectorvector,length(popvector))
cat(length(popvector)-1,"generations were needed to exceed the MAXPOPSIZE.")
cat("\n")
}
popvectorvector
popvectorvector[-1]
mean(popvectorvector)

#Problem 5:
#Not necessarily because we just want to have 10 iterations but we could also
#put a while loop with a while(i<=10) and i<-i+1 . But a for loop is appropriate 

#Problem 6:
MAXPOPSIZE <- 50000000;
curr_pop_size <- 8;
popvector <- curr_pop_size;
set.seed(1);
while (curr_pop_size < MAXPOPSIZE){
babies <- rgeom(curr_pop_size, .33333);
curr_pop_size <- sum(babies);
popvector <- c(popvector, curr_pop_size);
plot(popvector)
}

#In this theoretical example a population will always increase unless
#possible but unlikely that every progeny number picked is 0 (non biologically
#realistic).
#See the maths below (I think it is this):
"5000!/(0!*5000!)*(2/3)^5000*(1/3)^0"
(2/3)^5000
#Oups R doesn't want to display the real number which is:
"3.4970731889581707239816124431599*10^(-881)"


#Problem 8:
for (i in 1:10)
{
cat(i, ' squared is ', i^2, '\n', sep='')
}
#There was this symbol ";" at the end of the first line.

#Problem 9-A:

n<-30
myBody<-400;
myAssBody<-120;
parLoadMe<-myBody
parLoadAss<-myAssBody
for (i in 1:n){
	myBody<-1.1*myBody;
	myAssBody<-1.2*myAssBody;
	parLoadMe<-c(parLoadMe,myBody)
	parLoadAss<-c(parLoadAss,myAssBody)
}
plot(parLoadMe)
points(parLoadAss,col="blue")

plot(log(parLoadMe))
points(log(parLoadAss),col="red")

#Problem 9-B:

massPar<-10^-6;
myAssBody<-120;
massParTotal<-massPar*myAssBody
time<-0
while (massParTotal<=55){
	myAssBody<-1.2*myAssBody;
	massParTotal<-myAssBody*massPar;
	time<-time+1;
}
cat(time,"days were required to acquire such a large parasite load.")

#Problem 10:

#There is a sourcing error, don't know how to fix it.
source("format.R");
cat("\t this is tab-indent. now i will show you","the new-","line character: \\n","and the backslash is \\","this formatted output stuff is slick!!",sep="\n");

#Problem 11:

lizards<-read.table("skinks.txt",header=T,sep="\t");
species<-unique(lizards$species);
meanValue<-0;
for (i in 1:length(species))
{
	subset<-lizards[which(lizards$species==species[i]),];
	meanValue<-c(meanValue,mean(subset[,"snout_vent"]));
}
realMeanValue<-meanValue[-1];
realMeanValue;

#Problem 12:

lizards<-read.table("skinks.txt",header=T,sep="\t");
species<-unique(lizards$species);
maxValue<-0;
for (i in 1:length(species))
{
	subset<-lizards[which(lizards$species==species[i]),];
	maxValue<-c(maxValue,max(subset[,"snout_vent"]));
}
realMaxValue<-maxValue[-1];
realMaxValue;

names(realMaxValue)<-species;
names(realMeanValue)<-species;


#Problem 13:

lizards<-read.table("skinks.txt",header=T,sep="\t");
species<-unique(lizards$species);
sitesNumber<-0;
for (i in 1:length(species)){
	subset<-lizards[which(lizards$species==species[i]),];
	sitesNumber<-c(sitesNumber,length(unique(subset[,"site"])));
}
sitesNumber<-sitesNumber[-1];
names(sitesNumber)<-species;
sitesNumber;
names(which(sitesNumber[]==max(sitesNumber)));

#Problem 14:

lizards$species[which(lizards[,"snout_vent"]==max(lizards[,"snout_vent"]))];










