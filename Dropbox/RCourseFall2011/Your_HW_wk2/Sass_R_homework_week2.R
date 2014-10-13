###1. In a single line of code, generate a vector of all integers that are multiples of 10, from 10 and 500. There are/Users/chodon/Documents/computer_courses/RWeek2/editor_window_week2.R several ways to do this, only one of which you’ve learned yet!

vec <- (1:50*10);

###2. What happens if you divide a vector by another vector of equal length? Try this with some integer vectors of length 5. What if you multiply two vectors together? Note: these results will only make sense if your vectors are of equal length!

vec2a <- 1:5;
vec2b <- 6:10;
vec2a / vec2b;
vec2a * vec2b;

# R performes the operation on each pair of integers in each vector in turn

###3.  Create a vector, in order, of the letters: R, T, E, C, V, O. Create a second (numeric) vector of index positions and use it to create a third vector that spells a word that appears twice in this sentence.

vec3a <- c('R', 'T', 'E', 'C', 'V', 'O' );
vec3in <- c(5, 3, 4, 2, 6, 1);
vecword <- vec3a [ vec3in ];
vecword;

###4 A handy trick: In logical statements, TRUE has a value of 1 and FALSE has a value of 0. You can exploit this property in concert with the sum function to quickly count the number of elements of vectors that meet some particular condition. Create a logical vector corresponding to Animals brain sizes greater than or equal to 10, and count the number of TRUE values using sum.

vec <- c(Animals$body >=10);
sum(vec);

####5 Read in the data table agamids morphometrics.csv. You will use the read.table function, and you will have to tell the function how to process the input. Is there a header row with variable names? What separates the data? Here, the data are ’comma separated values’, hence the .csv extension on the filename. Often, you will want to look at the data file in a text editor (textwrangler, notepad++, etc, but NEVER notepad) to check it out before trying to read it in R . Write single lines of code that check the dimensions of the data frame.

?read.table;

dim(read.table('agamids_morphometrics.csv', header=TRUE, sep=','));

####6 Make a new data frame with the first 3 rows of the agamid lizard dataframe. Make yet another dataframe with rows 20 to 25. Bind these rows together into another dataframe. You can bind rows of dataframes together using the rbind function, but make sure both of your subsetted dataframes are correct (check them by looking at them!) before doing this!. Write a statement that makes a vector of the species included in the new dataframe.

lizard <- read.table('agamids_morphometrics.csv', header=TRUE, sep=',');
dim(lizard);

first <- 1:3;
second <- 20:25;

liz1 <- lizard [first, ];
liz1;

liz2 <- lizard [20:25, ];
liz2;

?rbind

lizsub <- rbind(liz1, liz2);
lizsub;

lsnames <- rownames(lizsub);
lsnames;

###7 Another trick: Look at the row names for the 58 agamid species in the data frame. These are the species names. We are going to make a reduced data frame that contains ONLY the species in the genus Ctenophorus . We will do this using the function grep. This function will be explored in much more detail later, but for now, all you need to know is that it is a ’pattern matching’ function. If you give it a vector of character strings and a ”target string”, it will return the index values of all elements that contain the target. For example, suppose you want the row with data from the frilled dragon, Chlamydosaurus kingii. You could just do:
## > agamids['CHLAMYDOSAURUS_KINGII', ]; But this only works if you remember how to spell the species name exactly as it is.
##What if all you remember is ’kingii’? Then you can exploit the grep function as follows:
##> myindex <- grep('KINGII', rownames(agamids)); > myindex; > agamids[ myindex, ];
##See how this works? the grep function (look at help) finds a pattern within a par- ticular target vector (in this case, the row name vector from the agamid data), and returns the index values of all the elements where the target is found.
##Use the grep function to make a new data frame with only species from the genus Ctenophorus. How many species are in the dataset from this genus?

cteno_grep <- grep('CTENOPHORUS', rownames(lizard));
cteno <- lizard [cteno_grep, ];
cteno;
dim(cteno);
nrow(cteno);

###8 Make a second dataframe for the genus Diporiphora, just as you did for Ctenophorus. Write an expression that counts the number of Diporiphora species in the dataset.

dip_grep <- grep('DIPORIPHORA', rownames(lizard));
dip <- lizard [dip_grep, ];
dip;
nrow(dip);

###9 Morphometrics. We will do a ”non-phylogenetic” analysis of the relationship between lizard snout vent length (svl) and femur length (variable named ’sha’, for shank). Fit a simple linear model to sha as a function of svl for both the Ctenophorus and Diporiphora data.

