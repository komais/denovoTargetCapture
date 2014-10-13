rm(list=ls());
setwd(C:/Users/Julian/Desktop/fichiers/RWeek6);
#1° The simulation code corresponds to the first pseudocode
#2°
#Set up the number of simulation
#Set up the number of timesteps
#For each simulation
#   Set up the position of Brownie 
#     For each time step
#       Choose step size from N(0,1)
#       Get the new position by adding step size to last position
#   Record the end position of this simulation in the recording vector
#3°
#a) POSSIBLE color:blue bird:hammerkop event:marathon food:hamhock 
#b) POSSIBLE: color:blue IMPOSSIBLE: birds:hammerkop, pigeon
#c) No because if we have " I love birds.", we will also see "not quite a loon".
#d) Green and the rest - Ostrich and the rest - Yum and the rest 

#4°
# When people are 21

#5° #CHANGE# Prime number test
testPrime<-function(x){
  for (i in 2:(x-1)){
    if (x%%i==0){
      prime<-FALSE;
   }
  } 
  cat(prime);
}
testPrime(11);
testPrime(6);

#6°
set.seed(1);
x<-rnorm(10);
for (i in 1:length(x)){
  if (x[i]<=-0.5){
    cat(x[i],"is less than -0.5!")
    cat(sep="\n")
  }else if (x[i]>=0.5){
    cat("1.7. Whopper!")
    cat(sep="\n")
  }else{
    cat(x[i],"is in the middle")
    cat(sep="\n")
    } 
}
  
#7°
for (i in 1:100){
  if (i%%3==0)
    cat("Fizz");
  if (i%%5==0)
    cat("Buzz");
  if (i%%3!=0 & i%%5!=0)
    cat(i) 
    cat("\n")
}

#8°
F<-function(x,y){
  if (x>=0 & y>=0)
    res<-x+y
  if (x>=0 & y<0)
    res<-x+y^2
  if (x<0 & y>=0)
    res<-x^2+y
  if (x<0 & y<0)
    res<-x^2+y^2
  res
}
F(0,1)
F(1,1)
F(-1,-10)
F(-5,3)
F(3,-5)

#9°
a<-0;
for (i in 1:5000){
  ngens<-0
  MAXPOPSIZE <- 10000;
  curr_pop_size <- 10;
  popvector <- curr_pop_size;
  set.seed(1);
  while (curr_pop_size < MAXPOPSIZE){
    ngens<-ngens+1
    if (ngens%%2==0){
    babies <- rgeom(curr_pop_size,0.5);
    curr_pop_size <- sum(babies);
    popvector <- c(popvector, curr_pop_size);
    }
    else if (ngens%%2!=0){
    babies <- rgeom(curr_pop_size,0.25);
    curr_pop_size <- sum(babies);
    popvector <- c(popvector, curr_pop_size);
    }
   }
  a<-c(a,ngens);
}
a<-a[-1]
hist(a,breaks=(0:25))

#10°
print("Starting homework");
  for (i in 1:100){
    cat("Happiness:",i,"%","\n");
  }
print("Homework finished. I want more homework!!!")

#11°
#What will happen to allele frequencies over time if you use replace = FALSE? 
#-> frequencies stay the same
#a)
#i: Statement of the problem you are trying to solve/model
#I want to study the change of allele frequencies over time.

#ii: What are my inputs/outputs
#INPUTS: pop size, number of each allele (equal) and number of generations
#OUTPUTS: frequencies of each allele for each generation after 50 generations

#iii: Pseudocode with good indentation
#Set up popsize and number of a and b alleles
#Set up number of generation
#Set up a recording vector for the frequency of a
#for the number of generation
#  do random drawing of the same number of alleles to create the new generation
#  and simultaneously replace the previous generation
#  record the frequency of allele a in the new population

#iv: Code with error checkings bit where relevant
pop<-c(rep('A',20),rep('B',20));
NGENS<-50
freq_A_time<-0.5
for (i in 1:NGENS){
  pop<-sample(pop,40,replace=TRUE);
  freq_A_time<-c(freq_A_time,(sum(pop=="A"))/length(pop));
}
plot(freq_A_time,type="s");

#b)
#i: Statement of the problem you are trying to solve/model
#How many generations on average does it take for the population to become
#monomorphic for one allele or the other? How does this relate to the initial population size?

#ii: What are my inputs/outputs
#INPUTS: pop size, number of each allele (equal)
#OUTPUTS: number of generations when one allele is fixed

