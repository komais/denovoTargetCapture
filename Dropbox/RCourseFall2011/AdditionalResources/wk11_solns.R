
1) The list gives you maximum flexibility. It can handle multiple datatypes, and components do not have to be of the same length. The matrix is least flexible: it requires that all columns be of the same length, and cannot handle mixed datatypes (the dataframe can handle multiple types of data)

2) 

x <- 1:7;
y <- seq(1, 14, by=2);
#non vectorized
res<-rep(NA, length(x))
for (i in 1:length(x))
	res[i] <- x[i] * y[i];
#this is how you would do it in C!


#vectorized
res <- x*y;

3) 

findFactors<-function(y)
{
	fact <- NULL;
	for (i in 1:300)
	{
		if (sum(y %% i) == 0)
			fact <- c(fact, i);	
	}	
	return(fact);
}

4) cumsum takes the cumulative sum of a vector of numbers. Thus, each element i of a vector x will be replaced by sum(x[1:i]).  If the vector is x<- c(1, 4, 10), then y <- cumsum(x) is computed as follows:
y[1] <- x[1]
y[2] <- x[1] + x[2]
y[3] <- x[1] + x[2] + x[3]

and so on.

5) 
##5) 
countWords <- function(x)
{
	z <- strsplit(x, split=' ');
	return(length(z[[1]]));	
}

6) 

countChar <- function(x)
{
	z <- strsplit(x, split = '');
	return(length(z[[1]]));	
}


7) Because the list structure keeps track of the elements of the original vector. Each component of the list produced by strsplit corresponds to an element of the original vector.

Consider:

x <- c('a hat', 'a cat', 'a fat rat');
strsplit(x, split='a')

#now, unlisting:
unlist(strsplit(x, split='a'))

IN the latter, there is no way to reconstruct which string came from which element of the original vector.

8) 

countChar_noSpace <- function(x)
{
	z <- unlist(strsplit(x, split = ''));
	z <- z[z != ' ' ] 
	return(length(z));	
}

9) 

invert <- function(string)
{
	z<- unlist(strsplit(string, split=''));
	z <- paste(rev(z), collapse='');
	return(z);	
}
#note use of rev() function, which negates need for a loop.

10)
scramble <- function(string)
{
	z<- unlist(strsplit(string, split=''));
	z <- sample(z, length(z));
	z <- paste(z, collapse='');
	return(z);	
}

11)

baseFreq <- function(filename)
{ 	
	dna <- scan(file = filename, what='character');
	dna <- unlist(strsplit(dna, split=''));
	res<-table(dna)/sum(table(dna));
	return(res);
}

12) 

#NUMBER of ales
beer <- scan('beers.txt', what='character', sep='\n')
v <- grep('ale', beer, ignore.case=TRUE)
length(v)
#note that this also finds strings like 'pale' and 'whale'.

#belgium beers:
v<-grep('Belgium', beer, ignore.case=TRUE);
beer[v]

#most common word:
beer<- tolower(beer);
x <- strsplit(beer, ' ');
x <- unlist(x);
length(x)
res <-table(x)
max(res)
res[res==max(res)]

13)

skink <- scan('skinkDNA.txt', what='character');

dnaSub <- function(x)
{
	x <-unlist(strsplit(x, split=''));
	x <- tolower(x);
	findstring <- c('a', 'c', 'g', 't');
	replacestring <- c('x', 'y', 'z', 'u');
	for (i in 1:length(findstring))
		x <- gsub(findstring[i], replacestring[i], x);
	x<-paste(x, sep='')
	return(x);	
}


14)
x <- scan('string_challenge1.txt', what='character', sep='\n');
pos <- unlist(gregexpr(' ', x)); #what am I doing here???

#you need the function findFactors for the next part:
fact <- findFactors(pos);

#unpack the challenge string:
y <- unlist(strsplit(x, split=''));

a <- seq(fact[2], length(y), by=fact[2]);
paste(y[a], collapse='');

15)


x<-scan('skinkDNA.txt', what='character');
dna <- unlist(strsplit(x, ''));
length(dna);
n_codons <- length(dna)/3;
codon <- NULL;
for (i in 1:n_codons)
{
	begin <- (i-1)*3 + 1;
	end <- (i-1)*3 + 3;
	temp <- paste(dna[begin:end], collapse='')
	codon <- c(codon, temp);	
}

#now, codon is list of length 381, where each element is a sequence triplet

gencode <- read.table(file = 'genetic_code.txt', header=T)

translated <- codon;
for (i in 1:nrow(gencode))
	translated <- gsub(as.character(gencode$codon[i]), as.character(gencode$aa[i]),translated)
translated<-paste(translated, collapse="")






