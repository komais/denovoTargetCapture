
# 1. Vector of all integers that are multiples of 10

vec <- c(1:50);
vec;

vec10 <- c(vec*10);
vec10;

# 2. Multiplying / dividing vectors 

vec1 <- c(1:5);
vec1;
vec2 <- c(52:56);
vec2;

vec2/vec1;
vec1/vec2;

vec1*vec2;

# 3. spell VECTOR

letters <- c('R','T','E','C','V','O');
letters;
numbers <- c(5,3,4,2,6,1);
vector <- letters[numbers];
vector;

# 4. 

library(MASS);
data(Animals);

brain <- Animals$brain;
vector <- brain>=10;
vector;
sum(vector);

# 5. 

agamids <- read.table('agamids_morphometrics.csv', header=TRUE, sep=',');
dim(agamids);

# 6. 

first3 <- agamids[1:3, ];
first3;
morerows <- agamids[20:25, ];
morerows;
bind <- rbind(first3, morerows);
bind;
species <- rownames(bind);
species;

# 7.

grep;
cten <- grep('CTENOPHORUS', rownames(agamids));
cten;
ctenophorus <- agamids[cten, ];
ctenophorus;
nrow(ctenophorus);

# 8. 

dipo <- grep('DIPORIPHORA', rownames(agamids));
dipo;
diporiphora <- agamids[dipo, ];
nrow(diporiphora);

# 9.

sha <- agamids$sha;
svl <- agamids$svl;

CtenGraph <- lm(sha~svl, data=ctenophorus);
CtenGraph;
DipoGraph <- lm(sha~svl, data=diporiphora);

# 10.

par(mfrow=c(2,1));

plot(sha~svl, data=ctenophorus, pch=10, cex=1.7, col='red', xlim=c(3.5, 5), ylim=c(2, 4));
abline(CtenGraph, lwd=2, col='red');
plot(sha~svl, data=diporiphora, pch=10, cex=1.7, col='blue', xlim=c(3.5, 5), ylim=c(2, 4));
abline(DipoGraph, lwd=2, col='blue');

# 11. 

tail <- agamids$tail;

bigsvl <- which(svl>4.5);
bigsvl;
TailAndSvl <- which(svl>4.5 & tail>5.25);
TailAndSvl;
TailOrSvl <- which(svl > 4.5 | tail > 5.25);
TailOrSvl;

# 12. 

# will finish tomorrow morning