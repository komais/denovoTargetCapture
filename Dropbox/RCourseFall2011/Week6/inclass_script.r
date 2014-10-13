#	Week 6 Script: Figs

#	Canned functions
# plot
# boxplot
# NO NO NO NO NO


# Figure 1
# Simulate genetic drift

# Step 1: Do simulation
# 		Basic parameters
POPSIZE <- 100;
NGENS <- 100;
freqA <- 0.5;
freqVec <- numeric(NGENS);

for (i in 1:NGENS){
	numA <- rbinom(n=1, size=POPSIZE, prob=freqA);
	# update freqA
	freqA <- numA/POPSIZE;
	freqVec[i] <- freqA;#store results
	
}

freqVec2 <- freqVec;

POPSIZE <- 100;
NGENS <- 100;
freqA <- 0.5;
#freqVec <- numeric(NGENS);

for (i in 1:NGENS){
	numA <- rbinom(n=1, size=POPSIZE, prob=freqA);
	# update freqA
	freqA <- numA/POPSIZE;
	freqVec2[i] <- freqA;#store results
	
}
###########################
# good plot
# Set graphics device
quartz.options(width=8, height=6, dpi=72);
plot.new();

# par: one of most important graphics functions
par(mar = c(6, 6, 0, 0));

# plot.window to set axis range
#	set up COORDINATE SYSTEM
plot.window(xlim = c(0, NGENS), ylim=c(0, 1));

#	Functions to add data to plot:
#  lines
#  points

# lines
#		lwd: line width
#		col: line color
#		lty: line type

lines(x = 1:NGENS, y = freqVec, lwd=3, col= 'red');
#	seq: gives a sequence of numbers
axis(side=1, at= seq(0, 100, by=10), cex.axis=1.3);
axis(side=2, at=seq(0, 1, by=0.2), cex.axis=1.3 , las=1);

# adds legends to axes
mtext(side =1, text = 'Generations', line=3.5, cex=1.75, font = 4 );

mtext(side=2, text='frequency of A', line=3.5, cex=1.75, font=4);

## #### 
# Plot 2

colvec <- colors();


quartz.options(width=8, height=6, dpi=72);
plot.new();

# par: one of most important graphics functions
par(mar = c(6, 6, 0, 0));

# plot.window to set axis range
#	set up COORDINATE SYSTEM
plot.window(xlim = c(0, NGENS), ylim=c(0, 1));

# Run simulation over and over
NSIMS <- 10;
POPSIZE <- 100;

for (k in 1:NSIMS){
	# reset value of freqA to INITIAL CONDITION
	freqA <- 0.5;
	
	# Empty and RESET my freqVec
	freqVec <- numeric(NGENS);
	for (i in 1:NGENS){
		numA <- rbinom(n=1, size=POPSIZE, prob=freqA);
		# update freqA
		freqA <- numA/POPSIZE;
		freqVec[i] <- freqA;#store results
	
	}
	x <- sample(colors(), size=1);
	lines(x=1:NGENS, y=freqVec, lwd=1, col=x);
	
}

#	seq: gives a sequence of numbers
axis(side=1, at= seq(0, 100, by=10), cex.axis=1.3);
axis(side=2, at=seq(0, 1, by=0.2), cex.axis=1.3 , las=1);

# adds legends to axes
mtext(side =1, text = 'Generations', line=3.5, cex=1.75, font = 4 );

mtext(side=2, text='frequency of A', line=3.5, cex=1.75, font=4);





### 
#	Multi-paneled plot
#  plot freqVec
#	plot freqVec2



# Plot 3 
quartz.options(width=6, height=10, dpi=72);
plot.new();
par(oma=c(5,2,1,1));

par(mfcol=c(2, 1)); # make matrix of plots
#			of dimension 2 x 1
# par(mfrow = ... )

## BEFORE EACH INDIVIDUAL PLOT
frame();
# just the same as for individual plot
par(mar = c(6, 6, 1, 1));

plot.window(xlim = c(0, NGENS), ylim=c(0, 1));

lines(x = 1:NGENS, y = freqVec, lwd=3, col= 'red');
#	seq: gives a sequence of numbers
axis(side=1, at= seq(0, 100, by=10), cex.axis=1.3);
axis(side=2, at=seq(0, 1, by=0.2), cex.axis=1.3 , las=1);

mtext(side =1, text = 'Generations', line=3.5, cex=1.75, font = 4 );
mtext(side=2, text='frequency of A', line=3.5, cex=1.75, font=4);

### Plot freqVec2
frame();
# just the same as for individual plot
par(mar = c(6, 6, 1, 1));

plot.window(xlim = c(0, NGENS), ylim=c(0, 1));

points(x = 1:NGENS, y = freqVec2, col= 'black', pch=21, bg = 'darkgreen', cex=1.5);
#	seq: gives a sequence of numbers
axis(side=1, at= seq(0, 100, by=10), cex.axis=1.3);
axis(side=2, at=seq(0, 1, by=0.2), cex.axis=1.3 , las=1);

mtext(side =1, text = 'Generations', line=3.5, cex=1.75, font = 4 );
mtext(side=2, text='frequency of A', line=3.5, cex=1.75, font=4);

polygon(x= , y= );






























NSIMS_PER_BIRTHRATE <- 1000;
BIRTHRATES <- seq(0.01, 0.5, length.out=50);

results <- matrix(0, nrow=NSIMS_PER_BIRTHRATE, ncol=length(BIRTHRATES));

for (i in 1:length(BIRTHRATES)){
	
	newBR <- BIRTHRATES[i];
	for (k in 1:NSIMS_PER_BIRTHRATE){
		results[k ,i] <- doSimulation(newBR);	
	}
}

doSimulation <- function(birthrate){
	# function, whenever used
	#	return the number of gens
	#	to get to MAXPOPSIZE
	#  FOR a particular value
	#	of birthrate
	while(){
		
		
		
	}

	#myRand <- rnorm(1);
	return (length(popvector));
}


while (popsize < POPMAX){
	add_to_popluation
	
}




yy <- c(0, freqVec, 0 );
xx <- c(1, 1:NGENS ,100);
polygon(x = xx, y = yy);





