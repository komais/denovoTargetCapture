###

for (i in 1:10){
cat(i, sep='\n');
}

for (i in 1:10){
cat(sqrt(i), sep='\n')
}


for (i in -13:-28){
cat(i, sep='\n');
}


 x <- 2;
for ( i in 1:4){
cat(x,sep='\n');
 x <-  x^2;
 cat(x,sep='\n');
}

#4 
dogs <- 10;
for (i in 1:5){
cat(dogs, sep='\n');
dogs <- dogs + 1;
cat(dogs, sep='\n');
}
#5
meatloaf <- 0;
for (i in 5:9){
cat(meatloaf, sep='\n');
meatloaf <- meatloaf - i + 1;
cat(meatloaf, sep='\n');
}

#6
bubbles <- 12;
for (i in -1:-4){
cat(bubbles,sep="\n");
bubbles <- i;
cat(bubbles,sep="\n");
}

 nameVector <-  c("Charlie", "Helga", "Clancy", "Matilda", "Jones");
for ( i in 1: length( nameVector)){
 cat("Nice to meet you,",  nameVector[ i], "\n");
}

 bankAccounts <-  c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
 interestRate <- 0.0525;
compounded<-  rep(0,  length( bankAccounts));
for ( i in 1: length( bankAccounts))
{
 compounded[ i] <-  interestRate* bankAccounts[ i] +  bankAccounts[ i];
}
 
 #7
 set.seed(1);
 sumThis <-  rnorm(10);
 aa=0
 for (i in 1:length(sumThis)){
 	aa=aa+sumThis[i];
 	
 }

#8

#i a-g side by side
aa<-c(letters);
for (i in 1:7){
	cat(aa[i])
}
	

#ii g-a seperate lines
aa<-c(letters);
for (i in 7:1){
	cat(aa[i],sep="\n")
}

#iii a-g space
aa<-c(letters);
b<-rep(0,7)
for (i in 1:7){
	bb[i]<-aa[i]
}
cat(bb)

#iv
aa<-c(letters);
for (i in 1:7){
	cat(aa[i],'xx',sep='')
}

# 10 
FIB<-rep(0,17)
FIB[1]=0
FIB[2]=1
for (i in 3:17){
	FIB[i]=FIB[i-1]+FIB[i-2]
	cat("Fib number", i, "is", FIB[i], cat(sep='\n'))
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
house <-  c(4.8, 3.8, 5.7); 
food<-  c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5); 
income <-  c(21, 21, 21);
income_new<- c(21, 21, 21);
for (j in 1:5){
	for(i in 1:3){
		income[i]<-income[i]-food[i]-fun[i]-house[i]
	}
	print(income)
	income=income+income_new
	}


#12  invert_pyramid.R
for (j in 1:10){
for (i in j:10){
	cat("#")
	}
cat(sep='\n')
}
		

#13 pyramid_fun.R
####2 loops####
a<- c(LETTERS)
for (j in 6:1){
for (i in 1:j){
	cat(a[i])
}
cat(sep="\n")
}


####1loop####
a<- c(LETTERS)
for (i in 6:1){
	cat(a[1:i],sep='')
	cat(sep='\n')
}


# 14
lizards<- read.table("/Users/KeBi/Desktop/RCourseFall2011/data/skinks.txt", header=TRUE)
head(lizards)
nrow(lizards) #1098 total indivudals capture
b<-length(unique(lizards$species)) #10 species captured at Lorna Glen


#15
lizards<- read.table("/Users/KeBi/Desktop/RCourseFall2011/data/skinks.txt", header=TRUE)
sex.weight.na<-is.na(lizards$sex) | is.na(lizards$weight)
c<-grep("FALSE", sex.weight.na)
lizards2<- lizards[c,]


d<- grep('leonhardii',lizards2$species)
leonhardii<-lizards2[d,]


unique(leonhardii$sex)
g<- replace(leonhardii$sex,leonhardii$sex=="M?","m?")
males<-length(grep("M",g))
g<- replace(leonhardii$sex,leonhardii$sex=="F?","m?")
females<-length(grep("F",g))




######list#######
#1
a<-rnorm(25)
myMatrix=matrix(a, nrow=5, ncol=5)
myAnimals=c('dog', 'cat','pig','fish','tiger')
AnimalNames=c('Nick','Anne','Stroey','Good')
Mylist<- list(my=myMatrix, animal=myAnimals, names=AnimalNames)
Mylist$my[2,3]
Mylist$animal[2:4]


#2
library(MASS)
data(Animals)
myFit <- lm(log(brain) ~ log(body), data = Animals)
myFit

