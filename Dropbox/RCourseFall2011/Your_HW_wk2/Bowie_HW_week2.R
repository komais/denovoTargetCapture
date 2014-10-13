# Rauri Bowie Homework Week 2

#Ex1
#Generate a vector of all integers that are multiples of 10, between 10 and 500
intvec <- c(10*1:50)
intvec;
# [1]  10  20  30  40  50  60  70  80  90 100 110 120 130 140 150 160 170 #180 190 200 210 220 230 240 250 260
#[27] 270 280 290 300 310 320 330 340 350 360 370 380 390 400 410 420 430 #440 450 460 470 480 490 500


#Ex2
#make two vectors of equal length
vecA <- c(1:5);
vecA;
vecB <- c(11:15);
vecB;
length(vecA); #5
length(vecB); #5

vecA / vecB;
#prety cool, each value in vecA was divided by the corresponding element position in vec B
#0.09090909 0.16666667 0.23076923 0.28571429 0.33333333

vecA * vecB;
#same as for division, corresponding elements in each vector are multiplied together
#11 24 39 56 75


#Ex3
wordvec1 <- c('R', 'T', 'E', 'C', 'V', 'O');
wordvec1; #"R" "T" "E" "C" "V" "O"

wordvec2 <- c(1, 2, 3, 4, 5, 6); #1 2 3 4 5 6
wordvec2;
class(wordvec2); #"numeric"

names(wordvec2) <- wordvec1;
wordvec2; # "R" "T" "E" "C" "V" "O"
# 			 1   2   3   4   5   6 

wordvec3 <- c(wordvec2[5], wordvec2[3], wordvec2[4], wordvec2[2], wordvec2[6], wordvec2[1]);
wordvec3; #V E C T O R 


#Ex4
library(MASS);
data(Animals);

newbrain <- Animals$brain >= 10;
sum(newbrain); #22


#Ex5
agamidMorpho <- read.table(file = 'agamids_morphometrics.csv', sep=',', header=TRUE);
dim(agamidMorpho); #58 17
nrow(agamidMorpho); #58
ncol(agamidMorpho); #17


#Ex6
agamidMorpho;
agamid2 <- agamidMorpho[1:3, ];
agamid2;
agamid3 <- agamidMorpho[20:25, ];
agamid3;

?rbind;
agamid4 <- rbind(agamid2, agamid3);
agamid4;

agamidVector <- rownames(agamid4);
agamidVector;
#[1] "AMPHIBOLURUS_GILBERTI"     "AMPHIBOLURUS_LONGIROSTRIS" "AMPHIBOLURUS_MURICATUS"   
#[4] "CTENOPHORUS_MACULATUS"     "CTENOPHORUS_MACULOSUS"     "CTENOPHORUS_MCKENZIEI"    
#[7] "CTENOPHORUS_NUCHALIS"      "CTENOPHORUS_ORNATUS"       "CTENOPHORUS_PICTUS"       


#Ex7
rownames(agamidMorpho);
agamidMorpho ['CHLAMYDOSAURUS_KINGII', ];

myindex <- grep('KINGII', rownames(agamidMorpho));
myindex; #9
agamidMorpho[myindex, ];

myindex2 <- grep('CTENOPHORUS',rownames(agamidMorpho));
myindex2;

ctenophorus <- agamidMorpho[myindex2, ];
ctenophorus;
nrow(ctenophorus);
#22


#Ex8
myindex3 <- grep('DIPORIPHORA', rownames(agamidMorpho));
myindex3;
Diporiphora <- agamidMorpho[myindex3, ];
Diporiphora;
nrow(Diporiphora); #11
length(grep('DIPORIPHORA', rownames(agamidMorpho))); #11


#Ex9
fit1 <- lm(sha ~ svl, data=ctenophorus);
fit1;
Call:

#lm(formula = sha ~ svl, data = ctenophorus)

#Coefficients:
#(Intercept)          svl  
#    -1.1589       0.9638  

