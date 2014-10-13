#Homework

#1: In a single line of code, generate a vector of all integers that are multiples of 10, from 10 to 500. There are several ways to do this, only one of which you've learned yet!

x <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500)

#2: What happens if you divide a vector by another vector of equal length? Try this with some integer vectors of length 5. What if you multiply two vectors together? Note: these results will only make sense if your vectors are of equal length!

x <- c(1,2,3,4,5)
y <- c(1:5)
z <- x/y

[1] 1 1 1 1 1 #Every element in the first vector was divided by the corresponding element in the second vector

w <- x*y

[1]  1  4  9 16 25 # Here, every element in the first vector was multiplied by the corresponding element in the second vector

#3. Create a vector, in order, of the letters: R, T, E, C, V, O. Create a second (numeric) vector of index positions and use it to create a third vector that spells a word that appears twice in this sentence.

vector <- c('R', 'T', "E", "C", "V", "O")
numeric <- c(5,3,4,2,6,1)
indexVector <- vector[numeric]
> indexVector
[1] "V" "E" "C" "T" "O" "R"

#4: A handy trick: In logical statements, TRUE has a value of 1 and FALSE has a value of 0. You can exploit this property in concert with the sum function to quickly count the number of elements of vectors that meet some particular condition. Create a logical vector corresponding to Animals brain sizes greater than or equal to 10, and count the number of TRUE values using sum.

compare_vec <- Animals$brain >= 10
sum(compare_vec)
[1] 22

#5: Read in the data table agamid_morphometrics.csv. You will use the read.table function, and you will have to tell the function how to process the input. Is there a header row with variable names? What separates the data? Here, the data are 'comma separated values,' hence the .csv extension on the filename. Often, you will want to look at the data file in a text editor (textwrangler, notepad++, etc, but NEVER notepad) to check it out before trying to read it in R. Write single lines of code that check the dimensions of the data frame.

agamid <-  read.table("agamids_morphometrics.csv", header = TRUE, sep = ",")
dim(agamid)

#6: Make a new data frame with the first 3 rows of the agamid lizard dataframe. Make yet another dataframe with rows 20 to 25. Bind these rows together into another dataframe. You can bind rows of dataframes together using the rbind function, but make sure both of your subsetted dataframes are correct (check them by looking at them!) before doing this!. Write a statement that makes a vector of the species included in the new dataframe.

FirstThreeAgamid <- agamid[c(1:3),]
                               svl     tail     hdep      ljl      dtr       hw       nd
AMPHIBOLURUS_GILBERTI     4.667016 5.632123 2.740792 3.520543 3.269252 3.024502 2.008229
AMPHIBOLURUS_LONGIROSTRIS 4.672130 5.855474 2.743552 3.582616 3.350907 2.945374 2.056248
AMPHIBOLURUS_MURICATUS    4.449335 5.117994 2.522524 3.338494 3.089830 2.934920 2.000128
                               hum      ant      man      di4      sha      cru      foo
AMPHIBOLURUS_GILBERTI     2.772972 2.654382 1.917737 2.312787 3.341844 3.310800 2.859357
AMPHIBOLURUS_LONGIROSTRIS 2.801243 2.618546 1.928268 2.422127 3.378553 3.269966 2.823432
AMPHIBOLURUS_MURICATUS    2.578195 2.287471 2.018009 2.102507 3.002708 2.835564 2.492103
                               to4      wpg      dpg
AMPHIBOLURUS_GILBERTI     3.073737 2.857962 2.853618
AMPHIBOLURUS_LONGIROSTRIS 3.183384 2.772714 2.785964
AMPHIBOLURUS_MURICATUS    2.788093 2.823757 2.584752
SixAgamids <- agamid[c(20:25),]
                           svl     tail     hdep      ljl      dtr       hw       nd      hum
