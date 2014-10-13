
# clear workspace

rm(list=ls());


library(MASS);

########## In-class Exercises

# E1

data(Animals);

# Mean & sd of log-transformed values
mean(log(Animals$body));
sd(log(Animals$body));

mean(log(Animals$brain));
sd(log(Animals$brain));

# E2
# Can't take 5th column: it doesn't exist!
Animals[ 2 , 5]; # try it!

# E3 
sum(1:123456); # Might give an error message!

# Following error message instructions:
sum(as.numeric(1:123456));

# E4
# Multiple ways of doing this, e.g.:
body <- Animals$body;
sum(body < 20);
nrow(Animals[Animals$body < 20, ]);

# body sizes < 100 > 30
sum(body > 30 & body < 100);
nrow(Animals[Animals$body > 30 & Animals$body < 100, ]);

## E5

logbody <- log(Animals$body);
names(logbody) <- rownames(Animals);
sum(logbody > 4);
mean(logbody[logbody > 4]);
# Should be 6.7

# E6
AnimalsSmall <- Animals[ Animals$body < median(Animals$body), ]; 
AnimalsBig <- Animals[Animals$body > median(Animals$body), ];

fit.small <- lm(log(brain) ~ log(body), data=AnimalsSmall);

fit.big <- lm(log(brain) ~ log(body), data=AnimalsBig);

# Slopes are quite different, though we have not
#	tested this statistically  
 
 
# 1

myvec <- 10 * 1:50;

# Note that you do NOT need to do
# c(1:50) or c(10 * 1:50)
# when you use the colon (:) operator, it
# automatically makes a vector
# c() is for explicitly joining elements that you separate by a comma.

# For example:
# c(1,2,3,4,5,6,7,8,9,10)
# is exactly equivalent to:
# 1:10
# and you can verify: (do this!)

# x1 <- c(1,2,3,4,5,6,7,8,9,10);
# x2 <- 1:10;
# x1 == x2;
# Note that this last logical comparison compared each element of x1 to the 
# corresponding x2 element

#2

# Here are just a few examples:

1:5 * 11:15;

c(1, 10, 100) * c(-1, -2, -3);

# results in pairwise element-by-element multiplication

# I just wanted you to do a few of these to verify what 
#	is going on!


#3 
myvec <- c('R', 'T', 'E', 'C', 'V', 'O');
indexvec <- c(5, 3, 4, 2,  6, 1);
myvec[ indexvec ];

# 4. 
x1 <- Animals$brain > 10
sum(x1)

# 5.
df <- read.table('agamids_morphometrics.csv', header=T, sep=',');
# some standard checks you can do:
dim(df); # dimensions
class(df); #should be a 'data frame'
nrow(df); # number of rows
ncol(df); # number of columns 
colnames(df); # column names (variables)

#6. 
agamids <- read.table('agamids_morphometrics.csv', header=T, sep=',');
df1 <- agamids[1:3, ]; #first 3 rows
df2 <- df[20:25, ]; #rows 20 to 25
df3 <- rbind(df1, df2);
df3;

# 7
agamids['CHLAMYDOSAURUS_KINGII', ];
?grep #look at help on grep function!
cteno.index <- grep('CTENOPHORUS', rownames(agamids));
cteno.df <- agamids[ cteno.index , ]; 

#8 

dipo.index <- grep('DIPORIPHORA', rownames(agamids));
dipo.df <- agamids[dipo.index, ];
nrow(dipo.df); #one way of counting

#9

fit.cteno <- lm(sha ~ svl, data=cteno.df);
fit.dipo <- lm(sha ~ svl, data=dipo.df);

summary(fit.cteno); # THis summary() function is handy!
summary(fit.dipo);


# 10 
par(mfcol=c(2,1));
plot(cteno.df$svl, cteno.df$sha, xlim=c(3.5, 5), ylim=c(2.2, 3.5));
abline(fit.cteno);
plot(dipo.df$svl, dipo.df$sha, xlim=c(3.5, 5), ylim=c(2.2, 3.5));
abline(fit.dipo);

# 11
nrow(agamids[ agamids$svl > 4.5,  ]); 
nrow(agamids[agamids$svl > 4.5 & agamids$tail > 5.25, ]);
nrow(agamids[agamids$svl > 4.5 | agamids$tail > 5.25, ]);
  
# or like this:
sum(agamids$svl > 4.5);
sum(agamids$svl > 4.5 & agamids$tail > 5.25);
sum(agamids$svl > 4.5 | agamids$tail > 5.25);
  
#12 
mean(cteno.df[,1]);
median(cteno.df[,1]);
sd(cteno.df[,1]);

mean(cteno.df[,2]);
median(cteno.df[,2]);
sd(cteno.df[,2]);

#what variables are these?
colnames(cteno.df)[1:2];

## 13
mean(dipo.df[,3]);
median(dipo.df[,3]);
sd(dipo.df[,3]);

mean(dipo.df[,6]);
median(dipo.df[,6]);
sd(dipo.df[,6]);

mean(dipo.df[,7]);
median(dipo.df[,7]);
sd(dipo.df[,7]);

colnames(dipo.df)[c(3, 6, 7)];

# YOU COULD ALSO MAKE A NEW DATAFRAME AND EXTRACT THE COLUMN NAMES:
# E.G:
newdf <- dipo.df[, c(3, 6, 7)];
colnames(newdf);



# 14 
rownames(agamids)[agamids$svl == max(agamids$svl)];
rownames(agamids)[agamids$svl == min(agamids$svl)];

#15
svl_unlogged <- exp(agamids$svl); #make new vector of unlogged values
agamids2 <- cbind(agamids, svl_unlogged); #cbind to new dataframe
head(agamids2); #look at first 5 rows
bigagamids <- agamids2[agamids2$svl_unlogged >= max(agamids2$svl_unlogged)-120, ];
nrow(bigagamids); #how many species?

#16
rm(list=ls()); # clear working directory
d <- read.table('biogeography.csv', sep=',', header=T);
sum(d$region == 0);
sum(d$region != 1);
sum(d$region != 2 & d$region != 3);

## You could also do this by counting the number
# 	of rows in a dataframe that meet a given 
#	logical condition:
#	For example:
nrow(d[d$region == 0, ]);
nrow(d[d$region != 1, ]);
nrow(d[d$region != 2 & d$region != 3, ]);








