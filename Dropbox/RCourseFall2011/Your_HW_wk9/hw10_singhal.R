#question 11A
geneticDrift <- function(numInd,numGen) {
	pop <- c(rep('a',numInd),rep('b',numInd))
	aFreq <- rep(NA,numGen)
	aFreq[1] <- sum(pop == "a")/length(pop)
	for (i in 2:numGen) {
		pop <- sample(pop,length(pop),replace=TRUE)
		aFreq[i] <- sum(pop == "a")/length(pop)
		}
	return(aFreq)	
	}
	
#question 11B	
geneticDriftGen <- function(numInd,numSim) {
	gens <- rep(NA,numSim)
	for (i in 1:numSim) {	
		pop <- c(rep('a',numInd),rep('b',numInd))
		aFreq <- sum(pop == "a")/length(pop)
		gen = 1
		while (aFreq > 0 & aFreq < 1) {
			pop <- sample(pop,length(pop),replace=TRUE)
			aFreq <- sum(pop == "a")/length(pop)
			gen = gen + 1
			}
		gens[i] <- gen	
		}
	return(gens)	
	}
	
#question 12A
brownieWalk <- function(xstart, ystart, numSteps) {
	xcoord <- rep(NA,numSteps)
	ycoord <- rep(NA,numSteps)
	
	xcoord[1] <- xstart
	ycoord[1] <- ystart
	
	for (i in 2:numSteps) {
		xcoord[i] <- xcoord[i - 1] + rnorm(1,0,1)
		ycoord[i] <- ycoord[i - 1] + rnorm(1,0,1)
		} 
	
	return(list(xcoord,ycoord))	
	}	
	
#question 12B
brownieWalkRoom <- function(xstart, ystart, width, length, numSteps) {
	xcoord <- rep(NA,numSteps)
	ycoord <- rep(NA,numSteps)
	
	xcoord[1] <- xstart
	ycoord[1] <- ystart
	
	for (i in 2:numSteps) {
		xcoord[i] <- xcoord[i - 1] + rnorm(1,0,3)
		ycoord[i] <- ycoord[i - 1] + rnorm(1,0,3)
		
		if (xcoord[i] > width) {
			xcoord[i] <- width - (xcoord[i] - width)
			}else if (xcoord[i] < 0) {
				xcoord[i] <- 0 - (xcoord[i] - 0)
			}	
		if (ycoord[i] > length) {
			ycoord[i] <- length - (ycoord[i] - length)
			}else if (ycoord[i] < 0) {
				ycoord[i] <- 0 - (ycoord[i] - 0)
			}		
		} 
	
	return(list(xcoord,ycoord))	
	}	
	
#question 12C
brownieWalkExit <- function(numSim) {
	
	time <- rep(NA,numSim)
	coord <- list()	
	lRoom <- 10
	wRoom <- 10
	
	for (i in 1:numSim) {
		xcoord <- c()
		ycoord <- c()
		
		xcoord[1] <- 0
		ycoord[1] <- 0
		gen <- 2
	
		while(gen) {
			xcoord[gen] <- xcoord[gen - 1] + rnorm(1,0,3)
			ycoord[gen] <- ycoord[gen - 1] + rnorm(1,0,3)
			
			if (xcoord[gen] > wRoom) {
				if (ycoord[gen] >= 8.5 & ycoord[gen] <= 10) {
					time[i] <- gen
					coord[[i]] <- list(xcoord,ycoord)
					gen = -1;					
					}
				else {
					xcoord[gen] <- wRoom - (xcoord[gen] - wRoom)
					}	
				} 
			else if (xcoord[gen] < 0) {
				xcoord[gen] <- 0 - (xcoord[gen] - 0)
				}
				
					
			if (ycoord[gen] > lRoom) {
				ycoord[gen] <- lRoom - (ycoord[gen] - lRoom)
				}
			else if (ycoord[gen] < 0) {
				ycoord[gen] <- 0 - (ycoord[gen] - 0)
				}
						
			gen = gen + 1
			}
		}	
		
	return(list(time,coord))	
	}	
	
	