#1 use while loop to count
i <- 1
sum <- 0
while (i < 18) {
	sum = sum + i
	i <- i + 1
	}
#2 make a plot
MAXPOPSIZE <- 2000; curr_pop_size <- 1; popvector <- curr_pop_size; progeny <- 2;
while (curr_pop_size < MAXPOPSIZE){ curr_pop_size <- curr_pop_size*progeny;
popvector <- c(popvector, curr_pop_size);
}
gen <- c(1:length(popvector))
plot(gen,popvector)	
#3 random numbers
a <- rgeom(5000,0.3333)
mean(a)
hist(a)
sum(a)
#4 generations
gen <- rep(0,10)
for (i in 1:10) {
	MAXPOPSIZE <- 5000; curr_pop_size <- 8; 
	popvector <- curr_pop_size; 
	set.seed(i);
	while (curr_pop_size < MAXPOPSIZE){ 
		babies <- rgeom(curr_pop_size, .33333); 
		curr_pop_size <- sum(babies); 
		popvector <- c(popvector, curr_pop_size);
		}
	gen[i] <- length(popvector)	
	}
gen
mean(gen)
#5 for loop seems like the best option; while loops are good but if you know how many times you want to iterate, they are not as good because then you need a separate tracking variable -- ideally would make the while loop a subfunction...
#6 population size will always increase as mean number of progeny is 2 -- would really have to have strong stochastic effects to get that many people to have 
#7 R is rad
#8 wrong code -- misplaced ;
for (i in 1:10) {
cat(i, ' squared is ', i^2, '\n', sep='');
}
#9a 
days <- 30
my <- rep(0,days)
asst <- rep(0,days)
my[1] <- 400; asst[1] <- 120;
for (i in 2:30) {
	my[i] <- my[i-1]*1.1
	asst[i] <- asst[i-1]*1.2
	}
plot(seq(1,days),my,ylim=c(0,max(my,asst)))
points(seq(1,days),asst,col="red")
#log transformed
plot(seq(1,days),log(my),ylim=c(0,log(max(my,asst))))
points(seq(1,days),log(asst),col="red")
#9b
asst <- 120
kg <- asst * 0.000001
days <- 1
while (kg < 55) {
	asst <- asst * 1.2
	kg <- asst * 0.000001
	days <- days + 1
	}
#10
cat('\t','this is tab-indent. now i will show you', '\n', 'the new-','\n','line character: \\n', '\n', '\n', 'and the backslash is \\','\n','\n','this formatted output stuff is slick!!',sep='')#11
#na.omit is not necessary here, by my understanding
d <- read.table("/Users/singhal/seminars/Rcourse/Rweek4/skinks.txt",header=T)
species <- unique(d$species)
svl <- rep(0,length(species))
for (i in 1:length(species)) {
	svl[i] <- mean(d[d$species == species[i], ]$snout_vent)
	}
names(svl) <- species	
#12	
maxsvl <- rep(0,length(species))
for (i in 1:length(species)) {
	maxsvl[i] <- max(d[d$species == species[i], ]$snout_vent)
	}
names(maxsvl) <- species
#13
sites <- rep(0,length(species))
for (i in 1:length(species)) {
	sites[i] <- length(unique(d[d$species == species[i], ]$site))
	}
names(sites) <- species
sort(sites,decreasing=T)[1]
#14 assuming here that you mean the largest absolute
d[d$snout_vent == max(d$snout_vent), ]$species
#largest mean
sort(svl,decreasing=T)[1]

