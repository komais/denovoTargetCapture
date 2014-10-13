
#1 Sum from 1:17
counter <- 0
sum1 <- 0
n <- 17
while(counter < n){
	counter <- counter + 1
	sum1 <- sum1 + counter
}
cat("sum is " , sum1 , "\n" , "counter is" , counter)


#2 exponential growth of bacteria
MAXPOP <- 2000
curr_pop <- 1
popvector <- curr_pop
progeny <- 2
while(curr_pop < MAXPOP){
	curr_pop <- curr_pop *progeny
	popvector <- c(popvector, curr_pop)
}
cat(curr_pop, "\n" , popvector)
#plotting growth over generations
time <- 0 : ((log(MAXPOP) / log(progeny))+1)
plot(popvector~time)


#3 geometric distributions
prob3 <- rgeom(5000, 0.3333)
mean(prob3)
hist(prob3)
sum(prob3)


#4 n generations until maxpop is exceeded
ngen <- c()
for(i in 1:10) {
	set.seed(i)
	MAXPOP <- 5000
	curr_pop <- 8
	popvector <- curr_pop
	while(curr_pop < MAXPOP) {	
		babies <- rgeom(curr_pop , 0.33333)
		curr_pop <- sum(babies)
		popvector <- c(popvector, curr_pop)
	}
cat("popvector for i =" , i , " is", popvector, "\n")
ngen <- c(ngen, length(popvector))
}
mean(ngen)


#5. Yes a for loop works for setting the value of set.seed() because we want the while loop to go 10 times, each time with a different value of set.seed()


#6. No; on at least one occasion it appears to stay the same from one generation to the next.  This could be due to chance, since the rgeom() function draws random numbers from a specified geometric distribution.  In most cases, however, the population increases significantly (approximately doubles in size) from one generation to the next.


#7. Yes


####8. ?the code seems to work?
for (i in 1:10) {
	cat(i, " squared is " , i^2, "\n" , sep="");
}


#9A.
mypop <- c(400)
myrate <- .1
bobpop <- c(120)
bobrate <- .2
for(i in 1:30){
	mynew <- mypop[i] + mypop[i]*myrate
	bobnew <- bobpop[i] + bobpop[i]*bobrate
	mypop <- c(mypop, mynew)
	bobpop <- c(bobpop, bobnew)
}
#plotting it
xaxis <- 0:30
plot(mypop~xaxis , col = "blue", ylim=c(0,max(mypop,bobpop)))
points(bobpop, col = "red")
legend(0, y=6800, fill=NULL, c("me" , "bob"), col=c("blue" , "red") , pch=21:21)

####not sure if this is right
plot(log(mypop)~xaxis , col="blue", ylim=c(0,log(max(mypop,bobpop))))
points(log(bobpop) , col="red")
legend(0, y=8, fill=NULL, c("me" , "bob"), col=c("blue" , "red") , pch=21:21)


#9B.
bobpop <- 120
bobrate <- 0.2
pmass <- 0
bobmass <- 55
ndays <- 0
while(pmass < bobmass){
	ndays <- ndays + 1
	bobpop <- bobpop + bobrate*bobpop
	pmass <- 0.000001*bobpop 
#	cat("the field assistant's parasite load is" , pmass , " kilograms" , "\n")
}
cat("\n After" , ndays, " days, the field assistant's parasite load is" , pmass , " kg")


#10
cat("\t this is tab-indent. now i will show you \n the new- \n line character: \\n \n \n and the backslash is \\ \n \n this formatted output stuff is slick!!")


#####11 Q: why when i include the following in the code is speciesnames[i] printed as a number in the order 5,6,7,9,10,1,8,2,3,4??:
#cat("\n the mean svl value for " , speciesnames[i] , " is" , mean(newdf$snout_vent) , "\n")
lizards <- na.omit(read.table("skinks.txt" , header=TRUE))
#lizards <- read.table("skinks.txt" , header=TRUE)
speciesnames <- unique(lizards$species)
svmean <- c()
for (i in 1:length(speciesnames)) {
	newdf <- lizards[lizards$species == speciesnames[i],]
	svmean <- c(svmean, mean(newdf$snout_vent))	
}
names(svmean) <- speciesnames


#12.
#lizards <- na.omit(read.table("skinks.txt" , header=TRUE))
lizards <- read.table("skinks.txt" , header=TRUE)
speciesnames <- unique(lizards$species)
svmax <- c()
for (i in 1:length(speciesnames)) {
	newdf <- lizards[lizards$species == speciesnames[i],]
	svmax <- c(svmax, max(newdf$snout_vent))	
}
names(svmax) <- speciesnames


#13.
#lizards <- na.omit(read.table("skinks.txt" , header=TRUE))
lizards <- read.table("skinks.txt" , header=TRUE)
speciesnames <- unique(lizards$species)
nsites <- c()
for (i in 1:length(speciesnames)) {
	newdf <- lizards[lizards$species == speciesnames[i],]
	nsites <- c(nsites, length(unique(newdf$site)))	
}
names(nsites) <- speciesnames
names(nsites[nsites==max(nsites)])


#14.
(lizards[lizards$snout_vent == max(lizards$snout_vent),])$species