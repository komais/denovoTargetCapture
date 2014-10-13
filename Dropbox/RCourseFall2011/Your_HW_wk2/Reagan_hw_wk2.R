### 1st set the work directory
setwd("C:/Users/Reagan/Desktop/Rweek2");

### 2nd open the needed libraries
library(MASS);

### 3rd load the data set we will be working with
data(Animals);

# HOMEWORK
# 1-problem; generate a vector of all integers - multiples of 10, from 10 and 500.
newvec <- 10 * (1:50);
newvec;

# 2-problem; divide a vector by another vector of equal length
newvec1 <- (1:5);
newvec1
newvec2 <- (11:15);
newvec2
newvec1/newvec2
## Questions - what happens if they are different lenghts?

# 3-problem; Create a vector, in order, of the letters: R, T, E, C, V, O
# Create a second (numeric) vector of index positions and use it to create a third vector that spells a word that appears twice in this sentence.
newvec3 <- c("r", "t", "e", "c", "v", "o");
newvec4 <- c(1, 2, 3, 4, 5, 6);
newvec5 <- newvec3[newvec4];
newvec5
# oops...
newvec4 <- c(5, 3, 4, 2, 6, 1)
newvec5 <- newvec3[newvec4];
newvec5

# 4-problem; Create a logical vector corresponding to Animals brain sizes greater than or equal to 10.
sum(lbrainsize <- Animals$brain>=10)

# 5-problems; Read in the data table agamids morphometrics.csv
aga_morph <- read.table(file='agamids_morphometrics.csv', sep=',', header=TRUE);
aga_morph
plot(aga_morph)
# That's weird...
dim(aga_morph)
# 58 rows and 17 columns

# 6-problems; Make a new data frame with 3 rows of the agamid lizard dataframe. Make another dataframe with rows 20 to 25. Bind these rows together into another dataframe.
aga_morph3rows <- aga_morph[1:3,]
aga_morph3rows
# three rows turn out to be svl, tail and hdep
aga_morph6rows <- aga_morph[20:25,]
# Question; what is purpose of the "," after xx:xx","?
aga_morph6rows
aga_morph_bind <- rbind(aga_morph3rows, aga_morph6rows);
aga_morph_bind
rownames(aga_morph_bind)
# [1] "AMPHIBOLURUS_GILBERTI"     "AMPHIBOLURUS_LONGIROSTRIS" "AMPHIBOLURUS_MURICATUS"   
# [4] "CTENOPHORUS_MACULATUS"     "CTENOPHORUS_MACULOSUS"     "CTENOPHORUS_MCKENZIEI"    
# [7] "CTENOPHORUS_NUCHALIS"      "CTENOPHORUS_ORNATUS"       "CTENOPHORUS_PICTUS"

# 7-problem; reduce the data to just species of the genus Ctenophorus 
CtenophorusIndex <- grep('CTENOPHORUS', rownames(aga_morph));
CtenophorusIndex
Ctenophorus <- aga_morph [CtenophorusIndex, ]
nrow(Ctenophorus)

# 8-problem; do the same thing for Diporiphora
DiporiphoraIndex <- grep('DIPORIPHORA', rownames(aga_morph));
DiporiphoraIndex
Diporiphora <- aga_morph [DiporiphoraIndex, ]
nrow(Diporiphora)

# 9-problem; Fit a simple linear model to sha as a function of svl for Ctenophorus and Diporihora data
Ctenophoruslm <- lm(sha~svl, data = Ctenophorus);
Diporiphoralm <- lm(sha~svl, data = Diporiphora);

# 10-problem; setting up a two pannel plot and a regression line
par(mfrow=c(2,1));
## LOST AT 10:(
### Frustration has set in... Will continue working on this tomorrow morning...
plot(sha ~ svl, data = Ctenophorus, xlim = c(3.5,5), ylim = c(2,4));
abline(Ctenophoruslm);
plot(sha ~ svl, data = Diporiphora, xlim = c(3.5,5), ylim = c(2,4));
abline(Diporiphoralm);

# 11-problem
## Frustrated again. Will try again later.

