# TODO: Homework week 2
# 
# Author: Maria J Santos
###############################################################################

#HOMEWORK
#1. In a single line of code generate a vector of all integers that are multiples of 10, from 10 and 500
HW1 <- c((1:50)*10);
HW1

#2. What happens if you divide a vector by another vector of equal length? Try this with some integer vectors of length 5. What if you multiply two vectors together? 
hwvec1 <- c(1:5);
hwvec2 <- c(15:19);
hwvec1/hwvec2;# it multiplies each indexed row by the indexed row in the second vector 
hwvec1*hwvec2;
#when not of the same length can multiply or divide vector elements

#3. Create a vector, in order, of the letters: R, T, E, C, V, O. Create a second vector (numeric) of index positions and use it to create a third vector that spells a word that appears twice in this sentence 
#word is vector
hwvec3 <- c('R', 'T', 'E', 'C', 'V', 'O');
hwvec4 <- c(5, 3, 4, 2, 6, 1)
hwvec3[hwvec4]

#4. In logical statements, TRUE has a value of 1 and FALSE has a value of 0. You can exploit this property in concert with the sum function to quickly count the number of elements of vectors that meet some particular condition. Create a logical vector corresponding to animal brain size greater than or equal to 10, and count the number of TRUE values using sum
hwvec5 <- brain>=10
sum(hwvec5); #answer = 22

#5. Read in the data table agamids_morphometrics.csv. You will use read.table function and you will have to tell the function how to process the input. Is there a header row with variable names? What separates the data? Here, the data are 'comma separated values', hence the .csv extension on the file name. Write single lines of code that check the dimension of the data frame
hwvec6 <- read.table(file = "C:/R_course_MVZ/week2/agamids_morphometrics.csv", header = TRUE, sep = ",");
dim(hwvec6);
nrow(hwvec6);
ncol(hwvec6);

#6. Make a new dataframe with the first 3 rows of the agamid lizard dataframe. Make yet another dataframe with rows 20 to 25. BInd these rows together into another dataframe. You can bind rows of dataframes together using the rbind function, but make sure both of your subsetted dataframes are correct before doing this. Write a statement that makes a vector of the species included in the new dataframe
hwvec7 <- hwvec6[1:3, ]; # subset number one
hwvec7;
hwvec8 <- hwvec6[20:25,]; # subset number two
hwvec8;
hwvec9 <- rbind(hwvec7,hwvec8); # binded vector with the two subsets
hwvec9;
hwvec10 <- rownames(hwvec9); # vector with the name of the species
hwvec10;

#7. Look at the row names for the 58 agamid species in the data frame. These are the species names. We are going to make a reduced data frame that contains ONLY the species in the genus Ctenophorus. We well do this using th efunction grep. GIve it a vector of character strings and a target string, it will return the index values of all elements that contains the target
hwvec6
hwvec11 <- grep('CTENOPHORUS', rownames(hwvec6))
hwvec11
hwvec6[hwvec11, ];
hwvec12 <- (hwvec11/hwvec11)
sum(hwvec12) # answer 22 species of the genera Ctenophorus

#8. Make a second dataframe for the genus Diporiphora. Write an expression that counts the number of Diporiphora species in the data set
hwvec13 <- grep('DIPORIPHORA', rownames(hwvec6))
sum(hwvec13/hwvec13); # answer is 11 species

#9. Morphometrics. We will do a "non-phylogenetic" analysis of the relationship between lizard snout vent length (svl) and femur length (sha). Fit a simple linear model to sha as a function of svl for both the Ctenophorus and the Diporiphora data
hwvec14 <- hwvec6[hwvec11, ];
hwvec14
hwvec15 <- hwvec6[hwvec13, ];
hwvec15

hwvec16 <- lm(hwvec14$sha~hwvec14$svl);
summary(hwvec16);
hwvec17 <- lm(hwvec15$sha~hwvec15$svl);
summary(hwvec17);

#10. You can set up a 2 panel plot using the graphical parameter par(mfrow = c(2,1). Do this. Plot sha as a function of svl for Ctenophorus, then add the dotted regression line. Then, without closing your plot window, add a second plot for the Diporiphora data and also add the dotted line. When you have figured out how to do this, make sure that both plots have exactly the same x and y axes, so they can be compared visually. You can do this with the xlim and ylim graphical parameters, which are arguments that go to the plot function.

