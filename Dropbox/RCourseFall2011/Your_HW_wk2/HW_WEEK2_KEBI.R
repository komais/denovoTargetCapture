# get rid of preexisting workspace garbage:
rm(list=ls());

#Time used for homework ~1.5hrs

##########################
###Homework_week2_KeBi#####
##########################

#1
vector1 <- c(1:50)
vector2<- vector1*10

#2
vec_1<- c(1,2,3,4,5)
vec_2<-c(10,11,12,13,14)
vec.div<-vec_1/vec_2
vec.multiply<-vec_1*vec_2

#3
Letters<-c('R','T','E','C','V','O')
Word.vector<-Letters[c(5,3,4,2,6,1)]

#4, how to make "TRUE" return a value of 1?
library(MASS)
data(Animals)
Big.brain<-Animals$brain>=10
Count.big.brain<-length(grep('TRUE',Big.brain))
#or
logic.value<-c(Big.brain)
table(Big.brain) ['TRUE']
#or
sum(Big.brain, na.rm="TURE")

#5
library(ape)
aga.data<-read.table('/Users/KeBi/Desktop/RCourseFall2011/Week2/agamids_morphometrics.csv',sep=',', header=TRUE)
head(aga.data)
dim(aga.data)

#6
New.aga.first.3<-head(aga.data,3)
New.aga.from.20.to.25<-aga.data[20:25,]
Combined.aga<- merge(New.aga.first.3,New.aga.from.20.to.25, all=TRUE)#The output looks weird 
Combined.aga2<-rbind(New.aga.first.3,New.aga.from.20.to.25)

#7 
aga.data[1]
myindex<-grep('KINGII', rownames(aga.data))
myindex
aga.data[myindex,]

aga.index<-grep('CTENOPHORUS', rownames(aga.data))
aga.cte<-aga.data[aga.index,]
nrow(aga.cte)

#8
aga.dip.index<-grep('DIPORIPHORA',rownames(aga.data))
aga.dip<-aga.data[aga.dip.index,]
Count.aga.dip<-length(grep('DIPORIPHORA',rownames(aga.data)))

#9
fit1<-lm(sha~svl,data=aga.cte)
fit2<-lm(sha~svl,data=aga.dip)

#10
par(mfrow=c(2,1))
plot(sha~svl,data=aga.cte,pch=11,cex=0.7,xlim=c(3.8,4.7),ylim=c(2.3,3.5), col='blue')
abline(fit1, lwd=2, col='red')
plot(sha~svl,data=aga.dip,pch=19,cex=0.7, xlim=c(3.8,4.7),ylim=c(2.3,3.5), col='green')
abline(fit2, lwd=2, col='red')

#11
long.svl <-aga.data$svl>4.5
table(long.svl) ['TRUE']
longsvl.and.tail<-aga.data$svl>4.5 & aga.data$tail>5.25
table(longsvl.and.tail)['TRUE']
longsvl.OR.tail<-aga.data$svl>4.5 | aga.data$tail>5.25
table(longsvl.OR.tail)['TRUE']

#12
aga.index<-grep('CTENOPHORUS', rownames(aga.data))
aga.cte<-aga.data[aga.index,]
mean(aga.cte[,1])
median(aga.cte[,1])
sd(aga.cte[,1])
mean(aga.cte[,2])
median(aga.cte[,2])
sd(aga.cte[,2])

#extract variables-NOT SURE IF THIS IS CORRECT!!!
aga.cte[0,][1:2]


#13
aga.dip.index<-grep('DIPORIPHORA',rownames(aga.data))
aga.dip<-aga.data[aga.dip.index,]
mean(aga.dip[,3])
median(aga.dip[,3])
sd(aga.dip[,3])
mean(aga.dip[,6])
median(aga.dip[,6])
sd(aga.dip[,6])
mean(aga.dip[,7])
median(aga.dip[,7])
sd(aga.dip[,7])

#extract variables-NOT SURE IF THIS IS CORRECT!!!
aga.dip[0,][c(3,6,7)]

#14
rownames(aga.data)[grep(max(aga.data$svl),aga.data$svl)]
rownames(aga.data)[grep(min(aga.data$svl),aga.data$svl)]


#15
svl_unlogged<-exp(aga.data$svl)
head(svl_unlogged)
combined.aga.data<-cbind(aga.data,svl_unlogged)
head(combined.aga.data)
large.svl2<-combined.aga.data[which(combined.aga.data$svl_unlogged>=max(combined.aga.data$svl_unlogged)-120),]
nrow(large.svl2)

#16
biogeo<-read.table("/Users/KeBi/Desktop/RCourseFall2011/Week2/biogeography.csv",header=TRUE, sep=",")

region.0<-biogeo$region==0
sum(region.0, na.rm="TURE")

region.not.1<-biogeo$region!=1
sum(region.not.1,na.rm="TURE")

region.not2and3<-biogeo$region!=2 & biogeo$region!=3
sum(region.not2and3,na.rm='TRUE')





