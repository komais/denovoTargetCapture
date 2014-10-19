Time spent = 2 hours

rm(list = ls());

# Question 3A
for (i in 1:9) {
	cat("*", sep="\n");
}

# Question 4
Initial value of dogs: 10
1	10	11
2	11	12
3	12	13
4	13	14
5	14	15

# Question 5
Initial value of meatloaf: 0
5	0	-4
6	-4	-9
7	-9	-15
8	-15	-22
9	-22	-30
Final value of meatloaf: -30

# Question 6
Initial value of bubbles: 12
-1	12	-1
-2	-1	-2
-3	-2	-3
-4	-3	-4

# Exercise for loops with vectors
nameVector <- c("Charlie", "Helga", "Clancy", "Matilda", "Jones");
for (i in 1:length(nameVector)){
	cat("Nice to meet you,", nameVector[i], "\n");
}

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);

interestRate <- 0.0525;

compounded <- rep(0, length(bankAccounts));

for (i in 1:length(bankAccounts))
{
	compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
}

# Question 7
sum <- 0
for (i in 1:length(sumThis))
{
	sum <- sumThis[i]+ sum
}

set.seed(1);
sumThis <- rnorm(10);

sum(sumThis);
sum;
# sum(sumThis) = sum

# Question 8
# part (i)
letters <- c("a", "b", "c", "d", "e", "f", "g");

for (i in 1:7) {
	cat (letters[i]);
}

# part (ii)
for (i in 7:1) {
	cat (letters[i]);
}

# part (iii)
for (i in 1:7) {
	cat (letters[i], sep=" ");
}
# can't get space between letters

# Question 9
beerBottles <- function(x)
{
	for(x in x:1)
	{
		cat(x, "bottles of beer on the wall", "\n");
	}
}

# Question 10
Fib <- rep(1, 17);
Fib[1] = 0
Fib[2] = 1
for (i in 3:17)
{
	Fib[i] <- Fib[i-2] + Fib [i-1];
}
Fib;

# Nested loops
bankAccounts <- c(10, 9.2, 5.6);
interestRate <- 0.0525;

for (j in 1:5)
{
	for (i in 1:length(bankAccounts))
	{
		bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
	}
	print(bankAccounts)
}

# Question 11
house <- c(4.8, 3.8, 5.7);
food<- c(3.5, 4.3, 5.0);
fun <- c(7.8, 2.1, 10.5);
income <- c(21, 21, 21);

for (j in 1:5)
{
	for (i in 1:length(bankAccounts))
	{
		bankAccounts[i] <- interestRate*(bankAccounts[i]-house[i]-food[i]-fun[i]+income[i]) + bankAccounts[i]-house[i]-food[i]-fun[i]+income[i]
	}
	print(bankAccounts)
}


# outer and inner loops
for (i in 1:5)
{
	for (k in i:5)
	{
		cat ("i is ", i, "k is ", k, "\n", sep=" ");
	}
}

# Question 12
for (i in 10:1)
{
	for (k in i:10)
	{
		cat ("#");
	}
}
# I know that the sep="\n" needs to go somewhere, but I'm stuck.