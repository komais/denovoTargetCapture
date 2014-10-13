#Week 2 Homework
#Rachel Walsh

rm(list=ls())

#1. In a single line of code, generate a vector of all integers that are multiples of 10,
#from 10 and 500. There are several ways to do this, only one of which you've learned #yet!
q1 <- 10*(1:50);


#2. What happens if you divide a vector by another vector of equal length? Try this with
#some integer vectors of length 5. What if you multiply two vectors together? Note:
#these results will only make sense if your vectors are of equal length!
vector1 <- 10*1:5;
vector2 <- 1:5;
vector1/vector2;
vector1*vector2;


#3. Create a vector, in order, of the letters: R, T, E, C, V, O. Create a second 
#(numeric) vector of index positions and use it to create a third vector that spells a #word that appears twice in this sentence.
q3.char <- c('R', 'T', 'E', 'C', 'V', 'O');
q3.num <- c(5, 3, 4, 2, 6, 1);
q3.word <- q3.char[q3.num];


#4. A handy trick: In logical statements, TRUE has a value of 1 and FALSE has a #value of 0. You can exploit this property in concert with the sum function to quickly #count the number of elements of vectors that meet some particular condition. #Create a logical vector corresponding to Animals brain sizes greater than or equal #to 10, and count the number of TRUE values using sum.
data(Animals);
bigger10 <- Animals$body >= 10;
sum(bigger10);


#5. Read in the data table agamids morphometrics.csv. You will use the read.table
#function, and you will have to tell the function how to process the input. Is there a
#header row with variable names? What separates the data? Here, the data are #'comma separated values', hence the .csv extension on the filename. Often, you will #want to look at the data in a text editor (textwrangler, notepad++, etc, but NEVER #notepad) to check it out before trying to read it in R . Write single lines of code that #check the dimensions of the data frame.
agamids <- read.table('agamids_morphometrics.csv', sep = ',', header = T);
dim(agamids);
#Or you could do it like this:
nrow(agamids);
ncol(agamids);

#6. Make a new data frame with the first 3 rows of the agamid lizard dataframe. Make
#yet another dataframe with rows 20 to 25. Bind these rows together into another
#dataframe. You can bind rows of dataframes together using the rbind function, but
#make sure both of your subsetted dataframes are correct (check them by looking at
#them!) before doing this!. Write a statement that makes a vector of the species #included in the new dataframe.
agamids3 <- agamids[1:3, ];
agamids2025 <- agamids[20:25, ];
#Check before rbinding
agamids3
agamids2025

both.agamids <- rbind(agamids3, agamids2025);

species <- rownames(both.agamids); 
species <- unique(rownames(both.agamids));
#Looks like the unique isn't necessary here, since I get the same results with and without it...


#7. Another trick: Look at the row names for the 58 agamid species in the data frame.
#These are the species names. We are going to make a reduced data frame that #contains ONLY the species in the genus Ctenophorus . We will do this using the #function grep.  This function will be explored in much more detail later, but for now, #all you need to know is that it is a 'pattern matching' function. If you give it a vector of #character strings and a "target string", it will return the index values of all elements #that contain the target. For example, suppose you want the row with data from the #frilled dragon, Chlamydosaurus kingii. You could just do:
agamids['CHLAMYDOSAURUS_KINGII', ];
#But this only works if you remember how to spell the species name exactly as it is.
#What if all you remember is 'kingii'? Then you can exploit the grep function as #follows:
myindex <- grep('KINGII', rownames(agamids));
myindex;
agamids[ myindex, ];
#See how this works? the grep function (look at help) finds a pattern within a par-
#ticular target vector (in this case, the row name vector from the agamid data), and
#returns the index values of all the elements where the target is found.  Use the grep #function to make a new data frame with only species from the genus Ctenophorus. #How many species are in the dataset from this genus?

myCteno <- grep('CTENOPHORUS', rownames(agamids));
myCteno;
Ctenophorus <- agamids[myCteno , ];
Ctenophorus;
#This counts the number of spp. in the dataset from the genus Ctenophorus
length(rownames(Ctenophorus));


#8. Make a second dataframe for the genus Diporiphora, just as you did for #Ctenophorus.  Write an expression that counts the number of Diporiphora species #in the dataset.
myDipo <- grep('DIPORIPHORA', rownames(agamids));
myDipo;
Diporiphora <- agamids[myDipo, ];
Diporiphora;
length(rownames(Diporiphora));


#9. Morphometrics. We will do a "non-phylogenetic" analysis of the relationship #between lizard snout vent length (svl) and femur length (variable named 'sha', for #shank).  Fit a simple linear model to sha as a function of svl for both the #Ctenophorus and Diporiphora data.
Cteno.lm <- lm( sha ~ svl, data= Ctenophorus);
Cteno.lm; 

