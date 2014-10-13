x <- 1;
y <- 1;

for (i in 1:50)
{
x <- c(x, rnorm(1, x[length(x)]));
y <- c(y, rnorm(1, y[length(y)]));
}
plot(y~x, type = 'l');

cat('\\');



testPrime <- function(25)
{
	is.prime <- TRUE;
	
	for (i in 2:(25 - 1))
	{
		remainder <- some_integer %% i;
		if (remainder == 0)
			is.prime <- FALSE;
	}
	if (is.prime == TRUE){
		cat(some_integer, " is prime!\n", sep='');
	} else {
		cat(some_integer, " is NOT prime\n", sep='');
	}
}


MAX <- 7;
index <- 0;
while(index <= MAX){
index <- index + 1;
cat('index value current: ', index, '\n', sep='');
}
cat('loop is done\nValue of index at ');
cat('loop termination was ', index, '\n', sep='');


HW_#1
sumvariable <- 0; #sumvariable starts with value of 0

for(i in 1:17){
	cat('\n');
	cat('START: sumvariable = ', sumvariable);
	cat('\n');
	cat('Value of i is ', i, '\n');
	sumvariable <- sumvariable + i;
	cat('END: sumvariable = ', sumvariable);
	cat('\n');

}


sumvariable <- 0;
MAX <- 16;
index <- 0;
while(index <= MAX){
	index <- index + 1;
	sumvariable <- sumvariable + index;
}
cat('loop is done\nValue of index at ');
cat('loop termination was ', index, '\n', sep='');
cat(sumvariable);


MAXPOPSIZE <- 2000;
curr_pop_size <- 1;
popvector <- curr_pop_size;
progeny <- 2;
while (curr_pop_size < MAXPOPSIZE){
curr_pop_size <- curr_pop_size*progeny;
popvector <- c(popvector, curr_pop_size);
}

HW_#2

MAXPOPSIZE <- 2000;
curr_pop_size <- 1;
popvector <- curr_pop_size;
progeny <- 2;
while (curr_pop_size < MAXPOPSIZE){
curr_pop_size <- curr_pop_size*progeny;
popvector <- c(popvector, curr_pop_size);
plot(popvector);
}


popvector <- 0;
MAXPOPSIZE <- 2000;
curr_pop_size <- 1;
popvector <- curr_pop_size;
progeny <- rgeom(2, 0.3333);
while (curr_pop_size < MAXPOPSIZE){
curr_pop_size <- curr_pop_size*progeny;
popvector <- c(popvector, curr_pop_size);
plot(popvector);
}


HW_#3

value <- rgeom(5000, 0.3333);
mean(value);
hist(value);


curr_pop_size <- 8;
popvector <- curr_pop_size;
set.seed(10);
while (curr_pop_size < MAXPOPSIZE){
babies <- rgeom(curr_pop_size, .33333);
curr_pop_size <- sum(babies);
popvector <- c(popvector, curr_pop_size);
}
hist(popvector);
plot(popvector);

HW_#4
vector <- c(10,9,10,10,9,11,12,8,10,9);
mean(vector); #answer mean = 9.8

HW_#5
#I do think a loop is appropriate for this. Beats individually runnning the code 10 times.

HW_#6
# Presumably the random draw can result in zero offspring so it ought to be theorectically possible for pop size to decrease.

HW_#7

curr_pop_size <- sum(rgeom(curr_pop_size, 0.3333));
curr_pop_size;


HW_#8

# the problem was the semicolon after the 'for' statement
for (i in 1:10)
{
cat(i, ' squared is ', i^2, '\n', sep='');
	cat('\n');
	cat('Value of i is ', i, '\n');
}


#HW_9

#9A)
jimsparasites <- 400;
seansparasites <- 120;
day <- 0;
parvectorj <- jimsparasites;
parvectors <- seansparasites;


for (i in 1:30){
	day=day+1;
	jimsparasites <- jimsparasites * 1.10;	
	seansparasites <- seansparasites * 1.20;
	cat('Day = ', day, '\n', sep='');
	cat('Jims parasites = ', jimsparasites, '\n', sep='');
	cat('Seans parasites = ', seansparasites, '\n', sep='');
	parvectorj <- c(parvectorj,jimsparasites);
	parvectors <- c(parvectors,seansparasites);
	par(mfrow = c(2,1));
	plot(parvectorj, pch=19, xlim=c(0,32), ylim=c(0,30000));
	plot(parvectors, pch=19, xlim=c(0,32), ylim=c(0,30000));

}	


jimsparasites <- 400;
seansparasites <- 120;
day <- 0;
parvectorj <- jimsparasites;
parvectors <- seansparasites;

for (i in 1:30){
	day=day+1;
	jimsparasites <- jimsparasites * 1.10;	
	seansparasites <- seansparasites * 1.20;
	logjimsparasites <- log(jimsparasites);
	logseansparasites <- log(seansparasites);
	cat('Day = ', day, '\n', sep='');
	cat('Log Jims parasites = ', logjimsparasites, '\n', sep='');
	cat('Log Seans parasites = ', logseansparasites, '\n', sep='');
	parvectorj <- c(parvectorj,logjimsparasites);
	parvectors <- c(parvectors,logseansparasites);
	par(mfrow = c(2,1));
	plot(parvectorj, pch=19, xlim=c(0,32), ylim=c(4,15));
	plot(parvectors, pch=19, xlim=c(0,32), ylim=c(4,15));

}	


#9B)

MAXSPARASITEMASS <- 55; 
seansparasites <- 120;
sparasitemass <- seansparasites * .000001;
parvectors <- sparasitemass;

day <- 0;
parvectors <- sparasitemasss;

while (sparasitemass < MAXSPARASITEMASS){
	day=day+1;
	seansparasites <- seansparasites * 1.20;
	sparasitemass <- seansparasites * .000001;
	cat('Day = ', day, '\n', sep='');
	cat('Log Seans parasite mass = ', sparasitemass, '\n', sep='');
	parvectors <- c(parvectors,sparasitemass);

}	

# ANSWER = 72 DAYS



#HW_10
source('format.R');


#HW_11
lizards <- read.table(file = 'skinks.txt', sep = ',', header=TRUE);
rownames <- species;
myindex <- grep('helenae', rownames(species));
myindex;
name<-c[1,];
for (i in 1:length(c(species)){
	name <- c[1];
	meansvl <- mean[7];
}
?grep