CTENOPHORUS_MACULATUS 3.961316 4.818961 1.887491 2.680544 2.471299 2.314906 1.471622 2.085670
CTENOPHORUS_MACULOSUS 4.247702 4.605170 2.364686 2.986646 2.790952 2.748097 1.901645 2.326329
CTENOPHORUS_MCKENZIEI 4.244249 5.122704 2.301180 3.000664 2.762611 2.604165 1.759475 2.351086
CTENOPHORUS_NUCHALIS  4.687252 4.976937 2.744863 3.370964 3.069098 3.145831 2.046517 2.789872
CTENOPHORUS_ORNATUS   4.452683 4.967190 2.284652 3.227807 2.968013 2.952711 1.924779 2.710866
CTENOPHORUS_PICTUS    4.119734 4.709179 2.284880 2.906278 2.692608 2.618150 1.688154 2.288990
                           ant      man      di4      sha      cru      foo      to4      wpg
CTENOPHORUS_MACULATUS 1.958358 1.167062 1.675920 2.629032 2.703727 2.197440 2.474648 2.253367
CTENOPHORUS_MACULOSUS 2.297442 1.680916 1.760559 2.807612 2.723981 2.277164 2.249090 2.619377
CTENOPHORUS_MCKENZIEI 2.170528 1.420739 1.702743 3.012754 2.970260 2.451222 2.636809 2.486723
CTENOPHORUS_NUCHALIS  2.667329 1.855825 2.056084 3.123657 3.108705 2.557639 2.466862 3.031842
CTENOPHORUS_ORNATUS   2.363777 1.800908 2.029866 3.187879 3.176098 2.652998 2.735101 2.713882
CTENOPHORUS_PICTUS    2.020490 1.316376 1.700047 2.771910 2.775580 2.232890 2.351000 2.429160
                           dpg
CTENOPHORUS_MACULATUS 1.932621
CTENOPHORUS_MACULOSUS 2.423320
CTENOPHORUS_MCKENZIEI 2.355519
CTENOPHORUS_NUCHALIS  2.800619
CTENOPHORUS_ORNATUS   2.293010
CTENOPHORUS_PICTUS    2.240315
MiniAgamid <- rbind(FirstThreeAgamid, SixAgamids)
                               svl     tail     hdep      ljl      dtr       hw       nd
AMPHIBOLURUS_GILBERTI     4.667016 5.632123 2.740792 3.520543 3.269252 3.024502 2.008229
AMPHIBOLURUS_LONGIROSTRIS 4.672130 5.855474 2.743552 3.582616 3.350907 2.945374 2.056248
AMPHIBOLURUS_MURICATUS    4.449335 5.117994 2.522524 3.338494 3.089830 2.934920 2.000128
CTENOPHORUS_MACULATUS     3.961316 4.818961 1.887491 2.680544 2.471299 2.314906 1.471622
CTENOPHORUS_MACULOSUS     4.247702 4.605170 2.364686 2.986646 2.790952 2.748097 1.901645
CTENOPHORUS_MCKENZIEI     4.244249 5.122704 2.301180 3.000664 2.762611 2.604165 1.759475
CTENOPHORUS_NUCHALIS      4.687252 4.976937 2.744863 3.370964 3.069098 3.145831 2.046517
CTENOPHORUS_ORNATUS       4.452683 4.967190 2.284652 3.227807 2.968013 2.952711 1.924779
CTENOPHORUS_PICTUS        4.119734 4.709179 2.284880 2.906278 2.692608 2.618150 1.688154
                               hum      ant      man      di4      sha      cru      foo
AMPHIBOLURUS_GILBERTI     2.772972 2.654382 1.917737 2.312787 3.341844 3.310800 2.859357
AMPHIBOLURUS_LONGIROSTRIS 2.801243 2.618546 1.928268 2.422127 3.378553 3.269966 2.823432
AMPHIBOLURUS_MURICATUS    2.578195 2.287471 2.018009 2.102507 3.002708 2.835564 2.492103
CTENOPHORUS_MACULATUS     2.085670 1.958358 1.167062 1.675920 2.629032 2.703727 2.197440
CTENOPHORUS_MACULOSUS     2.326329 2.297442 1.680916 1.760559 2.807612 2.723981 2.277164
CTENOPHORUS_MCKENZIEI     2.351086 2.170528 1.420739 1.702743 3.012754 2.970260 2.451222
CTENOPHORUS_NUCHALIS      2.789872 2.667329 1.855825 2.056084 3.123657 3.108705 2.557639
CTENOPHORUS_ORNATUS       2.710866 2.363777 1.800908 2.029866 3.187879 3.176098 2.652998
CTENOPHORUS_PICTUS        2.288990 2.020490 1.316376 1.700047 2.771910 2.775580 2.232890
                               to4      wpg      dpg
