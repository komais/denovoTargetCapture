rm(list= ls());
library(ape);

#read agamid tree
agtree <- read.tree(file = 'agamidMCC.tre');

plot.phylo(agtree);

mydf <- read.table(file = 'agamids_morphometrics.csv', sep =',', header=TRUE);

# Always check input
head(mydf); # print 5 rows
names(mydf); # column names
rownames(mydf);
dim(mydf); #how many rows & columns

# get vector of species found in both tree
#	and dataframe
taxa.in.data <- agtree$tip.label[ agtree$tip.label %in% rownames(mydf)]; 

# make vector of "bad" species
dropset <- setdiff(agtree$tip.label, taxa.in.data);

# get rid of species
agtree2 <- drop.tip(agtree, dropset);

mydf2 <- mydf[ agtree2$tip.label, ];

mydf2[ 'POGONA_MINOR' ,  ];

mydf2[ 'made_up_species' , 'svl' ];

svl <- mydf2$svl;

# compute PIC on agamid data
ics <-  pic(svl, phy = agtree2);

ts <- var(ics);

fakevals <- numeric(1000)
for (i in 1:1000){
	fakedata <- sample(svl, size=length(svl));
	fakecontrasts <- pic(fakedata, agtree2);
	fakevals[i] <- var(fakecontrasts);

}

hist(fakevals, mar=c(6, 6, 1,1), col='gray50');
lines(x=c(ts, ts), y=c(0,500), lwd=3, col='red')

length(fakevals[fakevals <= ts])/1001;



















