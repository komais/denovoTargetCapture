# Homework for 16 April 2012
# Cheryl Hojnowski


#1.) This is pseudocode for an algorithm. There are no modular components.

#2.) 

#Initialize vector to store results from 5000 simulations
#Brownie takes 50 steps in each simulation. 
#For each simulation:
  #Set initial position of Brownie to x=0
#For each step:
  #choose step size from a normal distribution
  #add step size to previous position
  #Record Brownie's position after 50 steps in results vector

INITIAL_POSITION <- 0;
results <- rep(0,5000);
TIME_STEPS <- 50;
NUM_SIMS <- 5000;

for(i in 1:NUM_SIMS){
  location <- INITIAL_POSITION;
  for(k in 1:TIME_STEPS){
    step_size <- rnorm(1, mean = 0, sd=1);
    location <- location + step_size;
    #cat('step', k, 'step', step_size, 'loc', location, '\n', sep = ' ');
  }
  results[i] <- location;
}

results;

#3a) The only possible values for color, bird, event and food are blue, hammerkop, marathon, 
  #and hamhock, respectively.
color <- 'green';
bird <- 'pigeon';
event <- 'marathon';
food <- 'oatmeal';
if(color == 'blue'){
  if(bird == 'hammerkop'){
    if(event == 'marathon'){
      if(food == 'hamhock'){
        cat('yum');
        }
      }
    }else if(bird == 'pigeon'){
      cat('not quite a loon...')
      if(event == 'marathon')
        while(1)
          print('I love birds.')
    }else{
      cat('ostrich???')
    }
}else{
  cat('green');
}
                    
#3b) Color is blue;, event and food could be anything, and bird could be anything except a pigeon 
  #or a hammerkop. 

#???I'm not sure how the while(1) statement in the code works.

#3c.) I think no -- You would observe both "I love birds" and "not quite a pigeon". 
  #However, I'm not quite sure what the "1" in the statement "while(1)" refers to.

#3d.) I think that all the ouputs are mutually exclusive except for "not quite a loon..." and
  #"I love birds." (???)

#4.) Robocop fails when people are 21 (and when Berkeley Bowl is closed).

#5.) 
for(i in 1:25){
  if(i%%2 == 0){
    cat('even', '\n');
    }
  else{
    cat('odd', '\n')
  }
}

#6.)
set.seed(1);
x <- rnorm(10);
x;

for(i in 1:10){
  set.seed(1);
  x <- rnorm(10);
  if(x[i] <= -0.5){
    cat(x[i], 'is less than -0.5!', '\n')
  }
  else if(x[i] > -0.5 & x[i] < 0.5){
    cat(x[i], 'is in the middle!', '\n')
  }
  else{
    cat(x[i], ". Whopper!", '\n')
  }
}

#7.) 
for(i in 1:100){
  if(i%%3 == 0 & i%%5 ==0){
    cat('FizzBuzz', '\n')
  }
  else if(i%%3 == 0){
    cat('Fizz', '\n')
  }
  else if(i%%5 ==0){
    cat('Buzz', '\n')
  }
else{
cat(i, '\n')
}
}

#I couldn't figure out how to do this with only 3 conditional expressions.

#8.)

myFxn <- function(x,y){
  if(x >= 0 & y >= 0){
    result <- x + y;
  }
  else if(x >=0 & y < 0){
    result <- x + y^2;
  }
  else if(x < 0 & y >= 0){
    result <- x^2 + y;
  }
  else if(x < 0 & y < 0){
    result <- x^2 + y^2;
  }
  return(result);
}

myFxn(0,1);
myFxn(1,1);
myFxn(-1, -10);
myFxn(-5, 3);
myFxn(3, -5);

#9a.) 

MAXPOPSIZE <- 10000;
curr_pop_size <- 10;
popvector <- curr_pop_size

while( curr_pop_size < MAXPOPSIZE){
  if(length(popvector)%%2 == 0){
    #this is a bad year, number of generations is even
    babies <- rgeom(curr_pop_size, 0.5);
  }
  else{
    babies <- rgeom(curr_pop_size, 0.25); #good year, ngens is odd
  }
  curr_pop_size <- sum(babies); # assuming organism is semelparous; 
  #otherwise curr_pop_size <- curr_pop_size + sum(babies);
  popvector <- c(popvector, curr_pop_size);
}

popvector;

#If we consider that initial generation is generation 0, rather than generation 1:


MAXPOPSIZE <- 10000;
curr_pop_size <- 10;
popvector <- curr_pop_size
gen <- 0