AMPHIBOLURUS_GILBERTI     3.073737 2.857962 2.853618
AMPHIBOLURUS_LONGIROSTRIS 3.183384 2.772714 2.785964
AMPHIBOLURUS_MURICATUS    2.788093 2.823757 2.584752
CTENOPHORUS_MACULATUS     2.474648 2.253367 1.932621
CTENOPHORUS_MACULOSUS     2.249090 2.619377 2.423320
CTENOPHORUS_MCKENZIEI     2.636809 2.486723 2.355519
CTENOPHORUS_NUCHALIS      2.466862 3.031842 2.800619
CTENOPHORUS_ORNATUS       2.735101 2.713882 2.293010
CTENOPHORUS_PICTUS        2.351000 2.429160 2.240315
NamesOfAgamids <- rownames(MiniAgamid)
[1] "AMPHIBOLURUS_GILBERTI"     "AMPHIBOLURUS_LONGIROSTRIS" "AMPHIBOLURUS_MURICATUS"   
[4] "CTENOPHORUS_MACULATUS"     "CTENOPHORUS_MACULOSUS"     "CTENOPHORUS_MCKENZIEI"    
[7] "CTENOPHORUS_NUCHALIS"      "CTENOPHORUS_ORNATUS"       "CTENOPHORUS_PICTUS"

#7: Another trick: Look at the row names for the 58 agamid species in a data frame. These are the species names. We are going to make a reduced data frame that contains ONLY the species in the genus Ctenophorus. We will do this using the function grep. This function will be explored in much more detail later, but for now, all you need to know is that it is 'pattern matching' function. If you give it a vector of character strings and a "target string", it will return the index values of all elements that contain the target. For exmaple, suppose you want the row with data from the frilled dragon, Chlamydosaurus kingii. You could just do:

agamid['CHLAMYDOSAURUS_KINGII',]

#But this only works if you remember how to spell the species name exactly as it is. What if all you remember is 'kingii'? Then you can exploit the grep function as follows:

myindex <- grep('KINGII', rownames(agamid))
myindex
agamid[myindex,]

#See how this works? The grep function (look at help) finds a pattern within a particular target vector (in this case, the row name vector from the agamid data), and returns the index values of all the elements where the target is found.

#Use the grep function to make a new data frame with only species from the genus Ctenophorus. How many species are in the dataset from this genus?

myindex2 <- grep('CTENOPHORUS', rownames(agamid))
myindex2
Ctenophorus <- agamid[myindex2,]
CTENOPHORUS_CAUDICINCTUS 4.293436 5.053968 2.451461 3.150306 2.910316 2.839960 1.949369
CTENOPHORUS_CLAYI        3.889207 4.294190 2.049969 2.666327 2.494633 2.385030 1.570310
CTENOPHORUS_CRISTATUS    4.641589 5.390547 2.663856 3.341471 3.105947 2.971954 2.187839
CTENOPHORUS_DECRESII     4.360847 4.959040 2.418843 3.240499 3.007604 2.923833 1.981750
CTENOPHORUS_FEMORALIS    3.950360 4.997741 1.821294 2.618637 2.388304 2.265029 1.463621
CTENOPHORUS_FIONNI       4.377928 4.869803 2.427298 3.295538 2.998959 2.965870 1.975848
CTENOPHORUS_FORDI        3.877689 4.781407 1.906984 2.613685 2.403737 2.283757 1.497187
CTENOPHORUS_GIBBA        4.526038 4.916872 2.778697 3.316834 3.082249 3.078802 2.143967
CTENOPHORUS_ISOLEPIS     4.048229 4.846858 2.077576 2.797428 2.564660 2.452391 1.614191
CTENOPHORUS_MACULATUS    3.961316 4.818961 1.887491 2.680544 2.471299 2.314906 1.471622
CTENOPHORUS_MACULOSUS    4.247702 4.605170 2.364686 2.986646 2.790952 2.748097 1.901645
CTENOPHORUS_MCKENZIEI    4.244249 5.122704 2.301180 3.000664 2.762611 2.604165 1.759475
CTENOPHORUS_NUCHALIS     4.687252 4.976937 2.744863 3.370964 3.069098 3.145831 2.046517
CTENOPHORUS_ORNATUS      4.452683 4.967190 2.284652 3.227807 2.968013 2.952711 1.924779
CTENOPHORUS_PICTUS       4.119734 4.709179 2.284880 2.906278 2.692608 2.618150 1.688154
CTENOPHORUS_RETICULATUS  4.575179 5.035153 2.678855 3.308905 3.035431 3.110749 1.903521
CTENOPHORUS_RUBENS       4.190352 5.059420 2.250832 3.018425 2.795518 2.601265 1.735998
CTENOPHORUS_RUFESCENS    4.449822 5.281439 2.328531 3.195401 2.936804 2.863286 1.918510
CTENOPHORUS_SALINARUM    4.163605 4.643010 2.338533 2.985337 2.759102 2.697805 1.790331
CTENOPHORUS_SCUTULATUS   4.686268 5.557007 2.648164 3.379886 3.140734 2.981165 2.121715
CTENOPHORUS_TJANTJALKA   4.217276 5.012791 2.461662 3.113860 2.892884 2.854191 1.886761
CTENOPHORUS_VADNAPPA     4.332945 5.097753 2.417081 3.223812 2.973497 2.949442 1.973837
                              hum      ant      man      di4      sha      cru      foo
