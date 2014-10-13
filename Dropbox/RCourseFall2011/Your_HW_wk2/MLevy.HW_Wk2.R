### Week 2

#Time spent: 4 hours

#Install new version and re-install packages
packs <- c('ape', 'geiger', 'MASS', 'Matrix', 'diversitree', 'nlme')
install.packages(packs)

# set up
rm(list= ls());
setwd("/Users/MCL/Desktop/R_Course/RCourseFall2011/Week2")
getwd()

###HOMEWORK

#1. In a single line of code, generate a vector of all integers that are multiples of 10, from 10 and 500.

x <- seq(10,500, by=10)

#2. What happens if you divide a vector by another vector of equal length? Try this with some integer vectors of length 5. What if you multiply two vectors together? Note: these results will only make sense if your vectors are of equal length!

y <- rep(10,5)
x <- rep(5,5)
x/y #Dividing two vectors divides each vector entry by the other vector entry of the same index
x*y #Multiplying two vectors divides each vector entry by the other vector entry of the same index

#3. Create a vector, in order, of the letters: R, T, E, C, V, O. Create a second (numeric) vector of index positions and use it to create a third vector that spells a word that appears twice in this sentence.

vec <- c('R','T','E','C','V','O')
index <- c(5,3,4,2,6,1)
vector.spelled <- vec[ index ]
#or w/out creatng a new index vector
vector.spelled <- vec[c(5,3,4,2,6,1)]

#4. A handy trick: In logical statements, TRUE has a value of 1 and FALSE has a value of 0. You can exploit this property in concert with the sum function to quickly count the number of elements of vectors that meet some particular condition. Create a logical vector corresponding to Animals brain sizes greater than or equal to 10, and count the number of TRUE values using sum.

data(Animals)
bigbrainslogical <- Animals$brain >= 10
sum(bigbrainslogical)

#5. Read in the data table agamids morphometrics.csv. Write single lines of code that check the dimensions of the data frame.

agamids <- read.csv('agamids_morphometrics.csv', header=TRUE, sep =",",)
dim(agamids)

#6. Make a new data frame with the first 3 rows of the agamid lizard dataframe. Make yet another dataframe with rows 20 to 25. Bind these rows together into another dataframe (using rbind). Write a statement that makes a vector of the species included in the new dataframe.

agamid.1to3 <- agamids [1:3, ]
agamid.1to3

agamid.20to25 <- agamids [20:25, ]
agamid.20to25

newagamids <- rbind(agamid.1to3, agamid.20to25)
newagamids

newspeciesnames <- row.names(newagamids)
newspeciesnames

#7. make a reduced data frame that contains ONLY the species in the genus Ctenophorus using the grep (a pattern matching) function: If you give it a vector of character strings and a "target string", it will return the index values of all elements that contain the target.

agamids['CHLAMYDOSAURUS_KINGII', ]; #OR
myindex <- grep('KINGII', rownames(agamids)); #(pattern, character vecotor where matches sought)myindex;agamids[ myindex, ];

#Make a new data frame with only species from the genus Ctenophorus. How many species are in the dataset from this genus?

myindex.cten <- grep('CTENOPHORUS', rownames(agamids))
myindex.cten
cten.df <- agamids[ myindex.cten, ] #creates the new dataframe
length(myindex.cten) #There are 22 species in the dataset from this genus

#8. Make a second dataframe for the genus Diporiphora, just as you did for Ctenophorus. Write an expression that counts the number of Diporiphora species in the dataset.

myindex.dip <- grep('DIPORIPHORA', rownames(agamids))
dip.df <- agamids[ myindex.dip, ] #Creates the new dataframe
length(myindex.dip) #There are 11 species in the dataset from this genus

#9. Fit a simple linear model to sha as a function of svl for both the Ctenophorus and Diporiphora data. 

#Notes: (svl,sha) == (x,y); plot(y~x)
#I did this two ways - one using the 'new' genus-separated data frames, another pulling from the original dataframe using the genus-indices created with grep (so, 2 steps instead of one)

# Option 1: use new data frames:

#For CTEN
fitcten.svl.sha <- lm( sha ~ svl, data=cten.df)
fitcten.svl.sha
summary(fitcten.svl.sha)

plot( sha ~ svl, data=cten.df, pch=19, cex=1.7, col='black');
abline(fitcten.svl.sha, lwd=2, col='green');

#For DIP
fitdip.svl.sha <- lm( sha ~ svl, data=dip.df)fitdip.svl.sha
summary(fit.svl.sha)