plot(sha ~ svl, data=cteno);
fit_cteno <- lm(sha ~ svl, data=cteno);
abline(fit_cteno, lwd=2, col='blue');

plot(sha ~ svl, data=dip);
fit_dip <- lm(sha ~ svl, data=dip);
abline(fit_dip, lwd=2, col='red');

###10 You can set up a 2 panel plot using the graphical parameter par(mfrow = c(2,1). Do this. Plot sha as a function of svl for Ctenophorus, then add the fitted regression line. Then, without closing your plot window, add a second plot for the Diporiphora data and also add the fitted line. When you have figured out how to do this, make sure that both plots have exactly the same x and y axes, so they can be compared visually. You can do this with the xlim and ylim graphical parameters, which are arguments that go to the plot function.


par(mfrow = c(2,1));
y_vec <- c(2.3, 3.5);
x_vec <- c(3.8, 4.7); 
plot(sha ~ svl, data=cteno, xlim=x_vec, ylim=y_vec);
fit_cteno <- lm(sha ~ svl, data=cteno);
abline(fit_cteno, lwd=2, col='blue');

plot(sha ~ svl, data=dip,  xlim=x_vec, ylim=y_vec);
fit_dip <- lm(sha ~ svl, data=dip);
abline(fit_dip, lwd=2, col='red');

#11 How many agamid species have an svl greater than 4.5? How many have an svl greater than 4.5 and a tail length greater than 5.25? How many have an svl greater than 4.5 OR a tail length greater than 5.25?

length (which (lizard$svl >4.5));
#18

length (which (lizard$svl >4.5 & lizard$tail >5.25));
#13

length (which (lizard$svl >4.5 | lizard$tail >5.25));
#20

###12 Compute the mean, median, and standard deviation (functions mean, median, sd) for the first 2 columns of the Ctenophorus data frame. What variables are these (extract the names of the variables using R code!) ?

ct_col <- c(1,2);
mean(cteno[ct_col]);
median(cteno[ct_col]); # some reason doesn't work
sd(cteno[ct_col]);
names(cteno[ct_col]);

###13 Compute the mean, median, and standard deviation (functions mean, median, sd) for columns 3, 6, and 7 of the Diporiphora data frame. What variables are these?

dip_col <- c(3, 6, 7);
dip_sub <- dip[dip_col];
dip_sub
mean(dip_sub);
median(dip_sub); # still doesn't work - maybe need to extract data without names?
sd(dip_sub);
names(dip_sub);

#try to extract column by column

dip3 <- dip[ , 3];
median(dip3);
dip6 <- dip[ , 6];
median(dip6);
# or could skip the naming step and call the column in brackets
median (dip[ , 7]);

#this works but seems like must be better way...also works when call row by name, i.e. median(dip$hw);


###14 Write a line of code that pulls out the ONLY the name of the species with the largest svl. Do it again for the species with the smallest svl.

row.names (lizard[lizard$svl == max(lizard$svl), ]); 
row.names (lizard[lizard$svl == min(lizard$svl), ]); 


###15  First, use what you know about vector operations to make a new vector that contains the UNLOGGED svl’s for all agamid species (to reverse a log transformation, you use the exp function). Call this new vector ’svl unlogged’. Now, make a new dataframe by ”binding” this vector to the agamids dataframe. This is a column vector, and you can make a new data frame with the function cbind. Look at the first 5 rows of your new data frame. How does it look? Did it work? Finally, in one line of code, create a new data frame of all rows where the unlogged svl is within 120 mm of the MAX value . How many species are in this?

svl_unlogged <- exp(lizard$svl);
svl_unlogged;

new_lizard <- cbind (lizard, svl_unlogged);

head(new_lizard);

w120max <- new_lizard [new_lizard$svl_unlogged + 120 >= max(svl_unlogged), ];
nrow (w120max);

###16  Read the dataframe ’biogeography.csv’. This contains 2 columns, including species names and an integer code corresponding to the geographic regions in which they are located. Use the sum trick on a logical vector to count the number of species in region 0. Then count the number that are not found in region 1. And another line of code to count the number of species NOT found in EITHER region 2 or region 3!

biogeo <- read.table('biogeography.csv', header=TRUE, sep=',');
biogeo

vec0 <- c(biogeo$region==0);
sum(vec0);

vecn1 <- c(biogeo$region != 1);

sum(vecn1);
vecn2n3 <- c(biogeo$region !=2 & biogeo$region !=3);
sum(vecn2n3);