par(mfrow = c(2,1));
plot(hwvec14$sha~hwvec14$svl, xlim = c(3.8,4.7), ylim = c(2.2,3.6), xlab = "Ctenophorus svl", ylab = "Ctenophorus sha");
abline(hwvec16,lwd=2, col='gray');
plot(hwvec15$sha~hwvec15$svl, xlim = c(3.8,4.7), ylim = c(2.2,3.6), xlab = "Diporiphora svl", ylab = "Diporiphora sha");
abline(hwvec17,lwd=2, col='gray');

#11. How many agamid species have an svl greater than 4.5? How many have an svl greater than 4.5 and a tail length greater than 5.25? How many have an svl greater than 4.5 OR a tail length greater than 5.25?

hwvec18 <- which(hwvec6$svl>4.5)
sum(hwvec18/hwvec18) # answer 18

hwvec19 <- which(hwvec6$svl>4.5&hwvec6$tail>5.25)
hwvec19
sum(hwvec19/hwvec19); #answer 13

hwvec20 <- which(hwvec6$svl>4.5|hwvec6$tail>5.25)
sum(hwvec20/hwvec20); #answer 20

#12. Compute the mean, median, and standard deviation (functions mean, median, sd) for the first 2 columns of the Ctenophorus data frame. What variables are these (extract the names of the variables using R code!) ?
head(hwvec14)
colnames(hwvec14)
mean(hwvec14$svl); #answer = 4.286078
median(hwvec14$svl); #answer = 4.270569
sd(hwvec14$svl); #answer = 0.2505531

mean(hwvec14$tail); #answer = 4.954415
median(hwvec14$tail); #answer = 4.972064
sd(hwvec14$tail); #answer = 0.2695651

#13. Compute the mean, median, and standard deviation (functions mean, median, sd) for columns 3, 6, and 7 of the Diporiphora data frame. What variables are these?
colnames(hwvec15) #3="hdep", 6="hw", 7="nd"

mean(hwvec15$hdep); #answer = 2.181501
median(hwvec15$hdep); #answer = 2.170838
sd(hwvec15$hdep); #answer = 0.1338839

mean(hwvec15$hw); #answer = 2.459079
median(hwvec15$hw); #answer = 2.467646
sd(hwvec15$hw); #answer = 0.1253622

mean(hwvec15$nd); #answer = 1.657118
median(hwvec15$nd); #answer = 1.687949
sd(hwvec15$nd); #answer = 0.1007544

#14. Write a line of code that pulls out the ONLY the name of the species with the largest svl. Do it again for the species with the smallest svl.
rownames(hwvec21 <-hwvec6[hwvec6$svl == max(hwvec6$svl), ]) #answer = "CHLAMYDOSAURUS_KINGII"
rownames(hwvec22 <-hwvec6[hwvec6$svl == min(hwvec6$svl), ]) #answer = "RANKINIA_PARVICEPS_BUTLERI"

#15. First, use what you know about vector operations to make a new vector that contains the UNLOGGED svl's for all agamid species (to reverse a log transformation, you use the exp function). Call this new vector 'svl unlogged'. Now, make a new dataframe by "binding" this vector to the agamids dataframe. This is a column vector, and you can make a new data frame with the function cbind. Look at the first 5 rows of your new data frame. How does it look? Did it work? Finally, in one line of code, create a new data frame of all rows where the unlogged svl is within 120 mm of the MAX value. How many species are in this?
svl_unlogged <- exp(hwvec6$svl)
svl_unlogged
hwvec23 <- cbind(hwvec6, svl_unlogged)
hwvec23[1:5, ]

hwvec24 <- hwvec23[hwvec23$svl_unlogged>max(hwvec23$svl_unlogged)-120,]
rownames(hwvec24)#answer:13

#16. Read the dataframe 'biogeography.csv'. This contains 2 columns, including species names and an integer code corresponding to the geographic regions in which they are located. Use the sum trick on a logical vector to count the number of species in region 0. Then count the number that are not found in region 1. And another line of code to count the number of species NOT found in EITHER region 2 or region 3! 
hwvec25 <- read.table("C:/R_course_MVZ/week2/biogeography.csv", header = TRUE, sep = ",")
dim(hwvec25)
colnames(hwvec25)

sum(hwvec26 <- hwvec25$region==0) #answer = 49
sum(hwvec27 <- hwvec25$region!=1) #answer=149
sum(hwvec28 <- hwvec25$region!=2&hwvec25$region!=3) # answer = 171


#17. On your own: make sure you have updated to R 2.14. Install the packages nlme, diversitree,
install.packages("nlme");
install.packages("diversitree")

