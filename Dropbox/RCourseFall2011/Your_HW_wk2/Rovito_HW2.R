#Homework 1
rm(list=ls())
library(MASS)
data(Animals)

#problem 1
newvec<-10*(1:50)
newvec
# [1]  10  20  30  40  50  60  70  80  90 100 110 120 130 140 150 160 170 180 190
#[20] 200 210 220 230 240 250 260 270 280 290 300 310 320 330 340 350 360 370 380
#[39] 390 400 410 420 430 440 450 460 470 480 490 500

#problem 2
vec1<-(1:5)
vec2<-(6:10)
vec1/vec2
#[1] 0.1666667 0.2857143 0.3750000 0.4444444 0.5000000
vec1*vec2
#[1]  6 14 24 36 50

# problem 3

vec1<-c('R', 'T', 'E', 'C', 'V', 'O')
vec2<-c(5,3,4,2,6,1)
vec3<-vec1[vec2]
vec3
#[1] "V" "E" "C" "T" "O" "R"

#problem 4

sum(AnimalsBigBrainLogical<-Animals$brain>=10)
#[1] 22

#problem 5

agama<-read.table(file='agamids_morphometrics.csv', sep=',', header=TRUE )
dim(agama)
#[1] 58 17
nrow(agama)
#[1] 58
ncol(agama)
#[1] 17

#problem 6
agama3<-agama[1:3,]
agama2025<-agama[20:25,]
agamabind<-rbind(agama3, agama2025)
rownames(agamabind)
#[1] "AMPHIBOLURUS_GILBERTI"     "AMPHIBOLURUS_LONGIROSTRIS"
#[3] "AMPHIBOLURUS_MURICATUS"    "CTENOPHORUS_MACULATUS"    
#[5] "CTENOPHORUS_MACULOSUS"     "CTENOPHORUS_MCKENZIEI"    
#[7] "CTENOPHORUS_NUCHALIS"      "CTENOPHORUS_ORNATUS"      
#[9] "CTENOPHORUS_PICTUS" 

#problem 7
CtenoIndex<-grep('CTENOPHORUS', rownames(agama))
Ctenophorus<-agama[CtenoIndex,]
nrow(Ctenophorus)
#[1] 22

#problem 8
DiporiphoraIndex<-grep('DIPORIPHORA', rownames(agama))
Diporiphora<-agama[DiporiphoraIndex,]
nrow(Diporiphora)
#[1] 11

#problem 9
ctenolm<-lm(sha~svl, data=Ctenophorus)
diporilm<-lm(sha~svl, data=Diporiphora)

#problem 10
par(mfrow=c(2,1))
rx<-c(min(c(min(Ctenophorus$svl)), min(Diporiphora$svl)), max(c(max(Ctenophorus$svl)), max(Diporiphora$svl)))
ry<-c(min(c(min(Ctenophorus$sha)), min(Diporiphora$sha)), max(c(max(Ctenophorus$sha)), max(Diporiphora$sha)))
plot(Ctenophorus$svl, Ctenophorus$sha, xlim=rx, ylim=ry)
abline(ctenolm)
plot(Diporiphora$svl, Diporiphora$sha,  xlim=rx, ylim=ry)
abline(diporilm)

#problem 11
sum(agama$svl>4.5)	
#[1] 18
sum(agama$svl>4.5 & agama$tail>5.25)
#[1] 13
sum(agama$svl>4.5 | agama$tail>5.25)
#[1] 20

#problem 12
mean(Ctenophorus[,1])
#[1] 4.286078
median(Ctenophorus[,1])
#[1] 4.270569
sd(Ctenophorus[,1])
#[1] 0.2505531
mean(Ctenophorus[,2])
#[1] 4.954415
median(Ctenophorus[,2])
#[1] 4.972064
sd(Ctenophorus[,2])
#[1] 0.2695651
colnames(Ctenophorus[,1:2])
#[1] "svl"  "tail"

#problem 13
mean(Diporiphora[,3])	
#[1] 2.181501
median(Diporiphora[,3])	
#[1] 2.170838
sd(Diporiphora[,3])
#[1] 0.1338839	 
mean(Diporiphora[,6])	
#[1] 2.459079
median(Diporiphora[,6])	
#[1] 2.467646
sd(Diporiphora[,6])	
#[1] 0.1253622
mean(Diporiphora[,7])
#[1] 1.657118	
median(Diporiphora[,7])	
#[1] 1.687949
sd(Diporiphora[,7])
#[1] 0.1007544
colindex<-c(3,6,7)	
colnames(Diporiphora[,colindex])

#problem 14
rownames(agama[which(agama$svl==max(agama$svl)),])
#[1] "CHLAMYDOSAURUS_KINGII"
rownames(agama[which(agama$svl==min(agama$svl)),])
#[1] "RANKINIA_PARVICEPS_BUTLERI"

#problem 15
svl_unlogged<-exp(agama$svl)
agamanew<-cbind(agama, svl_unlogged)
agamanew[1:5,]
bigagama<-agamanew[which((max(agamanew$svl_unlogged)-agamanew$svl_unlogged)<120),]
nrow(bigagama)
#[1] 13

#problem 16
biogeo<-read.table(file='biogeography.csv', sep=',', header=TRUE)
sum(biogeo$region==1)
#[1] 38
sum(biogeo$region!=1)
#[1] 149
sum(biogeo$region!=2 & biogeo$region!=3)
#[1] 171

