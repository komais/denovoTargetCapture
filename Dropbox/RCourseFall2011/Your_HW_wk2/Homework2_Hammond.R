
#########################################################################################
#HOMEWORK WEEK 2
#########################################################################################

#1 In a single line of code, generate a vector of all integers that are multiples of 10, from 10 and 500.
tens <- 10*(1:50)


#2. What happens if you divide a vector by another vector of equal length?  Try with some integer vectors of length 5.  What if you multiply the two vectors?
eg1 <- c(5, 10, 15, 20, 25)
eg2 <- rep(5, 5)
eg1/eg2
eg1*eg2


#3. Create a vector, in order, of the letters: R, T, E, C, V, O.  Create a second numeric vector of index positions and use it to create a third vector that spells "vector"
letters <- c('R', 'T', 'E', 'C', 'V', 'O')
lettersNumeric <- c(5, 3, 4, 2, 6, 1)
lettersOrdered <- letters[lettersNumeric]
lettersOrdered


#4. A handy trick: In logical statements, TRUE has a value of 1 and FALSE has a value of 0.  You can exploit this property in concert with the sum function to quickly count the number of elements of vectors that meet some particular condition.  Create a logical vector corresponding to Animals brain sizes >= 10 and count the number of TRUE values using sum
brainLogical <- brain >= 10
sum(brainLogical)


#5 Read in the data table agamids_morphometrics.csv.  You will use the read.table function, and you will have to tell the function how to process the input.  Is there a header row with variable names?  What separates the data?  Here, the data are 'comma separated values,' hence the .csv extension on the filename.  often, you will want to look at the data file in a text editor (but NOT notepad) to check it out before trying to read it in R. Write single lines of code that check the dimensions of the dataframe.
myData1 <- read.csv("agamids_morphometrics.csv", header=TRUE)
dim(myData1)


#6. Make a new data frame with the first 3 rows of the agamid lizard dataframe.  Make yet another dataframe with rows 20 to 25.  Bind these rows together into another dataframe using rbind. Write a statement that makes a vector of the species included in the new dataframe.
myData3Rows <- read.csv("agamids_morphometrics.csv", header = TRUE, nrows=3)
myData20to25 <- rbind(myData1[20,], myData1[21,], myData1[22,], myData1[23,], myData1[24,], myData1[25,])
myDataCombo <- rbind(myData3Rows, myData20to25)
speciesMyDataCombo <- c(row.names(myDataCombo))


#7. grep is a pattern matching function...if you give it a vector of chracter strings and a target string, it will return the index values of all elements that contain the target. The grep function finds a pattern within a target vector and returns the index values of all the elements where the target is found.  Use the grep function to make a new data frame with only species from the genus Ctenophorus.  How many species are in the dataset from this genus 
grepCtenophorus <- grep('CTENOPHORUS' , row.names(myData1))
myDataCtenophorus <- myData1[grepCtenophorus, ]
nCtenophorus <- nrow(myDataCtenophorus)


#8.Make a second dataframe for the genus Diporiphora.  Write an expression that counts the number of Diporiphora species in the dataset.
grepDiporiphora <- grep('DIPORIPHORA', rownames(myData1))
myDataDiporiphora <- myData1[grepDiporiphora,]
nDiporiphora <- nrow(myDataDiporiphora)


#9. Relationship between lizard snout vent length (svl) and femur length (sha).  Fit a simple linear model to sha as a function of svl for both the Ctenophorus and the Diporiphora data
myDataQ9 <- rbind(myDataDiporiphora, myDataCtenophorus)
svl9 <- myDataQ9$svl
sha9 <- myDataQ9$sha
fitQ9 <- lm(sha9~svl9)
summary(fitQ9)
plot(sha9~svl9)


