# Homework week 2

# 1.
myvec <- (1:50 *10) ;

# 2.
myvec1 <- (1:5);
myvec2 <- (10:14);
myvec1 * myvec2;

# 3.
myvec1 <- c("R", "T", "E", "C", "V", "O");
myword <- myvec1 [ c(5, 3, 4, 2, 6, 1)];
myword;

# 4.
brain <- Animals$brain;
bigbrain <- brain >= 10;
sum(bigbrain);

# 5.
agamid_morph <- read.table("agamids_morphometrics.csv", header = TRUE, sep = ",", quote = "\" ' ", dec = ".");
agamid_morph;
dim(agamid_morph);

# 6. 
agamid_morph_1to3r <- agamid_morph[ 1:3, ];
agamid_morph_1to3r;

agamid_morph_20to25r <- agamid_morph [20:25, ];
agamid_morph_20to25r;

agamid_morph_subset <- rbind (agamid_morph_1to3r ,agamid_morph_20to25r, deparse.level = 1);

names(agamid_morph_subset) <- rownames(agamid_morph_subset);
names (agamid_morph_subset);

# 7.

myindex <- grep ("CTENOPHORUS", rownames (agamid_morph));
myindex;
ctenop_data <- agamid_morph [myindex, ];
ctenop_data;
nrow(ctenop_data);

# 8. 

myindex2 <- grep ("DIPORIPHORA", rownames (agamid_morph));
myindex2;
dipo_data <- agamid_morph [myindex2, ];
dipo_data;
nrow(dipo_data);

# 9.

fit_cteno <- (lm (ctenop_data$sha ~ ctenop_data$svl));
fit_dipo <- (lm (dipo_data$sha ~ dipo_data$svl));

# 10. 
par (mfrow = c(2,1));
plot (ctenop_data$sha ~ ctenop_data$svl);
abline (fit_cteno, lwd = 2, col = "blue");
plot (dipo_data$sha ~ dipo_data$svl);
abline (fit_dipo, lwd = 2, col = "red");
#Need to change x axis scale

# 11.
# Hey, Dan. This is incredible fun! But I couldn't finish the wh today though, no time... It took me around 5 hours to cover the hand-out and the hw until question 10. The rest of the hw is gonna take me another 2 more hours. Sorry for that. R.



