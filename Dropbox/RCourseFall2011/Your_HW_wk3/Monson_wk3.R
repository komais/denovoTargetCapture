rm(list=ls());

####### 3a. 

for (i in 1:9){
  cat('*', sep='\n');
}

####### 3b. 

for (i in 1:9){
  cat('*', '#', sep='');
}

####### 4 - 6 are on paper.

####### 7. 

set.seed(1);
sumThis <- rnorm(10);
sum <- 0;

for (i in 1:length(sumThis)){
  sum <- sum + sumThis[i];
}

####### 8.

## i.

for (i in 1:7){
  cat(letters[i]);
}

## ii.

for (i in 7:1){
  cat(letters[i], "\n");
}

## iii.

for (i in 1:7){
  cat(letters[i], "");
}

## iv. 

for (i in 1:7){
  cat(letters[i], 'xx');
}

####### 9. 

beerBottles <- function(x)
{
  for(x in x:1){
    cat(x, "bottles of beer on the wall", "\n");
  }
}

####### 10.

fib <- rep(0, length(17));
fib[1] <- 0;
fib[2] <- 1;

for (i in 3:17){
  fib[i] <- fib[i-1] + fib[i-2];
  cat("Fib number", i, "is", fib[i], "\n");
}

####### 11. 



