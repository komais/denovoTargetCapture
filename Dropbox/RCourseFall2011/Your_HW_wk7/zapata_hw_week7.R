# Homework 7
# Count the number of species and samples within time bins from x to y million years.  For example, count the number of species and samples within each 1 my time interval from 30 my before present though 0 my years before present.  The scirpt is flexible such that any time interval and any time bin can be specified

# Preliminaries: read in data, check data
x <- read.table("diatomsF.txt", sep="\t", header=T);
head(x);
dim(x);

########################################################
# Settings: Set variables

min_age <- 0; # Set minimum age to establish time interval
max_age <- 30; # Set maximum age to establish time interval
time_bin <- 1; # Set time bin for time interval

########################################################

# Calculate number of bins within time interval 
bin <- (max_age-min_age)/time_bin;
# Create vector of ages corresponding to each bin 
ages <- seq(max_age, min_age, by = -time_bin);

# Initialize counters
n_samples <- rep(0, bin);
n_species <- rep(0, bin);

# This loop counts and keeps track of the number of species and number of specimens within each time bin for the time interval specified above
for (i in 1:bin){
	n_samples[i] <- length(unique(x[x$sample_age <= ages[i] & x$sample_age > ages[i + 1], ]$list));
	n_species[i] <- length(unique(x[x$sample_age <= ages[i] & x$sample_age > ages[i + 1], ]$species));
}

# Plot with 2 panels
quartz.options(width = 8, height = 10, dpi = 72);
plot.new();
par(mfcol = c(2,1));

# Panel 1: plot number of species in each time interval
frame();
par(mar=c(6,6,1,1));
plot.window(xlim = rev(c(bin, min_age)), ylim = c(0, max(n_species)));
points(n_species);
axis(side = 1, at = seq(min_age, max_age, by = time_bin), cex = 1.3, labels = c(max_age:min_age)); # Only works well for time_bin = 1; with other time bins, lengths differ (!?)
axis(side = 2, cex = 1.3, las = 1);
mtext(side = 1, text = "Time (my)", line = 3, cex = 1.5);
mtext(side = 2, text = "Number of species", line = 3, cex = 1.5);

# Panel 2: plot number of samples in each time interval
frame()
par(mar=c(6,6,1,1));
plot.window(xlim = rev(c(bin, min_age)), ylim = c(0, max(n_samples)));
points(n_samples);
axis(side = 1, at = seq(min_age, max_age, by = time_bin), cex = 1.3, labels = c(max_age:min_age));
axis(side = 2, cex = 1.3, las=1);
mtext(side = 1, text = "Time (my)", line = 3, cex = 1.5);
mtext(side = 2, text = "Number of samples", line = 3, cex = 1.5);