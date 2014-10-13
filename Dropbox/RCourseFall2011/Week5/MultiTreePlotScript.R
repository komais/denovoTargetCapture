library(ape);
# get vector of filenames
filelist <- dir('sonaltrees/'); 

#make a path name:
filelist <- paste('sonaltrees/', filelist, sep='');

# read all of trees and stores them
for (i in 1:length(filelist)){
	temptree <- read.tree(filelist[i]);
	
	if (i == 1){
		treelist <- list(temptree);
	}else{
		treelist[[i]] <- temptree;
	}

}

cladevec <- c('_SS_', '_SL_', '_S_', '_NN_', '_NC_', '_NS_');

colvec <- c('red', 'blue', 'black', 'darkgreen', 'orange', 'gray50');

### set up PLOT
quartz.options(height=8, width=10, dpi=72);
plot.new();

par(mfrow=c(3,3));

for (i in 1:length(treelist)){
	# make temp tree
	temptree <- treelist[[i]];
	Ntips <- length(temptree$tip.label);
	dropcount <- Ntips - 100;
	dropset <- sample(temptree$tip.label, dropcount);
	
	# get rid of "dropped" taxa
	# 	using drop.tip function from ape:
	temptree <- drop.tip(temptree, dropset);
	temptree <- ladderize(temptree);
	
	par(mar=c(4,2,4,2));
	plot.phylo(temptree, show.tip.label=F);

	tipvec <- rep('white', 50);
	
	# loop over clades:
	for (j in 1:length(cladevec)){
		tipvec[grep(cladevec[j], temptree$tip.label)] <- colvec[j];
		
	}
	tiplabels(temptree$tip.label, col=tipvec,cex=0.1);
	mtext(text=filelist[i], side=3, cex=0.8)
}











