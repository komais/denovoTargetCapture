##########################
###Homework Week 2

#Time spent: 10 hours

# Question 1
# I couldn't get this one

# Question 2  ***
myvec1 <- c(10, 20, 30, 40, 50);
myvec2 <- c(1, 2, 3, 4, 5);
myvec1 / myvec2;
myvec1 * myvec2;
# The elements of the two vectors above interact based on their index positions

# Question 3  ***
myvec <- c('R', 'T', 'E', 'C', 'V', 'O');
myvec1 <- c(5, 3, 4, 2, 6, 1);
myvec2 <- myvec[myvec1];
myvec2;

# Question 4  ***
library(MASS);
data(Animals);
data.frame(Animals);
body <- Animals$body;
body;
brain <- Animals$brain;
brain;
bigbrainslogical <- brain >= 10;
bigbrainslogical;
bigbrains <- brain[ bigbrainslogical ];
bigbrains;
sum(bigbrainslogical);

# Question 5  ***
dir();
read.csv("agamids_morphometrics.csv");
agamids <- read.csv("agamids_morphometrics.csv");
dim(agamids);
nrow(agamids);
ncol(agamids);

# Question 6  ***
agamids <- read.csv("agamids_morphometrics.csv");
agamids;
newagamids <- agamids[ 1:3, ];
newagamids;
newagamids1 <- agamids[20:25, ];
newagamids1;
rbind(newagamids, newagamids1);
# make vector of species included in this new dataframe
newagamids2 <- rbind(newagamids, newagamids1);
newagamids2;
rownames(newagamids2);
myvecspecies <- c(rownames(newagamids2));
myvecspecies;

# Question 7  ***
agamids['CHLAMYDOSAURUS_KINGII', ];
myindex <- grep('KINGII', rownames(agamids));
myindex;
agamids[myindex, ];
# (the answer is below this line)
myindex1 <- grep('CTENOPHORUS', rownames(agamids));
myindex1;
agamids[myindex1, ];
length(myindex1);
# There are 22 species of Ctenophorus in the dataset.

# Question 8  ***
myindex2 <- grep('DIPORIPHORA', rownames(agamids));
myindex2;
length(myindex2);
# There are 11 species of Diporiphora in the dataset.

# Question 9  ***

# First, define datasets
myindex1;
agamids[myindex1, ];
Ctenophorus <- agamids[myindex1, ];
Ctenophorus;

myindex2;
agamids[myindex2, ];
Diporiphora <- agamids[myindex2, ];
Diporiphora;

# For Ctenophorus:
Cte_sha <- Ctenophorus$sha;
Cte_sha;
Cte_svl <- Ctenophorus$svl;
Cte_svl;
fit1 <- Cte_sha ~ Cte_svl;
fit1;
summary(fit1);
#forgot to include "lm" in expression
fit1 <- lm(Cte_sha ~ Cte_svl);
fit1;
summary(fit1);

# For Diporiphora
fit2 <- lm(Diporiphora$sha ~ Diporiphora$svl);
fit2;
summary(fit2);
plot(Diporiphora$sha ~ Diporiphora$svl, pch=15, cex=1.2, col='green');
abline(fit2, lw=2, col='orange');

# Question 10  ***

# For Ctenophorus:
plot (Cte_sha ~ Cte_svl, pch=19, cex=1.5, col='black');
abline(fit1, lw=2, col='blue');

par(mfrow = c(2,1));

plot(Diporiphora$sha ~ Diporiphora$svl, pch=19, cex=1.5, col='green');
abline(fit2, lw=2, col='orange');
plot (Cte_sha ~ Cte_svl, pch=19, cex=1.5, col='black');
abline(fit1, lw=2, col='blue');

