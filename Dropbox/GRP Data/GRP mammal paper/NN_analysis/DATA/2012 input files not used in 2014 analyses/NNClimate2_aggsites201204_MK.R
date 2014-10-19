## Goal: load in climate and DEM MCP's for each region, extract values and conduct nearest-neighbor analysis
##modified from Morgan!
#edited to add in extremes for final analysis; trial for with and without resampling DEM's; models?

## Libraries
library(foreign)
library(dismo)
library(maptools)

## Data Load
#setwd("C:/GrinnellResurveyPrj/Rowe_models/NN_analysis")
#data<-read.csv("DataExport_031110.csv",header=T) 
#covars<-read.csv("Covars.csv",header=T)
#zone<-read.csv("LifeZones.csv")

setwd("C:\\Users\\MKoo\\Dropbox\\GRP\\NNanalysis\\asc_inputs");

projAlbers <- CRS("+proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +x_0=0 +y_0=-4000000 +datum=NAD83 +units=m +no_defs")

bio1_LA0<-raster("la_h_bio_1.asc", proj4string=projAlbers)
bio12_LA0<-raster("la_h_bio_12.asc", proj4string=projAlbers)
bio1_LA1<-raster("la_c_bio_1.asc", proj4string=projAlbers)
bio12_LA1<-raster("la_c_bio_12.asc", proj4string=projAlbers)
#dem_LA<-raster("la_dem1k.asc", crs="+proj=aea +datum=NAD83")
dem_LA<-raster("la_demsrtm30.asc", proj4string=projAlbers);
bio1_YO0<-raster("yo_h_bio_1.asc", proj4string=projAlbers)
bio12_YO0<-raster("yo_h_bio_12.asc", proj4string=projAlbers)
bio1_YO1<-raster("yo_c_bio_1.asc", proj4string=projAlbers)
bio12_YO1<-raster("yo_c_bio_12.asc", proj4string=projAlbers)
#dem_YO<-raster("yo_dem1k.asc", crs="+proj=aea +datum=NAD83")
dem_YO<-raster("yo_demsrtm30.asc", proj4string=projAlbers);
bio1_SS0<-raster("ss_h_bio_1.asc", proj4string=projAlbers)
bio12_SS0<-raster("ss_h_bio_12.asc", proj4string=projAlbers)
bio1_SS1<-raster("ss_c_bio_1.asc", proj4string=projAlbers)
bio12_SS1<-raster("ss_c_bio_12.asc", proj4string=projAlbers)
#dem_SS<-raster("ss_dem1k.asc", crs="+proj=aea +datum=NAD83")
dem_SS<-raster("ss_demsrtm30.asc", proj4string=projAlbers)
#add in extremes;check units
bio5_LA0<-raster("la_h_bio_5.asc", proj4string=projAlbers)
bio6_LA0<-raster("la_h_bio_6.asc", proj4string=projAlbers)
bio5_LA1<-raster("la_c_bio_5.asc", proj4string=projAlbers)
bio6_LA1<-raster("la_c_bio_6.asc", proj4string=projAlbers)
bio5_SS0<-raster("ss_h_bio_5.asc", proj4string=projAlbers)
bio6_SS0<-raster("ss_h_bio_6.asc", proj4string=projAlbers)
bio5_SS1<-raster("ss_c_bio_5.asc", proj4string=projAlbers)
bio6_SS1<-raster("ss_c_bio_6.asc", proj4string=projAlbers)
bio5_YO0<-raster("yo_h_bio_5.asc", proj4string=projAlbers)
bio6_YO0<-raster("yo_h_bio_6.asc", proj4string=projAlbers)
bio5_YO1<-raster("yo_c_bio_5.asc", proj4string=projAlbers)
bio6_YO1<-raster("yo_c_bio_6.asc", proj4string=projAlbers)


#sites<-read.table("Allsites_GRP_20110225_BIO1-124R.txt",header=T);
unqsites<-read.table("unq_aggsites_ebc_20120326.csv", header=T, sep=",");

#layo_ext<-extent(c(-210223.6,198727,-318620.2,344898.1))
#plot(layo_ext)
#plot(bio1_LA0,add=T)
#plot(bio1_YO0,add=T)
#plot(bio1_SS0,add=T)

############ SITE-SPECIFIC NEAREST NEIGHBORS ########################

