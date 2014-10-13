#Question 1
10 * (1:50);


#Question 2
vec1 <- 1:5;
vec1;
vec2 <- 6:10;
vec2;
vec1 / vec2;
# vec1 position [1] is divided by vec2 position [1] and so on.

vec1 * vec2;
# vec1 position [1] is multiplied by vec2 position [1] and so on.


#Question 3
vec3 <- c('R', 'T', 'E', 'C', 'V', 'O');
vec3;
vec3 [1:6]; #is this step needed?
vec3 [ c(5,3,4,2,6,1) ];


#Question 4
vec4 <- Animals$brain >= 10;
vec4;
sum(vec4 == 1);  # "1"=true


#Question 5
#Notes to self - Sorry Dan!   
#It didn't work with read.table command, but did with read.cvs.  Also, I forgot to incude "file=" in the command line.
#This didn't work:
read.table(file='agamids_morphometrics.cvs', header = TRUE, sep = ",");
#This listed everything in the table.
read.csv(file='agamids_morphometrics.csv', header=TRUE);

#Finally Alison guided me in the right direction!
am <- read.csv(file='agamids_morphometrics.csv', header=TRUE);

dim(am);
nrow(am);
ncol(am);
head(am);
tail(am);


#Question 6
am2 <- am[1:3,];
am2;
am3 <- am[20:25,];
am3;
??dataframe
?merge
?cbind
am4 <- rbind (am2, am3);
am4;
species_vector <- rownames(am4);
species_vector;


#Question 7
Ct <- grep('CTENOPHORUS', rownames(am));
Ct;
am[Ct,];
nrow(am[Ct,]);


#Question 8
Dip <- grep('DIPORIPHORA', rownames(am));
Dip;
nrow <- nrow(am[Dip,]);
nrow;

#Question 9
svl <- am$svl;
svl;
sha <- am$sha;
sha;
plot (x=sha, y=svl);
fit1 <- lm (sha~svl, data=am);
fit1;
plot (sha~svl, data=am, pch=19, cex=1.7, col='red');
abline(fit1,lwd=2,col='blue');


#Question 10
par(mfrow = c(2,1));
plot1<-am[Ct,];
plot1;
plot(sha~svl, data=plot1, pch=19, cex=1.7, col='orange');
plot2<-am[Dip,];
plot2;
plot(sha~svl, data=plot2, pch=11, cex=1, col='purple');

?xlim

par(mfrow = c(2,1));
plot1<-am[Ct,];
plot1;
rx <- c(3.8,4.8) 
ry <- c(2.2,3.7)
plot(sha~svl, data=plot1, pch=19, cex=1.7, col='orange', xlim=rx, ylim=ry);
plot2<-am[Dip,];
plot2;
plot(sha~svl, data=plot2, pch=11, cex=1, col='purple', xlim=rx, ylim=ry);


#Question 11
Q11a <- which (svl > 4.5);
Q11a;
length(Q11a);

length(which (svl > 4.5 & am$tail > 5.25));

length(which (svl > 4.5 | am$tail > 5.25));

#Question 12
#I'm too tired to do anymore!    