CTENOPHORUS_CAUDICINCTUS 2.537556 2.345064 1.651777 1.978109 3.068730 3.078208 2.569201
CTENOPHORUS_CLAYI        2.077466 1.925002 1.075526 1.459155 2.359434 2.403809 1.852808
CTENOPHORUS_CRISTATUS    2.844902 2.633020 1.853231 2.125643 3.440858 3.462961 2.960171
CTENOPHORUS_DECRESII     2.485770 2.365333 1.792970 1.937979 3.057372 2.986238 2.529301
CTENOPHORUS_FEMORALIS    2.089874 1.982394 0.964080 1.501176 2.713692 2.796891 2.192442
CTENOPHORUS_FIONNI       2.475845 2.304865 1.801856 2.190354 3.088854 3.059370 2.606304
CTENOPHORUS_FORDI        2.097260 1.920227 1.016958 1.576952 2.598467 2.690609 2.113987
CTENOPHORUS_GIBBA        2.703580 2.565560 1.882331 1.903746 3.206976 3.217639 2.719241
CTENOPHORUS_ISOLEPIS     2.302196 2.099532 1.204871 1.664202 2.819154 2.917666 2.325352
CTENOPHORUS_MACULATUS    2.085670 1.958358 1.167062 1.675920 2.629032 2.703727 2.197440
CTENOPHORUS_MACULOSUS    2.326329 2.297442 1.680916 1.760559 2.807612 2.723981 2.277164
CTENOPHORUS_MCKENZIEI    2.351086 2.170528 1.420739 1.702743 3.012754 2.970260 2.451222
CTENOPHORUS_NUCHALIS     2.789872 2.667329 1.855825 2.056084 3.123657 3.108705 2.557639
CTENOPHORUS_ORNATUS      2.710866 2.363777 1.800908 2.029866 3.187879 3.176098 2.652998
CTENOPHORUS_PICTUS       2.288990 2.020490 1.316376 1.700047 2.771910 2.775580 2.232890
CTENOPHORUS_RETICULATUS  2.725353 2.522782 1.815891 1.957272 3.044933 3.070462 2.475929
CTENOPHORUS_RUBENS       2.340063 2.209839 1.564038 1.670342 2.928537 3.025759 2.459477
CTENOPHORUS_RUFESCENS    2.625667 2.455135 1.905233 2.002568 3.282257 3.302015 2.772426
CTENOPHORUS_SALINARUM    2.353464 2.129078 1.446408 1.744795 2.729730 2.752700 2.180407
CTENOPHORUS_SCUTULATUS   2.828885 2.646909 1.848949 2.096171 3.361937 3.398625 2.857047
CTENOPHORUS_TJANTJALKA   2.444096 2.201482 1.635952 1.887091 3.027919 3.098600 2.545681
CTENOPHORUS_VADNAPPA     2.487359 2.325132 1.819329 1.956817 3.119464 3.156986 2.589541
                              to4      wpg      dpg