eucl<-function(x0,y0,x1,y1) {sqrt((x0-x1)^2+(y0-y1)^2)}

YO_points<-unqsites[which(unqsites$REGION=="YO"),];
#YO_points<-sites[which(sites$REGION=="YO"),] 
b1_YO0<-getValues(bio1_YO0)
b1_YO1<-getValues(bio1_YO1)
b12_YO0<-getValues(bio12_YO0)
b12_YO1<-getValues(bio12_YO1);
b5_YO0<-getValues(bio5_YO0);
b5_YO1<-getValues(bio5_YO1);
b6_YO0<-getValues(bio6_YO0);
b6_YO1<-getValues(bio6_YO1);

dem2_YO<-resample(x=dem_YO,y=bio1_YO1,method="ngb",filename="demYO.grd", format="raster",progress="text",overwrite=T) #resample DEM to resolution of climate
elev_YO<-getValues(dem2_YO)
#elev_YO<-getValues(dem_YO);

## For each survey site, find the average elevation difference of closest 5%
YO_coords<-xyFromCell(bio1_YO0,1:length(b1_YO0)) # find X-Y values for all YO cells
YOi<-which(is.na(b1_YO0*elev_YO)==F) #index of cells with valid dem & climate values
YO_avg_b1<-rep(NA,length(YO_points[,1]))
YO_avg_b12<-rep(NA,length(YO_points[,1]))
YO_avg_b5<-rep(NA,length(YO_points[,1]))
YO_avg_b6<-rep(NA,length(YO_points[,1]))