#iii: Pseudocode with good indentation
#First question:
#for 5000 times
#  Set up popsize and number of a and b alleles
#  Set up a recording vector for the waiting time
#  While no allele has fixed
#    do random drawing of the same number of alleles to create the new generation
#    and simultaneously replace the previous generation
#    update the waiting time 
# record the waiting  time after each for loop
#mean and variance of waiting time

#Second question:
#Set up a recording matrice for size and the final waiting time
#for different pop size
#  Set up a recording vector for the waiting time
#  While no allele has fixed
#    do random drawing of the same number of alleles to create the new generation
#    and simultaneously replace the previous generation
#    update the waiting time 
# record the waiting  time after each for loop with its pop size
#plot(popsize~waiting time)
#try to find a linear model or something

#iv: Code with error checkings bit where relevant
#First question:
wait_times<-rep(0,5000);
for (i in 1:5000){
  pop<-c(rep('A',20),rep('B',20));
  wait_time<-0;
  while (sum(pop=="A")<40 & sum(pop=="B")<40){
    pop<-sample(pop,40,replace=TRUE);
    wait_time<-wait_time+1;  
  }
  wait_times[i]<-wait_time;
}
mean(wait_times);
var(wait_times);

#Second question:
size_times<-mat.or.vec(2,500);
for (i in 1:500){
  pop<-c(rep('A',i),rep('B',i));
  wait_time<-0;
  while (sum(pop=="A")<2*i & sum(pop=="B")<2*i){
    pop<-sample(pop,2*i,replace=TRUE);
    wait_time<-wait_time+1;
  }
size_times[1,i]<-i;
size_times[2,i]<-wait_time;
}
row.names(size_times)<-c("Population size","Waiting time");
plot(size_times[2,]~size_times[1,],xlab="Population size", ylab="Time until fixation");

#12°
#a)
timesteps<-100;
x<-0;
y<-0;

abs<-x;
ord<-y;

for (i in 1:timesteps){
  x<-x+rnorm(1,mean=0,sd=1);
  y<-y+rnorm(1,mean=0,sd=1);
  
  abs<-c(abs,x);
  ord<-c(ord,y);
}
plot(ord ~ abs, type = "l")

#b)
timesteps<-100;
x<-0;
y<-1;

abs<-x;
ord<-y;

room.max.x<-10;
room.min.x<-0;
room.max.y<-10;
room.min.y<-0;

for (i in 1:timesteps){
  
  set.seed(i);
  
  a<-rnorm(1,mean=0,sd=3)
  if (x+a<=room.max.x & x+a>=room.min.x){
    x<-x+a;
    
  }else if (x+a>room.max.x){
    x<-2*room.max.x-a-x;
    
  }else if (x+a<room.min.x){
    x<-room.min.x-a-x;
  }
  abs<-c(abs,x);
}
    
for (i in 1:timesteps){
      
  set.seed(231*i);
  a<-rnorm(1,mean=0,sd=3)
  if (y+a<=room.max.y & y+a>=room.min.y){
    y<-y+a;
    
  }else if (y+a>room.max.y){
    y<-2*room.max.y-a-y;
    
  }else if (y+a<room.min.y){
    y<-room.min.y-a-y;
  }
  ord<-c(ord,y);
}
plot(ord ~ abs, type = "l");
abs
ord


#12°
#c)
timesteps<-100;
x<-0;
y<-1;

abs<-x;
ord<-y;

room.max.x<-10;
room.min.x<-0;
room.max.y<-10;
room.min.y<-0;
bump<-0;
#Considering that if she bumps in a corner she will actually bump twice.

for (i in 1:timesteps){
  
  set.seed(i);
  a<-rnorm(1,mean=0,sd=3);
  if (y+a<=room.max.y & y+a>=room.min.y){
    y<-y+a;
    
  }else if (y+a>room.max.y){
    y<-2*room.max.y-a-y;
    bump<-bump+1;
    
  }else if (y+a<room.min.y){
    y<-room.min.y-a-y;
    bump<-bump+1;
  }
  ord<-c(ord,y);
}


for (i in 1:timesteps){
  
  set.seed(i);
  a<-rnorm(1,mean=0,sd=3);
  if (x+a<=room.max.x & x+a>=room.min.x){
    x<-x+a;
    
  }else if (x+a>room.max.x){
    if (ord[i]+a>=8.5 & ord[i]+a<=10){
      cat("SUH HUP GANDALF! It took me ", i ,"timesteps to come here !");
      break();
    }else{
      x<-2*room.max.x-a-x;
      bump<-bump+1;
    }
    
  }else if (x+a<room.min.x){
    x<-room.min.x-a-x;
    bump<-bump+1;
  }
  abs<-c(abs,x);
}
bump;