CTENOPHORUS_CAUDICINCTUS 2.699263 2.659731 2.547117
CTENOPHORUS_CLAYI        1.963624 2.178379 2.062522
CTENOPHORUS_CRISTATUS    3.121522 2.940500 2.805875
CTENOPHORUS_DECRESII     2.707490 2.774927 2.427955
CTENOPHORUS_FEMORALIS    2.567666 2.150197 1.803385
CTENOPHORUS_FIONNI       2.614363 2.900204 2.455205
CTENOPHORUS_FORDI        2.481981 2.174566 1.935124
CTENOPHORUS_GIBBA        2.635466 2.940383 2.781393
CTENOPHORUS_ISOLEPIS     2.652709 2.395502 2.121387
CTENOPHORUS_MACULATUS    2.474648 2.253367 1.932621
CTENOPHORUS_MACULOSUS    2.249090 2.619377 2.423320
CTENOPHORUS_MCKENZIEI    2.636809 2.486723 2.355519
CTENOPHORUS_NUCHALIS     2.466862 3.031842 2.800619
CTENOPHORUS_ORNATUS      2.735101 2.713882 2.293010
CTENOPHORUS_PICTUS       2.351000 2.429160 2.240315
CTENOPHORUS_RETICULATUS  2.494822 3.007532 2.721570
CTENOPHORUS_RUBENS       2.658623 2.547435 2.320346
CTENOPHORUS_RUFESCENS    2.862697 2.864219 2.338867
CTENOPHORUS_SALINARUM    2.361965 2.481992 2.318236
CTENOPHORUS_SCUTULATUS   2.989902 2.924174 2.788175
CTENOPHORUS_TJANTJALKA   2.643010 2.723399 2.441450
CTENOPHORUS_VADNAPPA     2.700910 2.793171 2.435782

#8: Make a second dataframe for the genus Diporiphora, just as you did for Ctenophorus. Write an expression that counts the number of Diporiphora species in the dataset.

myindex3 <- grep('DIPORIPHORA', rownames(agamid))
myindex3
DiporiphoraDatabase <- agamid[myindex3,]
DiporiphoraDatabase
DIPORIPHORA_ALBILABRIS 3.923623 4.691034 2.170838 2.884125 2.695312 2.470012 1.553623 2.151797
DIPORIPHORA_ARNHEMICA  4.093724 5.016814 2.173591 2.905079 2.718376 2.467646 1.707078 2.386572
DIPORIPHORA_AUSTRALIS  4.146900 5.105486 2.294622 2.940370 2.737711 2.537037 1.711987 2.418017
DIPORIPHORA_BENNETTII  4.201696 5.044535 2.371876 3.129877 2.937500 2.683093 1.812231 2.466490
DIPORIPHORA_BILINEATA  4.032160 4.980789 2.169109 2.851354 2.676792 2.430561 1.567402 2.251358
DIPORIPHORA_LALLIAE    4.224356 5.253502 2.274002 3.005990 2.825783 2.526106 1.762444 2.327614
DIPORIPHORA_LINGA      3.830470 4.672100 1.906278 2.645451 2.466113 2.258818 1.474992 2.089943
DIPORIPHORA_MAGNA      4.186550 5.040581 2.337949 3.055408 2.860207 2.601292 1.720204 2.418973
DIPORIPHORA_PINDAN     4.048849 5.010434 2.116187 2.823492 2.662117 2.396473 1.630658 2.283395
DIPORIPHORA_REGINAE    4.060071 4.968976 2.106261 2.795495 2.602306 2.374846 1.687949 2.202454
DIPORIPHORA_WINNECKEI  4.042240 5.027270 2.075797 2.772445 2.600949 2.303983 1.599729 2.244690
                            ant       man      di4      sha      cru      foo      to4