# Question 11  *** 
agamids <- read.csv("agamids_morphometrics.csv");
agamids;
svl1 <- agamids$svl;
which(svl1 > 4.5);
length(which(svl1 > 4.5));
#  18 agamid species have an svl greater than 4.5
tail1 <- agamids$tail;
which(svl1 > 4.5 & tail1 >5.25);
length(which(svl1 > 4.5 & tail1 >5.25));
#  13 agamid species have an svl greater than 4.5 and a tail greater than 5.25

# Question 12  ***
colnames(agamids);
#compute mean, media, and sd for svl
mean(agamids$svl);
median(agamids$svl);
sd(agamids$svl);
#compute mean, media, and sd for tail
mean(agamids$tail);
median(agamids$tail);
sd(agamids$tail);

# Question 13  ***
agamids <- read.csv("agamids_morphometrics.csv");
colnames(agamids);

agamids <- read.csv("agamids_morphometrics.csv");
agamids;
colnames(agamids);
# column 3 is hdep, column 6 is hw, and column 7 is nd
# hdep
mean(agamids$hdep);
median(agamids$hdep);
sd(agamids$hdep);
# hw
mean(agamids$hw);
median(agamids$hw);
sd(agamids$hw);
# nd
mean(agamids$nd);
median(agamids$nd);
sd(agamids$nd);

# Question 14
max(agamids$svl);
# stopped here

# Question 15
# haven't tried this one yet

# Question 16
dir();
read.csv("biogeography.csv");
biogeography <- read.csv("biogeography.csv");
biogeography;
region <- biogeography$region;
region;
which(region == 0);
length(which(region == 0));
# answer below this line
regionlogical <- region == 0;
regionlogical;
sum(regionlogical);
# there are 49 species in region 0

# Question 17
packs <- c('ape', 'geiger', 'MASS', 'Matrix', 'diversitree', 'nlme');
install.packages(packs);
#selection: 70 for US (CA1)
70

###################

## class notes 1
# saved as ExercisesR

library(MASS);
data(Animals);
class(Animals);
dim(Animals);
nrow(Animals);
ncol(Animals);
head(Animals);
tail(Animals);

Animals[1,];
Animals[ "Mountain beaver" , ];"
Animals[ "Mountain beaver" , ];
Animals[ , 1];
Animals$brain;
Animals[ , 'brain'];
Animals[5,2];
?log
log('brain');
Animals[ , 'brain'];
log('brain');
log(brain);
log.brain <- log(Animals$brain);
log.body <- log(Animals$body);
?mean
mean(log(Animals$body));
sd(log(Animals$body));
mean(log(Animals$brain));
sd(log(Animals$brain));
mean(log.brain);
mean(log.body);

plot(x= log.body, y= log.brain);
plot(log.brain ~ log.body);
?~
~
""
plot(log.brain ~ log.bory, pch=19, cex=1.5, col='blue');
plot(log.brain ~ log.body, pch=19, cex=1.5, col='blue');
plot(log(Animals$brain) ~ log(Animals$body), pch=19, cex=1.5, col='red');
plot( log(brain) ~ log(body), data=Animals, pch=19, cex=1.7, col='gray50');

hist(log.body);
fit1 <- lm( log(brain) ~ log(body), data=Animals )
fit1

summary(fit1);

plot( log(brain) ~ log(body), data=Animals, pch=19, cex=1.7, col='gray50');
abline(fit1, lwd=2, col='blue');

myvec <- c(7, 3, 2, 9, 10);
myvec

mode(myvec);

## Class notes 2
# (review at the end of class)

?read.table

#At the beginning, any time, write script to load files, tables, etc, prior to analysis

#Then write line-byline script for analysis

#remove any previous  before starting

rm(list = ls());
library(ape);

d <- read.table('biogeography.csv' , sep=',', header=T);

d <- read.table('biogeography.csv' , sep=',', header=T); 

head(d);

v <- read.tree('anolisFinalMCC.tre');
#plot full anole tree
plot(v);

head(d);
#0 is cuba
#1 is hispaniola
#2 is jamaica
#3 is puerto rico

biog <- d$region;
biog
names(biog) <- d$species;
biog