#10. Set up a two panel plot using par(mfrow = c(2,1)).  Plot sha as a function of svl for Ctenophorus, then add the fitted regression line.  Then, without closing your plot window, add a second plot for the Diporiphora data and also add the fitted line.  Make sure both plots have the same x and y axes using xlim and ylim parameters for the plot function.
svl9Ctenophorus <- myDataCtenophorus$svl
sha9Ctenophorus <- myDataCtenophorus$sha
svl9Diporiphora <- myDataDiporiphora$svl
sha9Diporiphora <- myDataDiporiphora$sha
fitC9 <-lm(sha9Ctenophorus~svl9Ctenophorus)
fitD9 <-lm(sha9Diporiphora~svl9Diporiphora)
par(mfrow = c(2,1))
plot(sha9Ctenophorus~svl9Ctenophorus, xlim = range(3.8, 4.8), ylim = range(2.3, 3.5))
abline(fitC9, lwd =2, col='blue')
plot(sha9Diporiphora~svl9Diporiphora, xlim = range(3.8, 4.8), ylim = range(2.3, 3.5))
abline(fitD9, lwd =2, col='blue')


#11 How many agamid species have an svl greater than 4.5?  An svl greater than 4.5 and a tail length greater than 5.25?, an svl greater than 4.5 OR a tail length greater than 5.25?
nsvl11a <- sum(myData1$svl >4.5)
nsvl11a
nsvl11b <- sum(myData1$svl > 4.5 & myData1$tail > 5.25)
nsvl11b
nsvl11c <- sum(myData1$svl > 4.5 | myData1$tail > 5.25)
nsvl11c


#12 Compute mean, median, standard deviation (functions mean, median, sd) for first 2 columns of the Ctenophora data frame.  What variables are these (extract the names of the variables using R code!)

#column1
mean(myDataCtenophorus[, 1])
median(myDataCtenophorus[, 1])
sd(myDataCtenophorus[,1 ])
#column1 alt
mean(myDataCtenophorus$svl)
median(myDataCtenophorus$svl)
sd(myDataCtenophorus$svl)
#column 2
mean(myDataCtenophorus$tail)
median(myDataCtenophorus$tail)
sd(myDataCtenophorus$tail)
#variable names columns 1 & 2
colNamesQ12 <- colnames(myDataCtenophorus[1,])
colNamesQ12[1:2]


#13 Compute the mean median and sd for columns 3, 6, and 7 of Diporiphora data frame.  What variables are these? 
#stats 3, 6 & 7
summary(myDataDiporiphora[,3])
sd(myDataDiporiphora[,3])
summary(myDataDiporiphora[,6])
sd(myDataDiporiphora[,6])
summary(myDataDiporiphora[,7])
sd(myDataDiporiphora[,7])
#variable names 3, 6 & 7
colNamesQ13 <- colnames(myDataDiporiphora[1,])
colNamesQ13[3]
colNamesQ13[6:7]

#14 Write a line of code that pulls out the ONLY the name of the species with the largest svl.  Do it again for the species with the smallest svl.
#max
Q14max <- myData1$svl == max(myData1$svl)
rownames(myData1[Q14max,])
#min
Q14min <- myData1$svl == min(myData1$svl)
rownames(myData1[Q14min,])
min(myData1$svl)


#15 Make a new vector that contains the unlogged SVLs for all agamid species and call it "svl_unlogged." Make a new dataframe by binding it to the agamids dataframe.  It's a column vector so use cbind.  Look at first 5 rows of dataframe.  In one line of code, create a new data frame of all the rows where the unlogged svl is within 120 mm of the max value.  How many species are in this?

###***QUESTION: when were they supposed to be logged?***####
svl_unlogged <- myData1$svl
myDataQ15 <- cbind(myData1 , svl_unlogged)
head(myDataQ15)
Q15 <- svl_unlogged <= max(myDataQ15) + 12 | svl_unlogged >= max(myDataQ15) - 12 
Q15
myDataQ15[Q15,]
nrowQ15 <- nrow(myDataQ15[Q15,])
nrowQ15


#16 Read the dataframe "biogeography.csv", which contains 2 columns including species names and an integer code corresponding to geographic regions.  Use sum on a logical vector to count the #species in the region 0.  Then count the number not found in 1. Add another line of code to count the number of species found neither in region 2 nor in region 3.
biogeo <- read.csv("biogeography.csv" , header = TRUE , sep = ,)
dim(biogeo)
sum(biogeo$region == 0)
sum(biogeo$region != 1)
sum(biogeo$region !=2 & biogeo$region != 3)

#17 Update R and instill the packages nlme, diversitree