plot( sha ~ svl, data=dip.df, pch=19, cex=1.7, col='black');
abline(fitdip.svl.sha, lwd=2, col='green');

#Option 2: use only index on original agamids dataframe

#For CTEN
fitcten.svl.sha <- lm( sha ~ svl, data=agamids[ myindex.cten, ])
plot( sha ~ svl, data=agamids[ myindex.cten, ], pch=19, cex=1.7, col='black');
abline(fitcten.svl.sha, lwd=2, col='green');

#For DIP
fitdip.svl.sha <- lm( sha ~ svl, data=agamids[ myindex.dip, ])
plot( sha ~ svl, data=agamids[ myindex.dip, ], pch=19, cex=1.7, col='black');
abline(fitdip.svl.sha, lwd=2, col='green');

#10. 2 panel plot; match xlim and ylim

par(mfrow = c(2,1))
plot( sha ~ svl, data=cten.df, pch=19, cex=1.7, col='black', xlim=c(3.5, 4.7), ylim=c(2, 3.5) );
abline(fitcten.svl.sha, lwd=2, col='green');

plot( sha ~ svl, data=dip.df, pch=19, cex=1.7, col='black', xlim=c(3.5, 4.7), ylim=c(2, 3.5) );
abline(fitdip.svl.sha, lwd=2, col='green');

#11. How many agamid species have an svl greater than 4.5? How many have an svl greater than 4.5 and a tail length greater than 5.25? How many have an svl greater than 4.5 OR a tail length greater than 5.25?

sum(agamids$svl > 4.5)
sum(agamids$svl > 4.5 & agamids$svl > 5.25)
sum(agamids$svl > 4.5 | agamids$svl > 5.25)

#12. Compute the mean, median, and standard deviation (functions mean, median, sd) for the first 2 columns of the Ctenophorus data frame. What variables are these (extract the names of the variables using R code!) ?

mean(cten.df$svl)
median(cten.df$svl)
sd(cten.df$svl)

mean(cten.df$tail)
median(cten.df$tail)
sd(cten.df$tail)

colnames(agamids[1:2])

#13. Compute the mean, median, and standard deviation (functions mean, median, sd) for columns 3, 6, and 7 of the Diporiphora data frame. What variables are these?

colnames(dip.df[c(3,6,7)]) # == hdep, hw, nd
c(mean(dip.df$hdep),median(dip.df$hdep), sd(dip.df$hdep)) #hdep = col 3
c(mean(dip.df$hw),median(dip.df$hw), sd(dip.df$hw)) #hw = col 6
c(mean(dip.df$nd),median(dip.df$nd), sd(dip.df$nd)) #nd = col 7

#14. Write a line of code that pulls out the ONLY the name of the species with the largest svl. Do it again for the species with the smallest svl.

agamids[agamids$svl == max(agamids$svl), ] # = CHLAMYDOSAURUS_KINGII
agamids[agamids$svl == min(agamids$svl), ] # = RANKINIA_PARVICEPS_BUTLERI

#15. Make a new vector of UNLOGGED svl's for all agamid species (to reverse a log transformation, you use the exp function). Call this new vector 'svl unlogged'. Now, make a new dataframe by "binding" this vector to the agamids dataframe. This is a column vector, and you can make a new data frame with the function cbind. In one line of code, create a new data frame of all rows where the unlogged svl is within 120 mm of the MAX value. How many species are in this?

svl_unlogged <- exp(agamids$svl)
newagamids <- cbind(agamids, svl_unlogged) #as last col
newagamids <- cbind(svl_unlogged, agamids) #as first col
head(newagamids)

max(svl_unlogged) #look at max
max(svl_unlogged) + 120 #look at range
max(svl_unlogged) - 120 #look at range
agamids.svl120max <- newagamids[svl_unlogged >= (max(svl_unlogged)-120) & svl_unlogged <= (max(svl_unlogged)+120), ]
agamids.svl120max # check
length(agamids.svl120max) # = 18

#16. Read the dataframe 'biogeography.csv'. This contains 2 columns, including species names and an integer code corresponding to the geographic regions in which they are located. Use the sum trick on a logical vector to count the number of species in region 0. Then count the number that are not found in region 1. And another line of code to count the number of species NOT found in EITHER region 2 or region 3!

biogeo <- read.csv('biogeography.csv', header=TRUE, sep =",")
dim(biogeo)
head(biogeo)

sum(biogeo$region == 0)
sum(biogeo$region != 1)
sum(biogeo$region !=2 & biogeo$region !=3)