#subset data to ONLY species in state 0,1,2,3 
#these are the foud main islands in the region

#now we  want to have a vector with a subset of only what is found btwn 0 and 3
biog2 <- biog[ biog <= 3];
biog2
length(biog2);

#tree tip labels are v$tip.labels

names(v);

dropset <- setdiff(v$tip.label, names(biog2));

tree2 <- drop.tip(v, dropset);

length(tree2);
length(biog2);

biog2 <- biog2[tree2$tip.label];

colvec <- c( 'red', 'blue', 'darkgreen', 'black' );

colvec;

biog2;

biog3 <- biog2 +1;

biog3;

statecols <- colvec[ biog3 ];

statecols;

plot(tree2, show.tip.label=F);
tiplabels(col = statecols, pch=19, cex= 0.7 );


## Class notes 3
# (review of class material)

#Set working directory: Week2

library(MASS);
data(Animals);
class(Animals);
dim(Animals);
nrow(Animals);
ncol(Animals);
head(Animals);
tail(Animals);
data.frame(Animals);
Animals[ 1, ];
Animals[ "Mountsain beaver", ];
#Note error in spelling above
Animals[ "Mountain beaver", ];
Animals[ , 1];
Animals$brain;
Animals[ , 'brain'];
?log;

#Exercise 1:
log(Animals$body);
log.body <- log(Animals$body);
log(Animals$brain);
log.brain <- log(Animals$brain);
mean(log.body);
sd(log.body);
mean(log.brain);
sd(log.brain);
Animals[ 5, 2 ];

#Exercise 2:
Animals[ 2, 5 ];
#Result is "NULL" bc. only two columns exist in this dataframe

plot(x= log.body, y=log.brain);

plot(log.body ~ log.body);
#same variables entered above; correction below:

plot(log.brain ~ log.body);

plot(log.brain ~ log.body; pch=19, cex=1.5, col='blue');

plot(log.brain ~ log.body, pch=19, cex=1.5, col='blue');

?plot;

?par;

pch=0:18;

plot(log.brain ~ log.body, pch=18, cex=1.5, col='blue');

plot(log.brain ~ log.body, pch=19, cex=1.5, col='blue');

plot(log.brain ~ log.body, pch=10, cex=1.8, col='blue');

plot(log.brain ~ log.body, pch=19, cex=1.5, col='blue');

plot( log(brain) ~ lor(body), data=Animals, pch=19, cex=1.7, col='gray50');

plot( log(brain) ~ log(body), data=Animals, pch=19, cex=1.7, col='gray50');

hist(log.body);

fit1 <- lm(log(brain) ~ log(body), data=Animals );
fit1;

summary(fit);
summary(fit1);

plot (log(brain) ~ log(body), data=Animals, pch=19, cex=1.7, col='gray50');
abline(fit1, lwd=2, col='blue');
abline(fit1, lwd=5, col='blue');
abline(fit1, lwd=1, col='green');
abline(fit1, lwd=1, col='blue');
abline(fit1, lwd=0, col='blue');

plot (log(brain) ~ log(body), data=Animals, pch=19, cex=1.7, col='gray50');
abline(fit1, lwd=1, col='green');

Animals$brain;

myvec <- c(7, 3, 2, 9, 10);
myvec;
mode(myvec);

myvec <- c('charlie', 'olga', 'this is not a pizza', '#$%#!$^!');
mode(myvec);

myvec;
length(myvec);

myvec <- c(TRUE, TRUE, FALSE, TRUE);
myvec;

mode(myvec);
length(myvec);

newvec <- 5:15;
newvec;

log(newvec);

vec1 <- 15:30;
vec2 <- log(vec1);
vec1;
vec2;

vec1 <- 15:30;
vec1;
vec1 - 5;
vec1 / 3;
vec1 * 0.25;

max(vec1);
min(vec1);
sum(vec1);

sum(1:50);

#Exercise 3
sum(log(2:123456));
log(2:4);