Dipo.lm <- lm( sha ~ svl, data= Diporiphora);
Diporiphora;

#10. You can set up a 2 panel plot using the graphical parameter par(mfrow = c
#(2,1). Do this. Plot sha as a function of svl for Ctenophorus, then add the  fitted #regression line.  Then, without closing your plot window, add a second plot for the #Diporiphora data  and also add the fitted line. When you have figured out how to #do this, make sure that both plots have exactly the same x and y axes, so they can #be compared visually. You can do this with the xlim and ylim graphical parameters #which are arguments that go to the plot function.
par(mfrow = c(2,1));
plot(Ctenophorus$sha ~ Ctenophorus$svl, col ='blue', xlim = c(3.7, 4.8), ylim = c(2.3, 3.5));
abline(Cteno.lm, col ='blue');
plot(Diporiphora$sha ~ Diporiphora$svl, col = 'red', xlim = c(3.7, 4.8), ylim = c(2.3, 3.5));
abline(Dipo.lm, col = 'red');


#11. How many agamid species have an svl greater than 4.5? 
bigger4.5 <- agamids$svl > 4.5;
#This gives the number of agamid spp with svl>4.5
sum(bigger4.5);

#How many have an #svl greater than 4.5 and a tail length greater than 5.25?
svl.and.tail <- agamids$svl > 4.5 & agamids$tail > 5.25;
sum(svl.and.tail);

#How many have an svl #greater than 4.5 OR a tail length greater than 5.25?
svl.or.tail <- agamids$svl > 4.5 | agamids$tail > 5.25;
sum(svl.or.tail);


#12. Compute the mean, median, and standard deviation (functions mean, median, #sd) for the first 2 columns of the Ctenophorus data frame. What variables are these #(extract the names of the variables using R code!) ?
#1st column
mean(Ctenophorus[ , 1]);
median(Ctenophorus[ , 1]);
sd(Ctenophorus[ , 1]);

#2nd column
mean(Ctenophorus[ , 2]);
median(Ctenophorus[ , 2]);
sd(Ctenophorus[ , 2]);

#Names of variables
colnames(Ctenophorus[ , 1:2]);


#13. Compute the mean, median, and standard deviation (functions mean, median, #sd) for columns 3, 6, and 7 of the Diporiphora data frame. What variables are #these?
#Mean
mean(Diporiphora[ , c(3, 6, 7)]);

#Median
median(Diporiphora[ , c(3, 6, 7)]);
#The line above doesn't work.  Why??
median(Diporiphora[ , 3])
median(Diporiphora[ , 6])
median(Diporiphora[ , 7])

#Standard dev
sd(Diporiphora[ , c(3, 6, 7)]);

#Variable names
colnames(Diporiphora[ , c(3, 6, 7)]);


#14. Write a line of code that pulls out the ONLY the name of the species with the #largest svl. Do it again for the species with the smallest svl.

rownames(agamids[(agamids$svl == max(agamids$svl)), ])
rownames(agamids[(agamids$svl == min(agamids$svl)), ])


#15. First, use what you know about vector operations to make a new vector that #contains the UNLOGGED svl's for all agamid species (to reverse a log #transformation, you use the exp function). Call this new vector 'svl unlogged'. Now, #make a new dataframe by "binding" this vector to the agamids dataframe. This is a #column vector, and you can make a new data frame with the function cbind. Look #at the first 5 rows of your new data frame. How does it look? Did it work? Finally, in #one line of code, create a new data frame of all rows where the unlogged svl is #within 120 mm of the MAX value. How many species are in this?

svl.unlogged <- exp(agamids$svl);
q15 <- cbind(agamids, svl.unlogged);
head(q15);

#Species within 120 mm of max unlogged svl
within.120 <- q15[(max(q15$svl.unlogged) - q15$svl.unlogged) < 120, ];
#Number of species
length(rownames(within.120));


#16. Read the dataframe 'biogeography.csv'. This contains 2 columns, including #species names and an integer code corresponding to the geographic regions in #which they are located. Use the sum trick on a logical vector to count the number #of species in region 0. Then count the number that are not found in region 1. And #another line of code to count the number of species NOT found in EITHER region #2 or region 3!
biogeo <- read.table('biogeography.csv', sep = ',', header = T);

#Number of species in region 0
region.0 <- biogeo$region == 0;
sum(region.0);

#Number of species not in region 1
not.region.1 <- biogeo$region != 1;
sum(not.region.1);

#Number of species NOT found in EITHER region 2 or 3
not.region.2or3 <- biogeo$region != 2 & biogeo$region != 3
sum(not.region.2or3)








