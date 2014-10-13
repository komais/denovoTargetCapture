# solutions to HW3

# 3a:
for (i in 1:9){
	cat('*', sep='\n');	
}


# 3b : skip

# 4. 
# i	| Dogs at start | Dogs at end
# 1		10				11
# 2		11				12
# 3		12				13
# 4		13				14
# 5		14				15


#5
# i	| meatloaf start | meatloaf end
# 5		0				(0 - 5 + 1) = -4
# 6		-4				(-4 - 6 + 1) = -9
# 7		-9				(-9 - 7 + 1) = -15
# 8		-15				(-15 - 8 + 1) = -22
# 9		-22				(-22 - 9 + 1) = -30

#6
# i	| bubbles start | bubbles end
# -1		12				-1
# -2		-1				-2
# -3		-2				-3
# -4		-3				-4

#7
mySum <- 0; #variable to hold sum
set.seed(1);
sumThis <- rnorm(10);
for (i in 1:length(sumThis)){
	mySum <- mySum + sumThis[i];
}

mySum;

#8a
for (i in 1:7){
	cat(letters[i]);
}

#8b
for (i in 7:1){
	cat(letters[i], '\n');
}

#8c
for (i in 1:7){
	cat(letters[i], ' ');
}

#8d: ignore, but
#	this was sort-of a trick question!
cat(letters[1:7], sep='xx');
 
#9
beerBottles <- function(x){	for(i in x:1)	{		cat(i, 'sinful vessels of Miller High Life\n', sep=' ');	}		}

#10
seqlength <- 17;#initializing to 1st & 2nd values of Fib series...fibseq <- c(0, 1); for (i in 3:seqlength){
	#note that you start on 3, because you've already done 1 & 2 	fibseq<-c(fibseq, fibseq[i-1] + fibseq[i-2]);}fibseq;

# 11
bankAccounts <- c(10, 9.2, 5.6);interestRate <- 0.0525;house <- c(4.8, 3.8, 5.7);food<- c(3.5, 4.3, 5.0);fun <- c(7.8, 2.1, 10.5);income <- c(21, 21, 21);compounded <- rep(0, length(bankAccounts));for (j in 1:5){	for (i in 1:length(bankAccounts))	{		bankAccounts[i] <- bankAccounts[i]-fun[i]-food[i]-												house[i]+income[i];		bankAccounts[i] <- interestRate*bankAccounts[i] + 												bankAccounts[i]	}	print(bankAccounts)}

#12
pounds <- 10;for (i in 1:pounds){	for (j in i:pounds)		cat('#');	cat('\n');}


#13
letts <- c('A', 'B', 'C', 'D', 'E', 'F');for (i in 0:(length(letts)-1))	cat(rep(' ', i), letts[1:(length(letts)-i)], '\n', sep='')#I just used rep() as a bit of a shortcut. 

#14

lizards <- read.table('skinks.txt', header=T, sep='\t');
# how many species?
length(unique(lizards$species));
#unique makes a vector containing only the unique 
#	elements of a vector

#15
lizardsValid <- lizards[!is.na(lizards$sex) & !is.na(lizards$weight), ];

leonhardii <- lizardsValid[lizardsValid$species == 'leonhardii', ];
# 311 rows at this point...

unique(leonhardii$sex);
#males are M
nrow(leonhardii[leonhardii$sex == 'M', ]);
#OR
sum(leonhardii$sex == 'M');

# females

nrow(leonhardii[leonhardii$sex == 'F', ]);
#OR
sum(leonhardii$sex == 'F');