DIPORIPHORA_ALBILABRIS 2.036971 1.1115585 1.637592 2.459446 2.548999 2.066065 2.194477
DIPORIPHORA_ARNHEMICA  2.173880 1.2872374 1.755330 2.746803 2.780697 2.245323 2.446495
DIPORIPHORA_AUSTRALIS  2.275171 1.2969254 1.975330 2.731244 2.774766 2.282195 2.547881
DIPORIPHORA_BENNETTII  2.251292 1.2800785 1.877757 2.805004 2.789992 2.292873 2.520042
DIPORIPHORA_BILINEATA  2.048983 1.1339053 1.716848 2.547550 2.587986 2.090337 2.355668
DIPORIPHORA_LALLIAE    2.140573 1.3794193 1.963385 2.759900 2.752916 2.250762 2.493288
DIPORIPHORA_LINGA      1.944108 0.9674763 1.741084 2.332291 2.468413 1.836836 2.264955
DIPORIPHORA_MAGNA      2.200759 1.4175251 1.842102 2.710204 2.688807 2.183998 2.479345
DIPORIPHORA_PINDAN     2.062727 1.2297320 1.804692 2.525189 2.572645 2.066632 2.334041
DIPORIPHORA_REGINAE    2.001329 1.1742707 1.782363 2.476094 2.618413 2.116447 2.473191
DIPORIPHORA_WINNECKEI  2.057801 1.1708980 1.818872 2.495865 2.561288 2.046475 2.368720
                            wpg      dpg
DIPORIPHORA_ALBILABRIS 2.114274 2.222629
DIPORIPHORA_ARNHEMICA  2.262603 2.280619
DIPORIPHORA_AUSTRALIS  2.177549 2.186696
DIPORIPHORA_BENNETTII  2.442042 2.392861
DIPORIPHORA_BILINEATA  2.074147 2.122979
DIPORIPHORA_LALLIAE    2.347108 2.238110
DIPORIPHORA_LINGA      2.062150 1.934314
DIPORIPHORA_MAGNA      2.335918 2.334494
DIPORIPHORA_PINDAN     2.076746 2.044676
DIPORIPHORA_REGINAE    2.279461 2.177913
DIPORIPHORA_WINNECKEI  2.061174 2.053215
length(rownames(DiporiphoraDatabase))
[1] 11

#9: Morphometrics. We will do a "non-phylogenetic" analysis of the relationship between lizard snout vent length (svl) and femur length (variable named 'sha', for shank). Fit a simple linear model to sha as a function of svl for both the Ctenophorus and Diporiphora data.

fit1 <- lm(sha ~ svl, data = Ctenophorus)
fit1
Call:
lm(formula = sha ~ svl, data = Ctenophorus)

Coefficients:
(Intercept)          svl  
    -1.1589       0.9638  

fit2 <- lm(sha ~ svl, data = DiporiphoraDatabase)
fit2
Call:
lm(formula = sha ~ svl, data = DiporiphoraDatabase)

Coefficients:
(Intercept)          svl  
     -2.265        1.195

#10: You can set up a 2 panel plot using the graphical parameter par(mfrow = c(2,1)). Do this.

par(mfrow = c(2,1))

#Plot sha as a function of svl for Ctenophorus, then add the fitted regression line. Then, without closing your plot window, add a second plot for the Diporophora data and also add the fitted line. When you have figured out how to do this, make sure that both plots have exactly the same x and y axes, so they can be compared visually. You can do this with the xlim and ylim graphical parameters, which are arguments that go to the plot function.

par(mfrow = c(2,1))
plot(sha ~ svl, data = Ctenophorus, xlim= c(3.5, 4.7), ylim = c(2, 3.5))
abline(fit1)
plot(sha ~ svl, data = DiporiphoraDatabase, xlim= c(3.5, 4.7), ylim = c(2, 3.5))
abline(fit2)

#11: How many agamid species have an svl greater than 4.5? 

FirstAgamidEnquiry <- agamid[agamid$svl > 4.5,]
FirstAgamidEnquiry
length(rownames(FirstAgamidEnquiry))
#[1] 18
#How many have an svl greater than 4.5 and a tail length greater than 5.25? 
SecondAgamidEnquiry <- agamid[agamid$svl > 4.5 & agamid$tail > 5.25,]
SecondAgamidEnquiry
length(rownames(SecondAgamidEnquiry))
#[1] 13
#How many have an svl greater than 4.5 OR a tail length greater than 5.25?
ThirdAgamidEnquiry <- agamid[agamid$svl > 4.5 | agamid$tail > 5.25,]
ThirdAgamidEnquiry
length(rownames(ThirdAgamidEnquiry))
#[1] 20

