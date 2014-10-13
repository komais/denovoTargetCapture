# 1
newvec <- 10:500;
newvec / 10;

# 2
rvec1 <- c(2, 7, 9, .17, 13, 99);
rvec2 <- c(6, 2, 12, 5, 13.5, 1001);
rvec1 / rvec2;
rvec1 * rvec2;

# 3
vecran <- c('R', 'T', 'E', 'C', 'V', 'O');
names (vecran) <- c(1, 2, 3, 4, 5, 6);

vecran [c(5 ,3, 4, 2, 6, 1)];

# 4
library(MASS);
data(Animals);

brain <- Animals$brain;
brain;
names(brain) <- rownames(Animals);
brain <- Animals$brain <= 10;
brain;

sum(Animals$brain <= 10);

# 5
# checking directory dir();
agamids <- read.table('agamids_morphometrics.csv',sep = ',', header = T);
# agamids;
dim(agamids);

# 6 data frame with first 3 rows; rows 20- 25; combine
agamids1 <- agamids[1:3, ];
agamids2 <- agamids[20:25, ];
# rbind = combining data frames
agamids3 <- rbind (agamids1, agamids2);
agamids3;

species <- c(rownames(agamids3));
species;

# 7
#?grep;
cteno <- grep('CTENOPHORUS', rownames(agamids));
cteno;
agamids[cteno, ];
nrow(cteno);

# 8
dipor <- grep('DIPORIPHORA', rownames(agamids));
dipor;
agamids[dipor, ];
nrow(dipor);

# 9 regression for Diporiphora and Ctenophorus
ctenosvl <- agamids[11:32, 1];
ctenosha <- agamids[11:32, 12];

diporsvl <- agamids[33:43, 1];
diporsha <- agamids[33:43, 13];

plot(ctenosha ~ ctenosvl, pch = 19, cex = 1.5, col = 'blue') ;
fit1 <- lm(ctenosha ~ ctenosvl);
abline(fit1, lwd=2, col='red');
plot(diporsha ~ diporsvl, pch = 19, cex = 1.5, col = 'green');
fit2 <- lm(diporsha ~ diporsvl);
abline(fit2, lwd=2, col='blue');
# ?abline

# 10
par(mfrow = c(2, 1));

plot(ctenosha ~ ctenosvl, pch = 19, cex = 1.5, col = 'blue', xlim = range(3.6, 4.8), ylim = range(2.4, 3.5));
fit1 <- lm(ctenosha ~ ctenosvl);
abline(fit1, lwd=2, col='red');
plot(diporsha ~ diporsvl, pch = 19, cex = 1.5, col = 'green', xlim = range(3.6, 4.8), ylim = range(2.4, 3.5));
fit2 <- lm(diporsha ~ diporsvl);
abline(fit2, lwd=2, col='blue');

# ?xlim

# 11 
svl <- agamids$svl;
medag <- svl > 4.5;
length(medag <- TRUE);

medag2 <- svl > 4.5 & svl > 5.25;
medag2;
length(medag2);

bigag <- svl > 4.5 | svl > 5.25;
bigag;
length(bigag <- TRUE);


# 12
ctenotail <- agamids[11:32, 2];
mean(ctenosvl);
mean(ctenotail);
median(ctenosvl);
median(ctenotail);
sd(ctenosvl);
sd(ctenotail);
ctenonames <- (cteno[1:2, ]);

# 13
agamids["Diporiphora", ];
diporhdep <- agamids[33:43, 3];
diporhw <- agamids[33:43, 6];
diporhd <- agamids[33:43, 7];

mean(diporhdep);
median(diporhdep);
sd(diporhdep);

mean(diporhw);
median(diporhw);
sd(diporhw);

mean(diporhd);
median(diporhd);
sd(diporhd);

# 14 max and min agamid SVL
agamidsvl <- agamids$svl;
names(agamidsvl) <- max(agamidsvl);
min(agamidsvl);

# 15
agamidsvl;
svLunlogged <- agamidsvl;
cbind(svLunlogged);      # ?cbind;
head(svLunlogged);

newsvl <- (max(svLunlogged) - 12);

# 16
biogeo <- read.table('biogeography.csv', sep = ',', header = T);
nrow(biogeo);

region <- biogeo[ , 2];
sum(region == 0);
sum(region != 1);
sum(region != 2 & region !=3);





