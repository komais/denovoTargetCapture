# HW Q1
myvec <- c(1*10:50*10);
myvec;


#HW Q2
intvec1 <- c(5,6,7,8,9);
intvec1;
intvec2 <- c(10,11,12,13,14);
intvec2;
intvec1/intvec2;
intvec1 * intvec2;
#The index position in the first vector is divided by or multiplied by its corresponding index positionin the seciond vector. 


#HW Q3
myvec3 <- c('R', 'T', 'E', 'C', 'V', 'O');
namesmyvec3 <- c(5,3,4,2,6,1);
myvec4 <- myvec3[namesmyvec3];
myvec4;

#HW Q4
library(MASS)
data(Animals)
Animals;
Animalsjustbrains <- Animals[ , 'brain'];
Animalsjustbrains;
Animalsjustbrains > 10;
sum(Animalsjustbrains > 10);


#HW Q5
library(ape);
mydf <- read.table(file = 'agamids_morphometrics.csv', sep = ',', header=TRUE);
mydf;
head(mydf);
dim(mydf);
#dimensions = 58 taxa, 17 variables


#HW Q6
mydf2 <- mydf[1:3,];
mydf2;
mydf3 <- mydf[20:25,];
mydf3;
rbind(mydf2,mydf3);
speciesnames <- rbind(mydf2,mydf3);
rownames(speciesnames);
vecspeciesnames <- rownames(speciesnames);
vecspeciesnames;


#HW Q7
myindex <- grep('KINGII', rownames(mydf));
myindex;
mydf[ myindex, ];
myindexCten <- grep('CTENOPHORUS', rownames(mydf));
myindexCten;
length(myindexCten);
mydfCten <- mydf[myindexCten, ];
mydfCten;
#there are 22 Ctenophorus in the matrix


#HW Q8
myindexDip <- grep('DIPORIPHORA', rownames(mydf));
myindexDip;
length(myindexDip);
mydfDip <- mydf[myindexDip, ];
mydfDip;


#HW Q9
mynewdf <- rbind(mydfCten, mydfDip);
mynewdf;
fit1 <- lm(svl ~ sha, data=mynewdf);
fit1;


#HW Q10
par(mfrow = c(2,1));
plot (svl ~ sha, data = mydfCten, xlim=c(2,4), ylim=c(3,5));
abline(fit1, lwd=2, col='blue');
plot (svl ~ sha, data = mydfDip, xlim=c(2,4), ylim=c(3,5));
abline(fit1, lwd=2, col='blue');


#HW Q11
compare_vec <- 'svl';
which(compare_vec > 4.5);

mydf;
mydfjustsvl <- mydf[ , 'svl'];
mydfjustsvl;
mydfjustsvl > 4.5;
sum(mydfjustsvl > 4.5);
# 18 have SVL's greater than 4.5

mydfjusttail <- mydf[ , 'tail'];
mydfjusttail;
mydfjusttail > 5.25;
svltail <- rbind(mydfjustsvl, mydfjusttail);
sum(mydfjustsvl > 4.5 & mydfjusttail > 5.25);
# 13 samples share these two trait limits
sum(mydfjustsvl > 4.5 | mydfjusttail > 5.25);
#20 samples have one or the other


#HW Q12
mydfCten[1:2];
mean(mydfCten[1:2]);
median(mydfCten$svl);
median(mydfCten$tail);
sd(mydfCten[1:2]);
#better to do these column by column not simultaneously until we get loops

#HW Q13
mean(mydfDip$hdep);
mean(mydfDip$dtr);
mean(mydfDip$hw);
#etc.
apply(Animals, MARGIN=2, FUN = mean); # will give a vector for each column
#check help for MARGIN with ?MARGIN


#HW Q14
mydf[mydf$svl == max(mydf$svl)];
which(mydf$svl == max(mydf$svl));
mydf[9,];

#HW Q15
mydf;
svlunlogged <- exp(mydf[,1]);
svlunlogged;
mydfbound <- cbind(mydf,svlunlogged);
mydfbound;
smallbodies <- mydfbound$svlunlogged < 120;
smallbodies <- mydfbound[mydfbound$svlunlogged < 120,];
smallbodies;
sum(smallbodies);
# 54 samples meet this criterion

#HW Q16
anotherdf <- read.table(file = 'biogeography.csv', sep = ',', header=TRUE);
anotherdf;
length(which(anotherdf == 0)); #49
length(which(anotherdf != 1));
anotherdfc1 <- anotherdf[ ,'region'];
length(which(anotherdfc1 !=1)); #149
length(which(anotherdfc1 !=2 |3));