while( curr_pop_size < MAXPOPSIZE){
  if(length(popvector)%%2 == 0){
    #this is a bad year, number of generations is even
    babies <- rgeom(curr_pop_size, 0.5);
  }
  else{
    babies <- rgeom(curr_pop_size, 0.25); #good year, ngens is odd
  }
  curr_pop_size <- sum(babies); # assuming organism is semelparous; 
  #otherwise curr_pop_size <- curr_pop_size + sum(babies);
  popvector <- c(popvector, curr_pop_size);
  gen <- gen + 1;
}

popvector;

#9b.) 
#I'm assuming we are plotting the number of generations to reach the max pop size in the histogram

#run 5000 simulations
#population starts at 10 for each simulation
#calculate the total number of generations in each simulation

NUM_SIMS <- 50; #I changed this because it was taking a really long time with 5000. Even 100 takes a really long time (more than 5 min)
MAXPOPSIZE <- 10000;

ngens <- rep(0, NUM_SIMS); #initialize vector to hold results

for(i in 1:NUM_SIMS){
  curr_pop_size <- 10;
  popvector <- curr_pop_size
  while( curr_pop_size < MAXPOPSIZE){
    if(length(popvector)%%2 == 0){
      #this is a bad year, number of generations is even
      babies <- rgeom(curr_pop_size, 0.5);
    }
    else{
      babies <- rgeom(curr_pop_size, 0.25); #good year, ngens is odd
    }
    curr_pop_size <- sum(babies); # assuming organism is semelparous; 
    #otherwise curr_pop_size <- curr_pop_size + sum(babies);
    popvector <- c(popvector, curr_pop_size);
  }
  ngens[i] <- length(popvector);
}

ngens;
hist(ngens);

#If we consider that initial generation is generation 0, rather than generation 1:

NUM_SIMS <- 50; #I changed this because it was taking a really long time with 5000. Even 100 takes a really long time (more than 5 min)
MAXPOPSIZE <- 10000;

ngens <- rep(0, NUM_SIMS); #initialize vector to hold results

for(i in 1:NUM_SIMS){
  curr_pop_size <- 10;
  popvector <- curr_pop_size;
  gen <- 0 #initial generation is generation zero
  while( curr_pop_size < MAXPOPSIZE){
    if(gen%%2 == 0){
      #this is a bad year, number of generations is even
      babies <- rgeom(curr_pop_size, 0.5);
    }
    else{
      babies <- rgeom(curr_pop_size, 0.25); #good year, ngens is odd
    }
    curr_pop_size <- sum(babies); # assuming organism is semelparous; 
    #otherwise curr_pop_size <- curr_pop_size + sum(babies);
    popvector <- c(popvector, curr_pop_size);
    gen <- gen +1
  }
  ngens[i] <- length(popvector);
}

ngens;
hist(ngens);

#11a.)
 
#function "sample":
pop <- c(rep('a', 5), 'b');
sample(pop, 6, replace = TRUE);

pop <- c(rep('skunk', 45), rep('dog', 30));
sample(pop, length(pop), replace = TRUE);

#11a.) 

#Problem that I am trying to solve / model: I am trying to estimate the frequencies of 2 alleles
  #in a population of 20 individuals after 50 generations

#Inputs: initial allele frequencies (numbers of alleles), initial population size (remains constant throughout)
  #Outputs: allele frequences in each of the 50 generations. I expect an output vector of 
    #length 50 that indicates the frequency of one of the alleles in each of the 50 generations
  #Parameters: we will sample alleles randomly with replacement

#Pseudocode:
  #Set initial population of 20 individuals with equal allele frequences (20 A alleles and 20 a alleles)
  #At each generation, 
    #randomly sample 40 alleles from the current allele population 
    #store the frequency of allele A in a results vector

#Code:

NGENS <- 50; #50 generations
freqA <- rep(0, NGENS); #initialize vector to hold results
pop <- c(rep('A', 20), rep('B', 20)); #create initial population
#pop; ##check that the code above worked
#length(pop); ##still checking
#length(which(pop == 'A')) / length(pop); ##how to count frequency of A alleles

for(i in 1:NGENS){
  freqA[i] <- length(which(pop =='A')) / length(pop);
  cat('generation', i, 'number of alleles is', length(pop), 'number of A alleles is', length(which(pop == 'A')), '\n');
  pop <- sample(pop, length(pop), replace = TRUE);

}

freqA;

#11b.)

#Problem to model: The average number of generations for one allele to become fixed, for an initial
  #population size of 20 individuals and equal frequences of alleles A and a.

#Inputs: initial numbers of alleles and initial population size
#Outputs: number of generations until one allele is fixed. Since we want an average, I would
  #run a simulation (say, 1000 times), and therefore my output would be a numeric vector of length 1000
  #with each value in the vector representing the number of generations in each simulation