for(i in 1:length(YO_avg_b1)) {
	b1_pts<-order(abs(b1_YO1-YO_points[i,13]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio1
	YO_avg_b1[i]<-mean(elev_YO[b1_pts],na.rm=T)	
	b12_pts<-order(abs(b12_YO1-YO_points[i,15]))[1:(0.05*round(length(YOi)))] #hist_bio12
	YO_avg_b12[i]<-mean(elev_YO[b12_pts],na.rm=T)
	b5_pts<-order(abs(b5_YO1-YO_points[i,17]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio5-- check colnumber
	YO_avg_b5[i]<-mean(elev_YO[b5_pts],na.rm=T)	
	b6_pts<-order(abs(b6_YO1-YO_points[i,19]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio6-- check colnumber
	YO_avg_b6[i]<-mean(elev_YO[b6_pts],na.rm=T)	
	}

##
## Repeat for Lassen and SSierra
LA_points<-unqsites[which(unqsites$REGION=="LA"),] 
#LA_points<-sites[which(sites$REGION=="LA"),] 
b1_LA0<-getValues(bio1_LA0)
b1_LA1<-getValues(bio1_LA1)
b12_LA0<-getValues(bio12_LA0)
b12_LA1<-getValues(bio12_LA1)
b5_LA0<-getValues(bio5_LA0)
b5_LA1<-getValues(bio5_LA1)
b6_LA0<-getValues(bio6_LA0)
b6_LA1<-getValues(bio6_LA1)

dem2_LA<-resample(x=dem_LA,y=bio1_LA1,method="ngb",filename="demLA.grd",format="raster",progress="text",overwrite=T) 
elev_LA<-getValues(dem2_LA)
#elev_LA<-getValues(dem_LA)
LA_coords<-xyFromCell(bio1_LA0,1:length(b1_LA0)) 
LAi<-which(is.na(b1_LA0*elev_LA)==F) 
LA_avg_b1<-rep(NA,length(LA_points[,1]))
LA_avg_b12<-rep(NA,length(LA_points[,1]))
LA_avg_b5<-rep(NA,length(LA_points[,1]))
LA_avg_b6<-rep(NA,length(LA_points[,1]))

for(i in 1:length(LA_avg_b1)) {
	b1_pts<-order(abs(b1_LA1-LA_points[i,13]))[1:(0.05*round(length(LAi)))] 
	LA_avg_b1[i]<-mean(elev_LA[b1_pts],na.rm=T)	
	b12_pts<-order(abs(b12_LA1-LA_points[i,15]))[1:(0.05*round(length(LAi)))]
	LA_avg_b12[i]<-mean(elev_LA[b12_pts],na.rm=T)
	b5_pts<-order(abs(b5_LA1-LA_points[i,17]))[1:(0.05*round(length(LAi)))] 
	LA_avg_b5[i]<-mean(elev_LA[b5_pts],na.rm=T)
	b6_pts<-order(abs(b6_LA1-LA_points[i,19]))[1:(0.05*round(length(LAi)))] 
	LA_avg_b6[i]<-mean(elev_LA[b6_pts],na.rm=T)
	}
	
SS_points<-unqsites[which(unqsites$REGION=="SS"),] 
#SS_points<-sites[which(sites$REGION=="SS"),] 
b1_SS0<-getValues(bio1_SS0)
b1_SS1<-getValues(bio1_SS1)
b12_SS0<-getValues(bio12_SS0)
b12_SS1<-getValues(bio12_SS1)
b5_SS0<-getValues(bio5_SS0)
b5_SS1<-getValues(bio5_SS1)
b6_SS0<-getValues(bio6_SS0)
b6_SS1<-getValues(bio6_SS1)

dem2_SS<-resample(x=dem_SS,y=bio1_SS1,method="ngb",filename="demSS.grd", format="raster",progress="text",overwrite=T) 
elev_SS<-getValues(dem2_SS)
#elev_SS<-getValues(dem_SS)

SS_coords<-xyFromCell(bio1_SS0,1:length(b1_SS0)) 
SSi<-which(is.na(b1_SS0*elev_SS)==F) 
SS_avg_b1<-rep(NA,length(SS_points[,1]))
SS_avg_b12<-rep(NA,length(SS_points[,1]))
SS_avg_b5<-rep(NA,length(SS_points[,1]))
SS_avg_b6<-rep(NA,length(SS_points[,1]))

for(i in 1:length(SS_avg_b1)) {
	b1_pts<-order(abs(b1_SS1-SS_points[i,13]))[1:(0.05*round(length(SSi)))] 
	SS_avg_b1[i]<-mean(elev_SS[b1_pts],na.rm=T)	
	b12_pts<-order(abs(b12_SS1-SS_points[i,15]))[1:(0.05*round(length(SSi)))]
	SS_avg_b12[i]<-mean(elev_SS[b12_pts],na.rm=T)
	b5_pts<-order(abs(b5_SS1-SS_points[i,17]))[1:(0.05*round(length(SSi)))] 
	SS_avg_b5[i]<-mean(elev_SS[b5_pts],na.rm=T)	
	b6_pts<-order(abs(b6_SS1-SS_points[i,19]))[1:(0.05*round(length(SSi)))] 
	SS_avg_b6[i]<-mean(elev_SS[b6_pts],na.rm=T)	
	}

neighbor_export<-unqsites
neighbor_export$nr_elv_b1<-c(YO_avg_b1,LA_avg_b1,SS_avg_b1)
neighbor_export$nr_elv_b12<-c(YO_avg_b12,LA_avg_b12,SS_avg_b12)
neighbor_export$nr_elv_b5<-c(YO_avg_b5,LA_avg_b5,SS_avg_b5)
neighbor_export$nr_elv_b6<-c(YO_avg_b6,LA_avg_b6,SS_avg_b6)

##This creates an exportable table that has the avg elevation of the 5% nearest neighbors (within each region) for each survey site

write.table(neighbor_export,"new_nn_elv_20120409.csv", sep=",", row.names=F);



#################### GRID-WIDE NEAREST NEIGHBORS ##################

## Calc nearest neighbors for every grid cell in each region
YO_all_b1<-rep(NA,length(YOi))
YO_all_b12<-rep(NA,length(YOi))
YO_all_b5<-rep(NA,length(YOi))
YO_all_b6<-rep(NA,length(YOi))
for(i in 1:length(YO_all_b1)) {
	b1_pts<-order(abs(b1_YO1-b1_YO0[YOi[i]]))[1:(0.05*round(length(YOi)))]
	YO_all_b1[i]<-mean(elev_YO[b1_pts],na.rm=T)
	b12_pts<-order(abs(b12_YO1-b12_YO0[YOi[i]]))[1:(0.05*round(length(YOi)))]
	YO_all_b12[i]<-mean(elev_YO[b12_pts],na.rm=T)
  b5_pts<-order(abs(b5_YO1-b5_YO0[YOi[i]]))[1:(0.05*round(length(YOi)))]
  YO_all_b5[i]<-mean(elev_YO[b5_pts],na.rm=T)
  b6_pts<-order(abs(b6_YO1-b6_YO0[YOi[i]]))[1:(0.05*round(length(YOi)))]
  YO_all_b6[i]<-mean(elev_YO[b6_pts],na.rm=T)
	}
delta_YO_b1<-YO_all_b1-elev_YO[YOi]
delta_YO_b12<-YO_all_b12-elev_YO[YOi]
delta_YO_b5<-YO_all_b5-elev_YO[YOi]
delta_YO_b6<-YO_all_b6-elev_YO[YOi]

LA_all_b1<-rep(NA,length(LAi))
LA_all_b12<-rep(NA,length(LAi))
LA_all_b5<-rep(NA,length(LAi))
LA_all_b6<-rep(NA,length(LAi))

for(i in 1:length(LA_all_b1)) {
	b1_pts<-order(abs(b1_LA1-b1_LA0[LAi[i]]))[1:(0.05*round(length(LAi)))]
	LA_all_b1[i]<-mean(elev_LA[b1_pts],na.rm=T)
	b12_pts<-order(abs(b12_LA1-b12_LA0[LAi[i]]))[1:(0.05*round(length(LAi)))]
	LA_all_b12[i]<-mean(elev_LA[b12_pts],na.rm=T)
	b5_pts<-order(abs(b5_LA1-b5_LA0[LAi[i]]))[1:(0.05*round(length(LAi)))]
	LA_all_b5[i]<-mean(elev_LA[b5_pts],na.rm=T)
	b6_pts<-order(abs(b6_LA1-b6_LA0[LAi[i]]))[1:(0.05*round(length(LAi)))]
	LA_all_b6[i]<-mean(elev_LA[b6_pts],na.rm=T)
	
	}
delta_LA_b1<-LA_all_b1-elev_LA[LAi]
delta_LA_b12<-LA_all_b12-elev_LA[LAi]
delta_LA_b5<-LA_all_b5-elev_LA[LAi]
delta_LA_b6<-LA_all_b6-elev_LA[LAi]

SS_all_b1<-rep(NA,length(SSi))
SS_all_b12<-rep(NA,length(SSi))
SS_all_b5<-rep(NA,length(SSi))
SS_all_b6<-rep(NA,length(SSi))
for(i in 1:length(SS_all_b1)) {
	b1_pts<-order(abs(b1_SS1-b1_SS0[SSi[i]]))[1:(0.05*round(length(SSi)))]
	SS_all_b1[i]<-mean(elev_SS[b1_pts],na.rm=T)
	b12_pts<-order(abs(b12_SS1-b12_SS0[SSi[i]]))[1:(0.05*round(length(SSi)))]
	SS_all_b12[i]<-mean(elev_SS[b12_pts],na.rm=T)
	b5_pts<-order(abs(b5_SS1-b5_SS0[SSi[i]]))[1:(0.05*round(length(SSi)))]
	SS_all_b5[i]<-mean(elev_SS[b5_pts],na.rm=T)
	b6_pts<-order(abs(b6_SS1-b6_SS0[SSi[i]]))[1:(0.05*round(length(SSi)))]
	SS_all_b6[i]<-mean(elev_SS[b6_pts],na.rm=T)
	
	}
delta_SS_b1<-SS_all_b1-elev_SS[SSi]
delta_SS_b12<-SS_all_b12-elev_SS[SSi]
delta_SS_b5<-SS_all_b5-elev_SS[SSi]
delta_SS_b6<-SS_all_b6-elev_SS[SSi]

## Stick values back into rasters
YO_empty<-bio1_YO0
YO_empty_val<-rep(NA,prod(dim(bio1_YO0)))
values(YO_empty)<-YO_empty_val
YOgr_del_b1<-YO_empty
YOgr_del_b12<-YO_empty
YOgr_del_b5<-YO_empty
YOgr_del_b6<-YO_empty

YOgr_sign_b1<-YO_empty
YOgr_sign_b12<-YO_empty
YOgr_sign_b5<-YO_empty
YOgr_sign_b6<-YO_empty

YO_val_delb1<-YO_empty_val
YO_val_delb12<-YO_empty_val
YO_val_delb5<-YO_empty_val
YO_val_delb6<-YO_empty_val

YO_val_snb1<-YO_empty_val
YO_val_snb12<-YO_empty_val
YO_val_snb5<-YO_empty_val
YO_val_snb6<-YO_empty_val

YO_val_delb1[YOi]<-delta_YO_b1
values(YOgr_del_b1)<-YO_val_delb1
YO_val_delb12[YOi]<-delta_YO_b12
values(YOgr_del_b12)<-YO_val_delb12
YO_val_delb5[YOi]<-delta_YO_b5
values(YOgr_del_b5)<-YO_val_delb5
YO_val_delb6[YOi]<-delta_YO_b6
values(YOgr_del_b6)<-YO_val_delb6

YO_val_snb1[YOi]<-sign(delta_YO_b1)
values(YOgr_sign_b1)<-YO_val_snb1
YO_val_snb12[YOi]<-sign(delta_YO_b12)
values(YOgr_sign_b12)<-YO_val_snb12
YO_val_snb5[YOi]<-sign(delta_YO_b5)
values(YOgr_sign_b5)<-YO_val_snb5
YO_val_snb6[YOi]<-sign(delta_YO_b6)
values(YOgr_sign_b6)<-YO_val_snb6
#
LA_empty<-bio1_LA0
LA_empty_val<-rep(NA,prod(dim(bio1_LA0)))
values(LA_empty)<-LA_empty_val
LAgr_del_b1<-LA_empty
LAgr_del_b12<-LA_empty
LAgr_del_b5<-LA_empty
LAgr_del_b6<-LA_empty

LAgr_sign_b1<-LA_empty
LAgr_sign_b12<-LA_empty
LAgr_sign_b5<-LA_empty
LAgr_sign_b6<-LA_empty

LA_val_delb1<-LA_empty_val
LA_val_delb12<-LA_empty_val
LA_val_delb5<-LA_empty_val
LA_val_delb6<-LA_empty_val

LA_val_snb1<-LA_empty_val
LA_val_snb12<-LA_empty_val
LA_val_snb5<-LA_empty_val
LA_val_snb6<-LA_empty_val

LA_val_delb1[LAi]<-delta_LA_b1
values(LAgr_del_b1)<-LA_val_delb1
LA_val_delb12[LAi]<-delta_LA_b12
values(LAgr_del_b12)<-LA_val_delb12
LA_val_delb5[LAi]<-delta_LA_b5
values(LAgr_del_b5)<-LA_val_delb5
LA_val_delb6[LAi]<-delta_LA_b6
values(LAgr_del_b6)<-LA_val_delb6

LA_val_snb1[LAi]<-sign(delta_LA_b1)
values(LAgr_sign_b1)<-LA_val_snb1
LA_val_snb12[LAi]<-sign(delta_LA_b12)
values(LAgr_sign_b12)<-LA_val_snb12
LA_val_snb5[LAi]<-sign(delta_LA_b5)
values(LAgr_sign_b5)<-LA_val_snb5
LA_val_snb6[LAi]<-sign(delta_LA_b6)
values(LAgr_sign_b6)<-LA_val_snb6
#
SS_empty<-bio1_SS0
SS_empty_val<-rep(NA,prod(dim(bio1_SS0)))
values(SS_empty)<-SS_empty_val
SSgr_del_b1<-SS_empty
SSgr_del_b12<-SS_empty
SSgr_del_b5<-SS_empty
SSgr_del_b6<-SS_empty

SSgr_sign_b1<-SS_empty
SSgr_sign_b12<-SS_empty
SSgr_sign_b5<-SS_empty
SSgr_sign_b6<-SS_empty

SS_val_delb1<-SS_empty_val
SS_val_delb12<-SS_empty_val
SS_val_delb5<-SS_empty_val
SS_val_delb6<-SS_empty_val

SS_val_snb1<-SS_empty_val
SS_val_snb12<-SS_empty_val
SS_val_snb5<-SS_empty_val
SS_val_snb6<-SS_empty_val

SS_val_delb1[SSi]<-delta_SS_b1
values(SSgr_del_b1)<-SS_val_delb1
SS_val_delb12[SSi]<-delta_SS_b12
values(SSgr_del_b12)<-SS_val_delb12
SS_val_delb5[SSi]<-delta_SS_b5
values(SSgr_del_b5)<-SS_val_delb5
SS_val_delb6[SSi]<-delta_SS_b6
values(SSgr_del_b6)<-SS_val_delb6

SS_val_snb1[SSi]<-sign(delta_SS_b1)
values(SSgr_sign_b1)<-SS_val_snb1
SS_val_snb12[SSi]<-sign(delta_SS_b12)
values(SSgr_sign_b12)<-SS_val_snb12
SS_val_snb5[SSi]<-sign(delta_SS_b5)
values(SSgr_sign_b5)<-SS_val_snb5
SS_val_snb6[SSi]<-sign(delta_SS_b6)
values(SSgr_sign_b6)<-SS_val_snb6

### Plot on elevation
#quartz(file="ExpectNeighborMaps.png",type="png",width=7.5,height=10,dpi=288,bg="white") #on MacOS
#win.metafile(file="ExpectNeighborMaps.emf",width=7.5,height=10,restoreConsole=TRUE) #PC
png(file="ExpectNeighborMaps.png",width=750,height=1000) #PC

####Draw figure
la_demshd<-raster("a_la_demsrtm30shd.tif", crs="+proj=aea +datum=NAD83");
yo_demshd<-raster("a_yo_demsrtm30shd.tif", crs="+proj=aea +datum=NAD83");
ss_demshd<-raster("a_ss_demsrtm30shd.tif", crs="+proj=aea +datum=NAD83");

par(bg="white",mfrow=c(3,2),mar=c(1,1,4,1))
plot(dem_LA,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(a) Temperature (northern)",alpha=1);
plot(la_demshd,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(a) Temperature (northern)",alpha=1);
plot(LAgr_sign_b1,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(unqsites[which(unqsites$REGION=="LA"),4],unqsites[which(unqsites$REGION=="LA"),5],pch=19,cex=0.6,col="black");
points(LA_points$X, LA_points$Y,pch=19,cex=0.8,col="black");
legend("topleft", c("higher elv","lower elv"), fill=c("darkblue","darkred")) 

plot(dem_LA,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(b) Precipitation (northern)",alpha=1)
plot(LAgr_sign_b12,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(LA_points[,7],LA_points[,8],pch=16,cex=0.8,col="black")
points(LA_points$X, LA_points$Y,pch=19,cex=0.8,col="black");

plot(dem_LA,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(c) Max Temperature (northern)",alpha=1)
plot(LAgr_sign_b5,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(unqsites[which(unqsites$REGION=="LA"),4],unqsites[which(unqsites$REGION=="LA"),5],pch=19,cex=0.6,col="black");
points(LA_points$X, LA_points$Y,pch=19,cex=0.8,col="black");
legend("topleft", c("higher elv","lower elv"), fill=c("darkblue","darkred")) 

plot(dem_LA,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(d) Min Temperature (northern)",alpha=1)
plot(LAgr_sign_b6,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(unqsites[which(unqsites$REGION=="LA"),4],unqsites[which(unqsites$REGION=="LA"),5],pch=19,cex=0.6,col="black");
points(LA_points$X, LA_points$Y,pch=19,cex=0.8,col="black");
legend("topleft", c("higher elv","lower elv"), fill=c("darkblue","darkred")) 


########################
plot(dem_YO,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(c) Temperature (central)",alpha=1)
plot(YOgr_sign_b1,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(YO_points[,7],YO_points[,8],pch=16,cex=0.8,col="black")
points(sites[,7],sites[,8],pch=19,cex=0.8,col="black")

plot(dem_YO,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(d) Precipitation (central)",alpha=1)
plot(YOgr_sign_b12,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(YO_points[,7],YO_points[,8],pch=16,cex=0.8,col="black")
points(sites[,7],sites[,8],pch=19,cex=0.8,col="black")

plot(dem_SS,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(e) Temperature (southern)",alpha=1)
plot(SSgr_sign_b1,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(SS_points[,7],SS_points[,8],pch=16,cex=0.8,col="black")
points(sites[,7],sites[,8],pch=19,cex=0.8,col="black")

plot(dem_SS,col=rev(gray(seq(0.2,0.9,length.out=50))),legend=F,axes=F,main="(f) Precipitation (southern)",alpha=1)
plot(SSgr_sign_b12,col=c("#FF000040","#0000FF40"),add=T,legend=F)
#points(SS_points[,7],SS_points[,8],pch=16,cex=0.8,col="black")
points(sites[,7],sites[,8],pch=19,cex=0.8,col="black")

legend("bottomright", c("higher elv","lower elv"), fill=c("darkblue","darkred")) 

dev.off()