myvec <- c('alpha', 'beta', 'gamma', 'nu', 'lambda');
myvec;
myvec[2];
myvec[4];
myvec[1:2];
length(myvec);
myvec[3:5];

myvec[ c(2,2,2,2,2,2, 3,3,3,3,3,3) ];

myvec[ c(3,3,3, 4,4,4,  5,5,5)];

myvec[ c(1,2,4,5,5,5)];

myvec <- c( 50, 75, 25, 35 );
myvec;
names(myvec) <- c('Sceloporus', 'Varanus', 'Ctenotus', 'Draco');

myvec[ 'Draco'];
myvec[ 'Varanus' ];
myvec[ 'Anolis' ];
myvec['Sceloporus'];
myvec;
myvec[3] <- 0.2571;
myvec;
rnorm(25);
myvec <- c(1,1,1,1,1,1,1,1,1,1);
myvec;
myvec <- rep(1, 10);
myvec;
myvec <- rep(2, 10);
myvec;

?mult;

??mult;

?multiple;

myvec <- c(10:500);
myvec;

body <- Animals$body;
names(body) <- rownames(Animals);
body;
names(body);
body > 1000;
compare_vec <- body > 1000;
compare_vec;
x >50 & x < 100;
x == 'maple bacon' | x == 'cheesecake'

body == 87000;

which(body>50);

bigbodies <- which(body > 50);
bigbodies;
length(bigbodies);

body[which(body > 50)];

#Exercise 4
length(which(body < 20) & which(body < 100 & > 30));
length(which(body < 20);
(which(body < 20);
which(body < 20);
length(which(body < 20));
 which(body < 100 & body >30);
length((which(body < 20) & (which(body < 100 & body >30));
length((which(body < 20)) & (which(body < 100 & body >30));

which(body < 100 & body >30);
length(which(body < 100 & body >30));

length((length(which(body < 20))) & (length(which(body < 100 & body >30)));
       
#start over Exercise 4:

which(body < 20);
       length(which(body < 20));
       
       length(which(30 < body < 100));
       which(body < 100);
       length(which(body < 100));
       length(which(body >30));
       
       
       
       
       
       
length(body < 20);
       
       which (body<20);
       which(body<100);
       which(body<100 & body>30);
       length((which (body<20)) & (which(body<100 & body>30)));
       length(which(body<100 & body>30));
       
#Exdercise 5:

log(Animals$body);
       
which(log(Animals$body) > 4);
       length(which(log(Animals$body) > 4));
       
       
body <- Animals$body;
body;
brain <- Animals$brain;
brain;
bigbodies <- body > 100;
bigbodies;  
       
       bigbodieslogical <- body >100;
       bigbodieslogical;
       
       bigbodies1 <- body[ bigbodieslogical ];
       bigbodies1;
       
       newbrains <- brain[ bigbodieslogical];
       newbrains;
       
       x <- body == max(body);
       x;
       brain[x];
       
       x <- body < 10;
       x;
       newdf <- Animals[ x, ];
       newfd;
       newdf;
       length(newdf);
       
       
       Animals[Animals$body > 10, ];
       Animals;
    length(Animals);
       nrow(Animals);
       Animals[Animals$body > 10, ];
       Animals[Animals$brain == max(Animals$brain), ];
       Animals[Animals$brain < 10 | Animals$brain > 1000, ];
       
       which(Animals$brain < 10 | Animal$body > 1000);
       
       which(Animals$brain < 10 | Animals$body > 1000);
       which(Animals$brain > 50);
       
       AnimalsSmall <- Animals[ Animals$body < median(Animals$body), ];
       AnimalsBig <- Animals[ Animals$body > median(Animals$body), ];
       
       #Exercise 6:
       
       log(AnimalsSmall);
       log(AnimalsBig);
       
       plot(log(AnimalsSmall) ~ log(AnimalsBig));
       #Error here...In any case, get the log of brain before attempting any plots
       
##### end


