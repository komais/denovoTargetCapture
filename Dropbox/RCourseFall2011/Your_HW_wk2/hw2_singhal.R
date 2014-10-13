library(MASS)
data(Animals)
#1. a vector of multiples 
a <- seq(10,500,10)
#2. divide one vector by another of equal length, then each number in vector1 gets divided by the number of same index in vector2; same for multiplication
#3. vector of letters
v <- c("R","T","E","C","V","O")
a <- c(5,3,4,2,6,1)
b <- v[a]
#4. a handy trick
sum(Animals$brain >= 10)
#5 agamids
ag <- read.table("/Users/singhal/seminars/Rcourse/Rweek2/agamids_morphometrics.csv",sep=",",header=T)
dim(ag)
#6 data frame manip
first3 <- ag[1:3,]
rows20 <- ag[20:25,]
d <- rbind(first3,rows20)
species <- row.names(d)
#7 grep
ct <- ag[grep('CTENOPHORUS',row.names(ag)),]
length(row.names(ct))
#8 grep 
di <- ag[grep('DIPORIPHORA',row.names(ag)),]
length(row.names(di))
#9 slm
ct.lm <- lm(sha ~ svl, data=ct)
ct.di <- lm(sha ~ svl, data=di)
#10 plot
par(mfrow=c(2,1))
ymin <- min(min(ct$sha),min(di$sha))
ymax <- max(max(ct$sha),max(di$sha))
xmin <- min(min(ct$svl),min(di$svl))
xmax <- max(max(ct$svl),max(di$svl))
plot(ct$svl,ct$sha,xlim=c(xmin,pxmax),ylim=c(ymin,ymax))
abline(ct.lm)
plot(di$svl,di$sha,xlim=c(xmin,pxmax),ylim=c(ymin,ymax))
abline(ct.di)
#11 counts
dim(ag[ag$svl > 4.5,])[1]
dim(ag[ag$svl > 4.5 & tail > 5.25,])[1]
dim(ag[ag$svl > 4.5 | tail > 5.25,])[1]
#12 means, modes, etc
mean(ct[,1])
sd(ct[,1])
median(ct[,1])
names(ct)[1]
#13 more
mean(di[,3])
sd(di[,3])
median(di[,3])
names(di)[3]
#14 species with largest svl
row.names(ag[ag$svl == max(ag$svl),])
row.names(ag[ag$svl == min(ag$svl),])
#15 unlogged
svl_unlogged <- exp(ag$svl)
ag2 <- cbind(ag,svl_unlogged)
ag3 <- ag2[ag2$svl_unlogged > max(svl_unlogged) - 120, ]
dim(ag3)[1]
#16 biogeography
b <- read.table("/Users/singhal/seminars/Rcourse/Rweek2/biogeography.csv",sep=",",header=T)
sum(b$region==0)
sum(b$region!=1)
sum(b$region!=2 & b$region!=3)