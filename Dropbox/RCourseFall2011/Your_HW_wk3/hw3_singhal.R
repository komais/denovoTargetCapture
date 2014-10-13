#3a
for (i in 1:9) {
	print("*")
}
#3b
for (i in 1:10) {
	cat('*',sep='')	
	if (i < 10) {
		cat("#")
	}
}
#4 dogs loop
#initial value of dogs: 10
#i	start	end
#1	10	11
#2	11	12
#3	12	13
#4	13	14
#5	14	15
#5 meatloaf loop
#initial value of meatloaf is 0
#i	start	end
#5	0	-4
#6	-4	-9
#7	-9	-15
#8	-15	-22
#9	-22	-30
#final value of meatloaf is -30
#6 bubbles loop
#initial value of bubbles is 12
#i	start	end
#-1	12	-1
#-2	-1	-2
#-3	-2	-3
#-4	-3	-4
#7
set.seed(1)
sumThis <- rnorm(10)
vectorSum <- 0
for (i in 1:length(sumThis)) {
		vectorSum = vectorSum + sumThis[i]
}
#8i
for (i in 1:7) {
	cat(letters[i])
}
#8ii
for (i in 7:1) {
	cat(letters[i])
}
#8iii
for (i in 1:7) {
	cat(letters[i])
	if (i < 7) {
			cat(" ")
	}
}
#8iv
for (i in 1:7) {
	cat(letters[i])
	if (i < 7) {
			cat("xx")
	}
}
#9 beerbottles
beerBottles <- function(x) {
	for(i in x:1) {
		cat(i,"bottles of beer on the wall\n",sep=" ")
	}
}
beerBottles(5)
#10
makeFib <- function(x) {
	if (x  < 2) {
		cat("Give me a higher number, please", "\n")
		return()
		}
	fib <- rep(0,x)
	fib[1] <- 1
	cat("Fib number 1 is 1","\n")
	cat("Fib number 2 is 1","\n")
	fib[2] <- 1
	for (i in 3:x) {
		fib[i] = fib[i-2]+fib[i-1]
		cat("Fib number ", i, " is ", fib[i], "\n",sep='')
	}
}	
makeFib(1)
#11 money
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5);	
income <- c(21, 21, 21);
bankAccounts <- c(10,9.2,5.6)
interestRate <- 0.0525
for (j in 1:5) {
	for (i in 1:length(bankAccounts)) {
		bankAccounts[i] <- bankAccounts[i] - house[i] - fun[i] - food[i] + income[i]
		bankAccounts[i] <- bankAccounts[i] + bankAccounts[i]*interestRate
		cat("Student ", i, "has ", bankAccounts[i], "in year ", j, "\n")
	}	
}
#12 pyramid
for (i in 10:1) {
	for (j in 1:i) {
		cat("#",sep='')
	}
	cat("\n")
}
#13 challenge
for (i in 6:1) {
	space <- i - 6 
	for (j in 0:space) {
		cat(" ",sep="")
	} 
	for (k in 1:i) {
		cat(LETTERS[k],sep='')
	}
	cat("\n")
}
#14 dataframe
lizards <-read.table("/Users/singhal/seminars/Rcourse/Rweek3/skinks.txt",header=T)
length(unique(lizards$species))
#15 new dataframe
subset <- lizards[!is.na(lizards$sex) & !is.na(lizards$weight),]
leon <- lizards[lizards$species=="leonhardii",]
sexes <- unique(lizards$sex)
for (i in 1:length(sexes)) {
	liz.sub <- lizards[lizards$sex==sexes[i] & !is.na(lizards$sex) & !is.na(lizards$weight) & lizards$species=="leonhardii",]
	a <- length(liz.sub$species)
	cat("I have ", a, " individuals of ", as.character(sexes[i]), "\n", sep='')
}