#Parameters: sample alleles randomly with replacement

#Pseudocode:
#For each simulation, 
  #set initial population of 20 individuals with equal allele frequences (40 alleles; 20 A alleles and 20 a alleles)
  #set initial generation (generation 0)
  #count the number of generations until frequency of one allele is zero
#Within each simulation: 
  #Until frequency of one allele is zero: 
    #At each generation, randomly sample 40 alleles from the current allele population 
    #Recalculate the frequency of the alleles at each generation
    #Keep track of what generation you're at

#Code:

NUM_SIMS <- 1000; #run 1000 simulations
ngens <- rep(0, NUM_SIMS); #initialize vector to store results

for(i in 1:NUM_SIMS){
  pop <- c(rep('A', 20), rep('B', 20)); #create initial population (20 individuals / 40 alleles) 
    #for each simulation
  freqA <- length(which(pop == 'A')) / length(pop);
  gen <- 0;
  
  while(freqA != 0 & freqA != 1){

    #cat('generation is', gen, 'number of alleles is', length(pop), 'number of A alleles is', length(which(pop == 'A')), '\n')
      #error-checking line
    pop <- sample(pop, length(pop), replace = TRUE);
    freqA <- length(which(pop == 'A')) / length(pop);
    gen <- gen + 1
  }
  
  ngens[i] <- gen
}

ngens;
hist(ngens);

#If want to simulate this for different initial starting population sizes, then just change the 
  #numbers in the pop vector. Should be able to run the rest of the code without changes.

#12a.)

#Problem: I want to model Brownie's movements in 2 dimensions, and determine where she ends up
  #after a certain number of time steps

#Inputs: Brownie's initial position, at (0,0)
#Outputs: Brownie's final position. I will get two vectors as the outputs, one vector which gives
  #her location on the x-axis at each time step, and one that gives her position on the y-axis at each 
  #time step
#Parameters: the size of each step in the x- or y-plane is drawn from a normal distribution with mean = 0 and sd = 1

#Pseudocode:
  #Set Brownie's initial position at (0,0)
  #For each time step, 
    #Determine size of step along x-axis from a normal distribution
    #Determine size of step along y-axis from normal distribution
    #Store new locations on x- and y-planes in 2 vectors

#Code:

TIME_STEPS <- 100 #set number of time steps
x <- rep(0, TIME_STEPS); #initialize vector to store results for locations on x-axis
y <- rep(0, TIME_STEPS); #initialize vector for y locations

x[1] <- 0;
y[1] <- 0;

for(i in 1:TIME_STEPS){
  x_step <- rnorm(1, mean =0, sd=1);
  y_step <- rnorm(1, mean = 0, sd=1);
  x[i+1] <- x_step + x[i];
  y[i+1] <- y_step + y[i];
  cat('x start is ', x[i], 'step size is ', x_step, 'finish is ', x[i+1], '\n');
  cat('y start is ', y[i], 'step size is ', y_step, 'finish is ', y[i+1], '\n');
}

plot(y ~ x, type = 'l')

#to do this for 1000 time steps, just change TIME_STEPS above to 1000, and run the code again as it is.

#12b.)

#Problem: I want to model Brownie's movements within a room of dimensions 10 by 10 units. I have to 
  #account for the fact that Brownie cannot step out of the room -- instead, she bounces off the walls.

#Inputs: 
  #Brownie's starting position at (0,1)
  #The dimensions of the room (10 by 10) -- this is either an input or a parameter, I guess
#Outputs: Brownie's x and y coordinates as she moves around the room over 100 or 1000 time steps. 
  #This will be 2 vectors (an x and a y vector) of length 100 or 1000.
#Parameters: 
  #Brownie's step size is drawn from a normal distribution with mean = 0 and sd =3
  #Room size is 10 by 10 (x = (0,10) and y = (0,10))
  #conditions for what happens if Brownie hits the wall of the room

#Pseudocode:
  #Brownie starts at (0,1)
  #Room size is 10 by 10 (x and y values cannot exceed 10 and cannot be below 0)
  #Number of time steps is 100 or 1000
  #At each time step, 
    #size of Brownie's step in the x-plane is drawn from N(0,3)
    #size of Brownie's step in y-plane is drawn from N(0,3)
  #If x- or y-value exceeds the size of the room, Brownie moves back along the x- or y-plane by 
    #the excess amount

TIME_STEPS <- 100 #set number of time steps
x <- rep(0, TIME_STEPS); #initialize vector to store results for locations on x-axis
y <- rep(0, TIME_STEPS); #initialize vector for y locations

x[1] <- 0;
y[1] <- 1;

