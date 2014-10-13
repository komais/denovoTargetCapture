######################################
#       R course,  UC-Berkeley       #
#   Homework Week 2, Felipe Zapata   #
#		    (~ 45-50 min )           #
######################################

# Preliminaries
setwd("~/Desktop/R_Course_Rabosky_2011/Week2/");
rm(list= ls());
library(MASS);
data(Animals);

# Q1
vec1 <- 10*c(1:50);
vec1;

# Q2
# Each number in in one vector gets divided by the number in the scond vector sharing the same index; the same for multiplication

# Q3
unord <- c("R", "T", "E", "C", "V", "O");
a <- c(5,3,4,2,6,1);
ord <- unord[a];
ord;

# Q4
brain.10 <- Animals$brain >= 10;
sum(brain.10);

# Q5
data <-read.table("agamids_morphometrics.csv", sep=",", header=T);
dim(data);

# Q6
subset1 <- data[c(1:3),];
subset1;
subset2 <- data[c(20:25),];
subset2;
subset3 <- rbind(subset1, subset2);
subset3;
species <- rownames(subset3);
species;

# Q7
ctenoph.index <- grep("CTENOPHORUS", rownames(data));
ctenoph.index;
ctenoph.subset <- data[ctenoph.index,];
ctenoph.subset;
length(rownames(ctenoph.subset));

# Q8
diporiph.index <- grep("DIPORIPHORA", rownames(data));
diporiph.subset <- data[diporiph.index,];
length(rownames(diporiph.subset));

# Q9
fit.cteno <- lm(ctenoph.subset$sha ~ ctenoph.subset$svl);
fit.cteno;
summary(fit.cteno);
fit.dipor <- lm(diporiph.subset$sha ~ diporiph.subset$svl);
fit.dipor;
summary(fit.dipor);

# Q10
xmin <- min(min(ctenoph.subset$svl), min(diporiph.subset$svl));
xmax <- max(max(ctenoph.subset$svl), max(diporiph.subset$svl));
ymin <- min(min(ctenoph.subset$sha), min(diporiph.subset$sha));
ymax <- max(max(ctenoph.subset$sha), max(diporiph.subset$sha));
par(mfrow=c(2,1));
plot(ctenoph.subset$sha ~ ctenoph.subset$svl, xlim=c(xmin, xmax), ylim=c(ymin, ymax), xlab=c("Ctenophora svl"), ylab=c("Ctenophora sha"), pch=19, cex=1);
abline(fit.cteno, lwd=2);
plot(diporiph.subset$sha ~ diporiph.subset$svl, xlim=c(xmin, xmax), ylim=c(ymin, ymax), xlab=c("Diporiphora svl"), ylab=c("Diporiphora sha"), pch=19, cex=1);
abline(fit.dipor, lwd=2);

# Q11
sum(data$svl > 4.5);
sum(data$svl > 4.5 & data$tail > 5.25);
sum(data$svl > 4.5 | data$tail > 5.25);

# Q12
head(ctenoph.subset); #variables are svl and tail
mean(ctenoph.subset$svl);
median(ctenoph.subset$svl);
sd(ctenoph.subset$svl);
mean(ctenoph.subset$tail);
median(ctenoph.subset$tail);
sd(ctenoph.subset$tail);

# Q13
mean(diporiph.subset[,3]);
median(diporiph.subset[,3]);
sd(diporiph.subset[,3]);
mean(diporiph.subset[,6);
median(diporiph.subset[,6]);
sd(diporiph.subset[,6]);
mean(diporiph.subset[,7]);
median(diporiph.subset[,7]);
sd(diporiph.subset[,7]);
colnames(diporiph.subset); #variables are hdep, hw and nd

# Q14
rownames(data[ data$svl == max(data$svl),]);
rownames(data[ data$svl == min(data$svl),]);

# Q15
svl_unlogged <- exp(data$svl);
data.new <- cbind(data, svl_unlogged);
head(data.new);
data.subset.unLsvl <- data.new[data.new$svl_unlogged >= max(svl_unlogged) -120, ];
nrow(data.subset.unLsvl);

# Q16
biog <- read.table("biogeography.csv", sep=",", header=T);
head(biog);
sum(biog$region == 0); #in region 0
sum(biog$region != 1); #not in region 1
sum(biog$region != 2 & biog$region != 3); #not in region 2 and 3  

q();