#12: Compute the mean, median, and standard deviation (functions mean, median, sd) for the first two columns of the Ctenophorus data frame. What variables are these (extract the names of the variables using R code!) ?

colnames(Ctenophorus[,c(1,2)])
#[1] "svl"  "tail"
mean(Ctenophorus$svl)
#[1] 4.286078
median(Ctenophorus$svl)
#[1] 4.270569
sd(Ctenophorus$svl)
#[1] 0.2505531
mean(Ctenophorus$tail)
#[1] 4.954415
median(Ctenophorus$tail)
#[1] 4.972064
sd(Ctenophorus$tail)
#[1] 0.2695651

#13: Compute the mean, median, and standard deviation (functions, mean, median, sd) for columns 3, 6, and 7 of the Diporiphora data frame. What variables are these?

colnames(DiporiphoraDatabase[,c(3,6,7)])
#[1] "hdep" "hw"   "nd"  
mean(DiporiphoraDatabase$hdep)
#[1] 2.181501
median(DiporiphoraDatabase$hdep)
#[1] 2.170838
sd(DiporiphoraDatabase$hdep)
#[1] 0.1338839
mean(DiporiphoraDatabase$hw)
#[1] 2.459079
median(DiporiphoraDatabase$hw)
#[1] 2.467646
sd(DiporiphoraDatabase$hw)
#[1] 0.1253622
mean(DiporiphoraDatabase$nd)
#[1] 1.657118
median(DiporiphoraDatabase$nd)
#[1] 1.687949
sd(DiporiphoraDatabase$nd)
#[1] 0.1007544

#14: Write a line of code that pulls out ONLY the name of the species with the largest svl:

rownames(agamid[max(agamid$svl),])
#[1] "AMPHIBOLURUS_NORRISI"
#Do it again for the species with the smallest svl:

rownames(agamid[min(agamid$svl),])
#[1] "AMPHIBOLURUS_MURICATUS"

#15: First, use what you know about vector operations to make a new vector that contains the UNLOGGED svl's for all agamid species (to reverse a log transformation, you use the exp function). Call this new vector 'svl_unlogged'. Now, make a new dataframe by "binding" this vector to the agamids dataframe. This is a column vector, and you can make a new data frame with the function cbind. Look at the first 5 rows of your new data frame. How does it look? Did it work? Finally, in one line of code, create a new data frame of all rows where the unlogged svl is within 120 mm of the MAX value. How many species are in this?

svl_unlogged <- exp(agamid$svl)
agamid2 <- cbind(agamid,svl_unlogged)
head(agamid2) #This looks fine, we now have added the svl_unlogged column to the end!
agamid2subset <- agamid2[max(agamid2$svl_unlogged) >= agamid2$svl_unlogged & agamid2$svl_unlogged >= (max(agamid2$svl_unlogged)-120),]
                               svl     tail     hdep      ljl      dtr       hw       nd
AMPHIBOLURUS_GILBERTI     4.667016 5.632123 2.740792 3.520543 3.269252 3.024502 2.008229
AMPHIBOLURUS_LONGIROSTRIS 4.672130 5.855474 2.743552 3.582616 3.350907 2.945374 2.056248
CHLAMYDOSAURUS_KINGII     5.394144 6.063515 3.515359 4.155716 3.891960 3.839019 2.679375
CTENOPHORUS_CRISTATUS     4.641589 5.390547 2.663856 3.341471 3.105947 2.971954 2.187839
CTENOPHORUS_NUCHALIS      4.687252 4.976937 2.744863 3.370964 3.069098 3.145831 2.046517
CTENOPHORUS_SCUTULATUS    4.686268 5.557007 2.648164 3.379886 3.140734 2.981165 2.121715
POGONA_BARBATA            5.214067 5.509397 3.228738 4.066537 3.726675 3.746980 2.492938
POGONA_HENRYLAWSONI       4.653960 5.416100 2.824944 3.566900 3.312245 3.168985 2.172097
POGONA_MINIMA             4.619464 5.353305 2.704491 3.391995 3.215767 3.081015 2.146426
POGONA_MINOR              4.757670 5.368339 2.901626 3.617481 3.397170 3.318046 2.305948
POGONA_MINOR_MITCHELLI    4.943233 5.461203 3.162477 3.840135 3.583951 3.623326 2.462682
POGONA_NULLARBOR          4.728759 5.060197 2.871695 3.574075 3.298543 3.314366 2.306705
POGONA_VITTICEPS          5.175813 5.416861 3.365197 3.997037 3.704399 3.841594 2.580922
                               hum      ant      man      di4      sha      cru      foo
