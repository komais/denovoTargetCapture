#HOMEWORK: (1h30)
setwd("C:/Users/Julian/Desktop/fichiers R/Week2")
#Question 1:
Vec1<-10*c(1:50)
Vec1

#Question 2:
Vec2<-c(1,2,3,4,5)
Vec3<-c(5,4,3,2,1)
Vec2/Vec3
Vec3/Vec2
Vec2*Vec3

#Question 3:
Vec4<-c("R","T","E","C","V","O")
Vec4
Vec5<-c(5,3,4,2,6,1)
Vec6<-Vec4[Vec5]
Vec6

#Question 4:
library(MASS);
data(Animals);
body<-Animals$body;
Vec7<-body>=10;
Vec7;
sum(Vec7);

#Question 5:
agamid_morpho_table<-read.table("agamids_morphometrics.csv", header=T, sep=",");
agamid_morpho_table;

#Question 6:
new_agamid_1<-agamid_morpho_table[1:3,];
new_agamid_1;
new_agamid_2<-agamid_morpho_table[20:25,];
new_agamid_3<-rbind(agamid_morpho_table[1:3,],agamid_morpho_table[20:25,]);
new_agamid_3;

#Question 7:
myindex<-grep("CTENOPHORUS",rownames(agamid_morpho_table));
new_agamid_4<-agamid_morpho_table[myindex,];
length(new_agamid_4);

#Question 8:
myindex2<-grep("DIPORIPHORA",rownames(agamid_morpho_table));
new_agamid_5<-agamid_morpho_table[myindex2,];
length(new_agamid_5);
#OR
length(agamid_morpho_table[grep("DIPORIPHORA",rownames(agamid_morpho_table)),]);

#Question 9:
lm_Ctenophorus<-lm(sha~svl, data=new_agamid_4);
lm_Diporiphora<-lm(sha~svl, data=new_agamid_5);
lm_Ctenophorus;
lm_Diporiphora;

#Question 10:
par(mfrow = c(2,1));
plot(sha~svl, data=new_agamid_4,xlim=c(3.8,4.8),ylim=c(2.3,3.5));
abline(lm_Ctenophorus,col="blue");
plot(sha~svl, data=new_agamid_5,xlim=c(3.8,4.8),ylim=c(2.3,3.5));
abline(lm_Diporiphora,col="red");

Question 11:
length(agamid_morpho_table[agamid_morpho_table$svl>4.5,]);
length(which(agamid_morpho_table$svl>4.5 & agamid_morpho_table$tail > 5.25));
length(which(agamid_morpho_table$svl>4.5|agamid_morpho_table$tail>5.25));

#Question 12:
mean(new_agamid_4[,1:2]);
sd(new_agamid_4[,1:2]);
median(new_agamid_4[,1:2]);
names(new_agamid_4[,1:2]);

#Question 13:
mean(new_agamid_5[,c(3,6,7)]);
sd(new_agamid_5[,c(3,6,7)]);
median(new_agamid_5[,c(3,6,7)]);
names(new_agamid_5[,c(3,6,7)]);

#Question 14:
rownames(agamid_morpho_table[agamid_morpho_table$svl==max(agamid_morpho_table$svl),]);
rownames(agamid_morpho_table[agamid_morpho_table$svl==min(agamid_morpho_table$svl),]);

#Question 15:
svl_unlogged<-exp(agamid_morpho_table[,1]);
svl_unlogged;
new_agamid_6<-cbind(agamid_morpho_table,svl_unlogged);
head(new_agamid_6);
new_agamid_7<-new_agamid_6[which(new_agamid_6$svl_unlogged > max(new_agamid_6$svl_unlogged)-120),];
new_agamid_7
length(new_agamid_7)

#Question 16:
biog<-read.table("biogeography.csv", header=T, sep=",");
biog
a<-biog$region==0
sum(a)
b<-biog$region!=1
sum(b)
c<- biog$region!=2 & biog$region!=3
sum(c)

#Question 17: 
library(nlme)
library(diversitree)