for(i in 1:TIME_STEPS){
  x_step <- rnorm(1, mean =0, sd=3);
  y_step <- rnorm(1, mean = 0, sd=3);
  if(x_step + x[i] > 0 & x_step + x[i] < 10){
    x[i+1] <- x_step + x[i];
  }
  else if(x_step + x[i] < 0){
    x[i+1] <- 0 - x_step - x[i]; #figure this out using arithmetic ( 0 - (x[i] - 0 - x_step) and simplify)
  }
  else if(x_step + x[i] > 10){
    x[i+1] <- 10 - (x[i] - 10 + x_step);
  }
  
  if(y_step + y[i] > 0 & y_step + y[i] < 10){
    y[i+1] <- y_step + y[i];
  }
  else if(y_step + y[i] < 0){
    y[i+1] <- 0 - y_step - y[i]; #figure this out using arithmetic ( 0 - (x[i] - 0 - x_step) and simplify)
  }
  else if(y_step + y[i] > 10){
    y[i+1] <- 10 - (y[i] - 10 + y_step);
  }
  cat('x start is ', x[i], 'step size is ', x_step, 'finish is ', x[i+1], '\n');
  cat('y start is ', y[i], 'step size is ', y_step, 'finish is ', y[i+1], '\n');
}

plot(y ~ x, type = 'l')

#To simulate 1000 time steps, just change the value of TIME_STEPS above to 1000
#It seems I've done this in a rather cumbersome way. I wonder if there is a more elegant way to do it?

#12c.)

#Problem: I want to identify how many time steps are needed for Brownie to step into the portal 
  #to Middle Earth (i.e., to take a step that lands between the coordinates (10, 8.5) and (10, 10))

#Inputs: 
  #Brownie's starting position at (0,1)
  #The dimensions of the room (10 by 10) -- this is either an input or a parameter, I guess
#Outputs: The number of time steps for Brownie to step into the Middle Earth portal 
  #unless I run a simulation, this will just be one number
#Parameters: 
  #Brownie's step size is drawn from a normal distribution with mean = 0 and sd =3
  #Room size is 10 by 10 (x = (0,10) and y = (0,10))
  #conditions for what happens if Brownie hits the wall of the room
  #Where the portal is located

#Pseudocode:
  #Brownie starts at (0,1)
  #Room size is 10 by 10 (x and y values cannot exceed 10 and cannot be below 0)
  #At each time step, 
    #size of Brownie's step in the x-plane is drawn from N(0,3)
    #size of Brownie's step in y-plane is drawn from N(0,3)
    #If step size causes x-value to be greater than 10:
      #first check to see if y-value is between 8.5 and 10. If it is, then Brownie goes to 
        #Middle Earth
    #If step size causes y-value to be greater than 8.5:
      #check to see if x-value is equal to 10. If it is, then Brownie goes to Middle Earth
    #Otherwise if x- or y-value exceeds the size of the room, Brownie moves back along the x- or y-plane by 
      #the excess amount
  #Count the number of time steps for Brownie to land in Middle Earth portal


##I DIDN'T GET THIS ONE -- I WANTED TO USE A WHILE LOOP BUT COULDN'T FIGURE OUT HOW TO MAKE THAT WORK.


x <- 0;
y <- 1;

x_vector <- x
y_vector <- y

while(x != 10 & y < 8.5){

#for(i in 1:TIME_STEPS){
  x_step <- rnorm(1, mean =0, sd=3);
  y_step <- rnorm(1, mean = 0, sd=3);
  if(x_step + x > 0 & x_step + x < 10){
    x <- x_step + x;
  }
  else if(x_step + x < 0){
    x <- 0 - x_step - x; #figure this out using arithmetic ( 0 - (x[i] - 0 - x_step) and simplify)
  }
  else if(x_step + x >= 10){
    if(y >= 8.5 & y <= 10){
      x == 10
    }
    else{
    x <- 10 - (x - 10 + x_step);
    }
  }
  
  if(y_step + y > 0 & y_step + y < 10){
    y <- y_step + y;
  }
  else if(y_step + y < 0){
    y <- 0 - y_step - y; #figure this out using arithmetic ( 0 - (x[i] - 0 - x_step) and simplify)
  }
  else if(y_step + y > 10){
    if(x == 10){
      y==10
    }
    else{
    y <- 10 - (y - 10 + y_step);
    }
  }
  cat( 'x step size is ', x_step, 'x location is ', x, '\n');
  cat( 'y step size is ', y_step, 'y location is ', y, '\n');
  
  x_vector <- c(x_vector, x);
  y_vector <- c(y_vector, y);
  
  time <- length(x_vector);
  time_check <- length(y_vector); #should be the same length as x
}

  

time;
time_check;

plot(y_vector ~ x_vector, type = 'l')