AMPHIBOLURUS_GILBERTI     2.772972 2.654382 1.917737 2.312787 3.341844 3.310800 2.859357
AMPHIBOLURUS_LONGIROSTRIS 2.801243 2.618546 1.928268 2.422127 3.378553 3.269966 2.823432
CHLAMYDOSAURUS_KINGII     3.659244 3.503408 2.800005 3.108204 4.060364 4.004054 3.523177
CTENOPHORUS_CRISTATUS     2.844902 2.633020 1.853231 2.125643 3.440858 3.462961 2.960171
CTENOPHORUS_NUCHALIS      2.789872 2.667329 1.855825 2.056084 3.123657 3.108705 2.557639
CTENOPHORUS_SCUTULATUS    2.828885 2.646909 1.848949 2.096171 3.361937 3.398625 2.857047
POGONA_BARBATA            3.373724 3.213440 2.615574 2.728729 3.508098 3.430118 2.902374
POGONA_HENRYLAWSONI       3.051325 2.923878 1.948763 2.579964 3.277899 3.236061 2.635241
POGONA_MINIMA             3.000396 2.696430 2.011783 2.442570 3.188205 3.163759 2.625222
POGONA_MINOR              2.996091 2.782919 1.998089 2.356346 3.182786 3.154821 2.597645
POGONA_MINOR_MITCHELLI    3.149981 2.949779 2.055104 2.442423 3.325351 3.297467 2.664733
POGONA_NULLARBOR          3.010236 2.760896 2.007215 2.249238 3.234739 3.162365 2.532195
POGONA_VITTICEPS          3.457700 3.215970 2.402508 2.668533 3.583004 3.553482 2.994638
                               to4      wpg      dpg svl_unlogged
AMPHIBOLURUS_GILBERTI     3.073737 2.857962 2.853618     106.3799
AMPHIBOLURUS_LONGIROSTRIS 3.183384 2.772714 2.785964     106.9253
CHLAMYDOSAURUS_KINGII     3.409872 3.573674 3.754041     220.1136
CTENOPHORUS_CRISTATUS     3.121522 2.940500 2.805875     103.7090
CTENOPHORUS_NUCHALIS      2.466862 3.031842 2.800619     108.5545
CTENOPHORUS_SCUTULATUS    2.989902 2.924174 2.788175     108.4477
POGONA_BARBATA            2.999274 3.601575 3.200009     183.8402
POGONA_HENRYLAWSONI       2.906172 3.059646 2.904348     105.0000
POGONA_MINIMA             2.908328 2.903672 2.818976     101.4396
POGONA_MINOR              2.713755 3.068528 2.880950     116.4742
POGONA_MINOR_MITCHELLI    2.701434 3.276861 3.214070     140.2229
POGONA_NULLARBOR          2.600195 3.208730 2.902283     113.1550
POGONA_VITTICEPS          2.971930 3.563859 3.383644     176.9404
length(rownames(agamid2subset))
[1] 13

#16: Read the dataframe 'biogeography.csv'. This contains 2 columns, including species names and an integer code corresponding to the geographic regions in which they are located. Use the sum trick on a logical vector to count the number of species in region 0. Then count the number that are not found in region 1. And another line of code to count the number of species NOT found in EITHER region 2 or region 3!

biogeography <- read.table('biogeography.csv',header = TRUE, sep = ',')
biogeography
Region0 <- biogeography$region == 0
sum(Region0)
#[1] 49
NotRegion1 <- biogeography$region != 1
sum(NotRegion1)
#[1] 149
NotRegion2AndRegion3 <- biogeography$region != 2 & biogeography$region != 3
sum(NotRegion2AndRegion3)
#[1] 171
















































