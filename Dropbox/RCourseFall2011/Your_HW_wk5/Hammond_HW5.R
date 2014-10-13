#1 infinte loops: a, b, c, d are infinite loops


#2
strnorm <- system.time(rnorm(10000000, 0, 1))
strpois <- system.time(rpois(10000000, 2))
strunif <- system.time(runif(10000000, 0, 10))
strgeo <- system.time(rgeom(10000000, 0.5))
strbinom <- system.time(rbinom(1, 10000000, .5))

times <- c(strnorm[3], strpois[3], strunif[3], strgeo[3], strbinom[3])
plot(times)
#fastest= binom
#slowest = geom


#3
set.seed(1)
means <- c(1, 10, 100, 1000, 10000, 100000, 1000000)
for(i in 1:length(means)){
	strnorm3 <- system.time(rnorm(5000000, means[i]))
	cat("for a mean of ", means[i], ", elapsed time was ", strnorm3[3], "\n")
}


#4 1s and 0s are whether or not you got a head for that trial
rbinom(5, size=1, prob=0.5)
rbinom(10, size=1, prob=0.5)
rbinom(20, size=1, prob=0.5)

rbinom(5, size=1, prob=0.8)
rbinom(10, size=1, prob=0.8)
rbinom(20, size=1, prob=0.8)


#5
#for progeny=2
maxpop <- 10000
startpop <- 20
currpop <- startpop
N <- 1000
ngen2 <- c()
for(i in 1:N){
	set.seed(i)
	currpop <- startpop
	popvector <- currpop
	while(currpop < maxpop){
		progeny <- rgeom(currpop, 0.3333)
		currpop <- sum(progeny)
		popvector <- c(popvector, currpop)
	}
ngen2 <- c(ngen2, length(popvector))
}	
cat("For progeny = 2, mean number gens = ", mean(ngen2), "\n")

#for progeny = 3
maxpop <- 10000
startpop <- 20
currpop <- startpop
N <- 1000
ngen3 <- c()
for(i in 1:N){
	set.seed(i)
	currpop <- startpop
	popvector <- currpop
	while(currpop < maxpop){
		progeny <- rgeom(currpop, 0.25)
		currpop <- sum(progeny)
		popvector <- c(popvector, currpop)
	}
ngen3 <- c(ngen3, length(popvector))
}	
cat("For progeny = 3, mean number gens = ", mean(ngen3), "\n")

#for progeny = 4
maxpop <- 10000
startpop <- 20
currpop <- startpop
N <- 1000
ngen4 <- c()
for(i in 1:N){
	set.seed(i)
	currpop <- startpop
	popvector <- currpop
	while(currpop < maxpop){
		progeny <- rgeom(currpop, 0.2)
		currpop <- sum(progeny)
		popvector <- c(popvector, currpop)
	}
ngen4 <- c(ngen4, length(popvector))
}	
cat("For progeny = 4, mean number gens = ", mean(ngen4), "\n")

par(mfrow=c(3, 1), mar=c(5,5,5,5))
hist(ngen2, xlim=c(5,13), ylim=c(0,1000))
hist(ngen3, xlim=c(5,13), ylim=c(0,1000))
hist(ngen4, xlim=c(5,13), ylim=c(0,1000))


#6
#a
clm <- rgeom(1000, 0.25)
myvec1 <- rep(NA, 1000)
for(i in 1:1000){
	mysum <- sum(rgeom(10,0.25))
	myvec1[i] <- mysum 
}
myvec2 <- rep(NA, 1000)
for(i in 1:1000){
	mysum <- sum(rgeom(1000,0.25))
	myvec2[i] <- mysum 
}
par(mfrow=c(3, 1))
hist(clm)
hist(myvec1)
hist(myvec2)

#b
clm <- runif(1000, min=-1, max=5)
myvec1 <- rep(NA, 1000)
#Q: do I need to use set.seed() here?
for(i in 1:1000){
	mysum <- sum(runif(10, min=-1, max=5))
	myvec1[i] <- mysum 
}
myvec2 <- rep(NA, 1000)
for(i in 1:1000){
	mysum <- sum(runif(1000, min=-1, max=5))
	myvec2[i] <- mysum 
}
par(mfrow=c(3, 1))
hist(clm)
hist(myvec1)
hist(myvec2)


#7
rbinom(1000, 1, 0.7)
#a. sequence of 1000 coin toss experiments with probability of heads=0.7

rbinom(1, 14, 0.5)
#b.number of heads in 14 coin tosses, with probability of heads=0.5; largest 14, smallest 0

sum(rbinom(1000, 1, 0.5))
#c.# heads in a sequence of 1000 coin toss experiments with prob heads =0.5

#d 
rbinom(1, 1000, 0.5)


#8a one experiment is one trial so we'll do 5000 total experiments.  In each experiment we'll calculate the probability of getting a head in 200 tosses of a fair coin.  we'll make a list of each of those 5000 probabilites and find the chances of getting a probability >= 139/200

#c
vec8 <- rep(NA, 5000)
for(i in 1:5000) {
	vec8[i] <- mean(rbinom(200, 1, 0.5))
}
prob <- sum(vec8 >= (139/200))
cat("Probability of the data under the null hypothesis: ", prob, "\n")