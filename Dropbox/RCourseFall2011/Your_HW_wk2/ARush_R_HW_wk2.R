# Andrew Rush week 2 #
### 6. Homework ###

# 1. # CHECK AND RE-DO
mult10 <- (1:50)*10;

# 2. #
vecNo2a <- (1:5);
vecNo2b <- (6:10);
vecNo2a/vecNo2b;
vecNo2a*vecNo2b;

# 3. #
LetterVec <- c('R', 'T', 'E', 'C', 'V', 'O');
LetterVec [c(5, 3, 4, 2, 6, 1)];

# 4 # 
sum(Animals$brain >= 10);

# 5 #
agamids <- read.table(file = 'agamids_morphometrics.csv', sep = ',', header = TRUE);
head(agamids); 
names(agamids); 
rownames (agamids); 
dim(agamids);

# 6 #
# make a reduced data.frame
agamids2 <- agamids[1:3,];
rownames(agamids2);

agamids3 <- agamids[20:25,]; 
agamids3;
rownames (agamids3);

newagamatrix <- rbind (agamids2, agamids3);

# 7 #
# Using the 'grep' fxn
rownames(agamids);
agamids ['CHLAMYDOSAURUS_KINGII',];
myindex <- grep('KINGII', rownames(agamids));
agamids [myindex, ];

Ctenindex <- grep('CTENOPHORUS', rownames(agamids));

# make a CTENOPHORUS only data.frame
Ctenoframe <- agamids[11:32,];
Ctenoframe;
dim (Ctenoframe);
## Ctenoframe = 22 CTENOPHORUS spp ##

# make a DIPORIPHORA only data.frame
Diporindex <- grep('DIPORIPHORA', rownames(agamids));
Diporiframe <- agamids[33:43,];
dim (Diporiframe);
## Diporiframe = 11 DIPORIPHORA spp ##

# 9. Morphometrics  #
Ctenoplot <- lm(svl ~ sha, data=Ctenoframe);
plot(svl ~ sha, data=Ctenoframe, pch=19, cex=1.7, col='gray50');
# to add trendline
abline(Ctenoplot, lwd=2, col='blue');

Diporiplot <- lm(svl ~ sha, data=Diporiframe);
plot(svl ~ sha, data=Diporiframe, pch=19, cex=1.7, col='gray50');
abline(Diporiplot, lwd=2, col='blue');

# 10 #
# Set up a 2-panel plot using 'par' fxn
par(mfrow = c(2,1));
plot(svl ~ sha, data=Ctenoframe, pch=19, cex=1.7, col='gray50', xlim = c(2,4), ylim = c(3, 5));
abline(Ctenoplot, lwd=2, col='blue');
plot(svl ~ sha, data=Diporiframe, pch=19, cex=1.7, col='gray50', xlim = c(2,4), ylim = c(3, 5));
abline(Diporiplot, lwd=2, col='blue');

# 11 #
# Make vector of the column of data that you are interested in 
svl <- (agamids$svl);
# Find the elements in the new vector that meet your criterion of interest
svlBig <- which(svl > 4.5);
# Count the number of elements in the new vector that match your criterion
length (svlBig);
# 18 spp have svl > 4.5 #

tail <- (agamids$tail);
tailBig <- which(tail > 5.25);
svltailBig <- which (svl > 4.5 & tail > 5.25);
length(svltailBig);
# 13 spp have svl > 4.5 & tail > 5.25

svltailBigOr <- which (svl > 4.5 | tail > 5.25);
length(svltailBigOr);
# 20 spp have svl > 4.5 OR tail > 5.25

# 12 #
#Compute mean, median, and sd for 1st 2 cols of Ctenophorus data frame
names(Ctenoframe);
# First 2 columns are svl and tail

mean(Ctenoframe$svl);
median(Ctenoframe$svl);
sd(Ctenoframe$svl);

mean(Ctenoframe$tail);
median(Ctenoframe$tail);
sd(Ctenoframe$tail);

# 13 #
#Compute mean, median, and sd for cols 3, 6, 7 of Diporiphora data frame
names(Diporiframe);
# columns are hdep, hw, and nd

mean(Diporiframe$hw);
median(Diporiframe$hw);
sd(Diporiframe$hw);

mean(Diporiframe$hdep);
median(Diporiframe$hdep);
sd(Diporiframe$hdep);

mean(Diporiframe$nd);
median(Diporiframe$nd);
sd(Diporiframe$nd);

# 14 # Name of the sp with the lrgst svl
agamids[agamids$svl == max(agamids$svl), ] # = CHLAMYDOSAURUS_KINGII
agamids[agamids$svl == min(agamids$svl), ] # = RANKINIA_PARVICEPS_BUTLERI

# 15 #
# Reverse log transform of svl for agamids
svl_unlogged <- exp(svl)
# Make a new dataframe by binding this new (column) vector to agamids dataframe
df15 <- cbind (agamids, svl_unlogged);
head(df15);
# In 1 line of code, create a new df of all rows where the unlogged svl is w.in 120 mm of the MAX value. 
#This line finds the element that is the max svl_unlogged (TRUE/FALSE assignmts)
TopUnlogSvl <- svl_unlogged == max(svl_unlogged);
# This does the same thing, but finds the value (= 220.1136)
svl_unlogged[which(svl_unlogged == max(svl_unlogged))];

agamids.TopUnlogSvl <- df15[svl_unlogged >= (max(svl_unlogged)-120) & svl_unlogged <= (max(svl_unlogged)+120), ]
# How many spp are in this list? # 13 #

# 16 #
# Read the dataframe 'biogeography.csv'
biogeo <- read.table(file = 'biogeography.csv', sep = ',', header = TRUE);
#Use the 'sum' trick on a logical vector to count the number of spp in region 0. 
sum(biogeo$region == 0); # No. spp in region 0 = 49
sum(biogeo$region != 1); # No. spp NOT in region 1 = 149
sum(biogeo$region != 2 | biogeo$region != 3); # No. spp NOT in either region 2 or region 3 = 187






