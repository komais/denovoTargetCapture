##### Sean Reilly's Week2 HW #####

#1
myvec <- c(1:50);
myvec2 <- myvec*10;
myvec2;

#2
myvec <- c(1,2,3,4,5);
myvec2 <- c(6,7,8,9,10);
vec.div <- myvec/myvec2;
vec.div;
vec.multiply <- myvec*myvec2;
vec.multiply;

#3
myvec <- c('R', 'T', 'E', 'C', 'V', 'O');
Word.vector <- myvec[c(5, 3, 4, 2, 6, 1)];
Word.vector;

#4
library(MASS);
data(Animals);
Big.brain <- Animals$brain >=10;
Count.big.brain <- length(grep('TRUE', Big.brain));
Count.big.brain;
sum(Big.brain, na.rm='TRUE');

#5
library(ape);
aga.data <- read.table('/Users/seanreilly/Desktop/R course/Week2/agamids_morphometrics.csv', sep=',', header=TRUE)
head(aga.data);
dim(aga.data);

#6
aga.3 <- head(aga.data, 3);
aga.20to25 <- aga.data[20:25, ];
aga.3;
aga.20to25;
Comb.aga <- merge(aga.3, aga.20to25, all=TRUE);
Comb.aga;
Comb.aga2 <- rbind(aga.3, aga.20to25);
Comb.aga2;
species <- row.names(Comb.aga2);
species;

#7
aga.index <- grep('CTENOPHORUS', rownames(aga.data));
aga.cte <- aga.data[aga.index, ];
nrow(aga.cte);

#8
aga.dip.index <- grep('DIPORIPHORA', rownames(aga.data));
aga.dip <- aga.data[aga.dip.index, ];
Count.aga.dip <- length(grep('DIPORIPHORA', rownames(aga.data)));
Count.aga.dip;

#9
fit1 <- lm(sha~svl, data=aga.cte);
fit2 <- lm(sha~svl, data=aga.dip);
fit1;
fit2;

#10
par(mfrow=c(2, 1));
plot(sha~svl, data=aga.cte, pch=12, cex=0.8, xlim=c(3, 5), ylim=c(2, 4), col='blue');
abline(fit1, lwd=2, col='red');
plot(sha~svl, data=aga.dip, pch=10, cex=0.8, xlim=c(3, 5), ylim=c(2, 4), col='blue');
abline(fit2, lwd=2, col='red');

#11
long.svl <- aga.data$svl>4.5;
long.svl;
table(long.svl) ['TRUE'];
long.svl.tail <- aga.data$svl>4.5 & aga.data$tail>5.25;
long.svl.tail;
table(long.svl.tail)['TRUE'];
long.svl.OR.tail <- aga.data$svl>4.5 | aga.data$tail>5.25;
long.svl.OR.tail;
table(long.svl.OR.tail)['TRUE'];

#12


