fit2 <- lm(sha ~ svl, data = Diporiphora);
fit2;
Call:

#lm(formula = sha ~ svl, data = Diporiphora)

#Coefficients:
#(Intercept)          svl  
#     -2.265        1.195 


#10
par(mfrow = c(2,1));
max(ctenophorus$sha);
min(ctenophorus$sha);
max(ctenophorus$svl);
min(ctenophorus$svl);

max(Diporiphora$sha);
min(Diporiphora$sha);
max(Diporiphora$svl);
min(Diporiphora$svl);


rx <- c(3.8, 4.8);
ry <- c(2.2, 3.6);

plot(sha ~ svl, data=ctenophorus, pch=19, cex=1.7, col='green', xlim=rx, ylim=ry);
abline(fit1, lwd=3, col='gray50');

plot(sha ~ svl, data=Diporiphora, pch=19, cex=1.7, col='red', xlim=rx, ylim=ry);
abline(fit2, lwd=3, col='gray50');


#11
svl <- agamidMorpho$svl;
length(which (svl > 4.5)); #18
length(which (svl > 4.5 & agamidMorpho$tail > 5.25)); #13
length(which(svl > 4.5 | agamidMorpho$tail > 5.25)); #20
#I guess because of TRUE=1 I could have used the sum command
sum(agamidMorpho$svl > 4.5); #18
sum(agamidMorpho$svl > 4.5 & agamidMorpho$tail > 5.25); #13
sum(agamidMorpho$svl > 4.5 | agamidMorpho$tail > 5.25); #20


#12
head(ctenophorus);
mean(ctenophorus[ ,1]); #4.286078
median(ctenophorus[ ,1]); #4.270569
sd(ctenophorus[ ,1]); #0.2505531

mean(ctenophorus[ ,2]); # 4.954415
median(ctenophorus[ ,2]); #4.972064
sd(ctenophorus[ ,2]); #0.2695651

colnames(ctenophorus[ ,1:2]); #"svl"  "tail"


#13
head(Diporiphora);
mean(Diporiphora[ ,3]); #2.181501
median(Diporiphora[ ,3]); #2.170838
sd(Diporiphora[ ,3]); #0.1338839

mean(Diporiphora[ ,6]); #2.459079
median(Diporiphora[ ,6]); #2.467646
sd(Diporiphora[ ,6]); #0.1253622

mean(Diporiphora[ ,7]); #1.657118
median(Diporiphora[ ,7]); #1.687949
sd(Diporiphora[ ,7]); #0.1007544

colhead <- c(3, 6, 7);

colnames(Diporiphora[ ,colhead]); #"hdep" "hw"   "nd"


#14
rownames(agamidMorpho[which(agamidMorpho$svl == max(agamidMorpho$svl)), ]);
#"CHLAMYDOSAURUS_KINGII"

rownames(agamidMorpho[which(agamidMorpho$svl == min(agamidMorpho$svl)), ]);
#"RANKINIA_PARVICEPS_BUTLERI"


#15
svLunlogged <- exp(agamidMorpho$svl);
svLunlogged;

agamidMorpho2 <- cbind(agamidMorpho, svLunlogged);
head(agamidMorpho2); #ya, it worked.

subset1 <- agamidMorpho2[which((max(agamidMorpho2$svLunlogged)-agamidMorpho2$svLunlogged)<120) , ];

nrow(subset1); #13


#16
biogeo <- read.table(file = 'biogeography.csv', sep=',', header=TRUE);
head(biogeo);

region1 <- biogeo$region == 0;
sum(region1); #49

region2 <- biogeo$region == 0 | biogeo$region > 1;
sum(region2); #149

region3 <- biogeo$region != 2 | biogeo$region != 3;
sum(region3);#187

# try just use sum
sum(biogeo$region != 2 | biogeo$region != 3); # WORKS!!


#17
#updating
packs <- c('ape', 'geiger', 'MASS', 'diversitree', 'nlme');
install.packages(packs);


