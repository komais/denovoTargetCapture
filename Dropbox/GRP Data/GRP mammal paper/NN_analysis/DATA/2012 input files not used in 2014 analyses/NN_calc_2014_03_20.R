## Goal: load in climate and DEM MCP's for each region, extract values and conduct nearest-neighbor analysis
## Edited 03-20-2014 in response to downslope shifts in Yosemite due to no-analogue climates/micro-refugia. 
## Now modeling where micro-refugia occur.
## Non-analogue based only 50% within 1°C or 10 cm precip

#edited by Karen Rowe - Yosemite bioclim data was reextracted from the original WNA bioclim layers because of resolution differences between bio05/06 and bio01/12 - changes only made to input .asc files to ensure the correct ones are loaded

## Libraries
library(foreign)
library(dismo)

## Data Load
folder<-getwd();

setwd("~/Documents/Grinnell/Mammals/NN_analysis_data")

projAlbers <- CRS("+proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +x_0=0 +y_0=-4000000 +datum=NAD83 +units=m +no_defs")

bio1_LA0<-raster("la_h_bio_1.asc", crs=projAlbers)
bio12_LA0<-raster("la_h_bio_12.asc", crs=projAlbers)
bio1_LA1<-raster("la_c_bio_1.asc", crs=projAlbers)
bio12_LA1<-raster("la_c_bio_12.asc", crs=projAlbers)
dem_LA<-raster("la_demsrtm30.asc", crs=projAlbers);
bio1_YO0<-raster("yo_h_bio01Apr2014.asc", crs=projAlbers)
bio12_YO0<-raster("yo_h_bio12Apr2014.asc", crs=projAlbers)
bio1_YO1<-raster("yo_c_bio01Apr2014.asc", crs=projAlbers)
bio12_YO1<-raster("yo_c_bio12Apr2014.asc", crs=projAlbers)
dem_YO<-raster("yo_demsrtm30.asc", crs=projAlbers);
bio1_SS0<-raster("ss_h_bio_1.asc", crs=projAlbers)
bio12_SS0<-raster("ss_h_bio_12.asc", crs=projAlbers)
bio1_SS1<-raster("ss_c_bio_1.asc", crs=projAlbers)
bio12_SS1<-raster("ss_c_bio_12.asc", crs=projAlbers)
dem_SS<-raster("ss_demsrtm30.asc", crs=projAlbers)
#add in extremes;check units
bio5_LA0<-raster("la_h_bio_5.asc", crs=projAlbers)
bio6_LA0<-raster("la_h_bio_6.asc", crs=projAlbers)
bio5_LA1<-raster("la_c_bio_5.asc", crs=projAlbers)
bio6_LA1<-raster("la_c_bio_6.asc", crs=projAlbers)
bio5_SS0<-raster("ss_h_bio_5.asc", crs=projAlbers)
bio6_SS0<-raster("ss_h_bio_6.asc", crs=projAlbers)
bio5_SS1<-raster("ss_c_bio_5.asc", crs=projAlbers)
bio6_SS1<-raster("ss_c_bio_6.asc", crs=projAlbers)
bio5_YO0<-raster("yo_h_bio05Apr2014.asc", crs=projAlbers)
bio6_YO0<-raster("yo_h_bio06Apr2014.asc", crs=projAlbers)
bio5_YO1<-raster("yo_c_bio05Apr2014.asc", crs=projAlbers)
bio6_YO1<-raster("yo_c_bio06Apr2014.asc", crs=projAlbers)

unqsites<-read.table("unq_aggsites_ebc_20120326.csv", header=T, sep=",");

setwd(folder);

############ SITE-SPECIFIC NEAREST NEIGHBORS ########################

eucl<-function(x0,y0,x1,y1) {sqrt((x0-x1)^2+(y0-y1)^2)}

######### Why does bio5 have different number of cells from bio1?? Re-sample all to Bio1
bio5_YO0<-resample(x=bio5_YO0,y=bio1_YO1,method="ngb",progress="text")
bio5_YO1<-resample(x=bio5_YO1,y=bio1_YO1,method="ngb",progress="text")
bio6_YO0<-resample(x=bio6_YO0,y=bio1_YO1,method="ngb",progress="text")
bio6_YO1<-resample(x=bio6_YO1,y=bio1_YO1,method="ngb",progress="text")

YO_points<-unqsites[which(unqsites$REGION=="YO"),];
b1_YO0<-getValues(bio1_YO0)
b1_YO1<-getValues(bio1_YO1)
b5_YO0<-getValues(bio5_YO0)
b5_YO1<-getValues(bio5_YO1)
b6_YO0<-getValues(bio6_YO0)
b6_YO1<-getValues(bio6_YO1)
b12_YO0<-getValues(bio12_YO0)
b12_YO1<-getValues(bio12_YO1)

dem2_YO<-resample(x=dem_YO,y=bio1_YO1,method="ngb",filename="demYO.grd", format="raster",progress="text",overwrite=T) #resample DEM to resolution of climate
elev_YO<-getValues(dem2_YO)

## For each survey site, find the average elevation difference of closest 5%, check for >50% within 1°C
YO_coords<-xyFromCell(bio1_YO0,1:length(b1_YO0)) # find X-Y values for all YO cells
YOi<-which(is.na(b1_YO0*elev_YO)==F) #index of cells with valid dem & climate values
YO_avg_b1<-rep(NA,length(YO_points[,1]))
YO_avg_b5<-rep(NA,length(YO_points[,1]))
YO_avg_b6<-rep(NA,length(YO_points[,1]))
YO_avg_b12<-rep(NA,length(YO_points[,1]))
YO_mr_b1<-rep(NA,length(YO_points[,1]))
YO_mr_b5<-rep(NA,length(YO_points[,1]))
YO_mr_b6<-rep(NA,length(YO_points[,1]))
YO_mr_b12<-rep(NA,length(YO_points[,1]))
YO_pt_Hb1<-YO_points$H_BIO_1
YO_pt_Cb1<-YO_points$C_BIO_1
YO_pt_Hb5<-YO_points$H_BIO_5
YO_pt_Cb5<-YO_points$C_BIO_5
YO_pt_Hb6<-YO_points$H_BIO_6
YO_pt_Cb6<-YO_points$C_BIO_6
YO_pt_Hb12<-YO_points$H_BIO_12
YO_pt_Cb12<-YO_points$C_BIO_12

for(i in 1:length(YO_avg_b1)) {
	b1_pts<-order(abs(b1_YO1-YO_points[i,"H_BIO_1"]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio1
	YO_mr_b1[i]<-((length(which((abs(YO_pt_Hb1[i]-b1_YO1[b1_pts])/100)<1))/length(b1_pts))<0.5)*1 #micro-refugia
	YO_avg_b1[i]<-mean(elev_YO[b1_pts],na.rm=T)	
	b5_pts<-order(abs(b5_YO1-YO_points[i,"H_BIO_5"]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio5
	YO_mr_b5[i]<-((length(which((abs(YO_pt_Hb5[i]-b5_YO1[b5_pts])/100)<1))/length(b5_pts))<0.5)*1 #micro-refugia
	YO_avg_b5[i]<-mean(elev_YO[b5_pts],na.rm=T)	
  b6_pts<-order(abs(b6_YO1-YO_points[i,"H_BIO_6"]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio6
  YO_mr_b6[i]<-((length(which((abs(YO_pt_Hb6[i]-b6_YO1[b6_pts])/100)<1))/length(b6_pts))<0.5)*1 #micro-refugia
	YO_avg_b6[i]<-mean(elev_YO[b6_pts],na.rm=T)	
	b12_pts<-order(abs(b12_YO1-YO_points[i,"H_BIO_12"]))[1:(0.05*round(length(YOi)))] #top 5% hist_bio12
	YO_mr_b12[i]<-((length(which((abs(YO_pt_Hb12[i]-b12_YO1[b12_pts])/1000)<10))/length(b12_pts))<0.5)*1 #micro-refugia
	YO_avg_b12[i]<-mean(elev_YO[b12_pts],na.rm=T)
	}
elev_YO_pts<-extract(dem_YO,data.frame(YO_points$X,YO_points$Y))

## Repeat for Lassen 
bio5_LA0<-resample(x=bio5_LA0,y=bio1_LA1,method="ngb",progress="text")
bio5_LA1<-resample(x=bio5_LA1,y=bio1_LA1,method="ngb",progress="text")
bio6_LA0<-resample(x=bio6_LA0,y=bio1_LA1,method="ngb",progress="text")
bio6_LA1<-resample(x=bio6_LA1,y=bio1_LA1,method="ngb",progress="text")

LA_points<-unqsites[which(unqsites$REGION=="LA"),];
b1_LA0<-getValues(bio1_LA0)
b1_LA1<-getValues(bio1_LA1)
b5_LA0<-getValues(bio5_LA0)
b5_LA1<-getValues(bio5_LA1)
b6_LA0<-getValues(bio6_LA0)
b6_LA1<-getValues(bio6_LA1)
b12_LA0<-getValues(bio12_LA0)
b12_LA1<-getValues(bio12_LA1)

dem2_LA<-resample(x=dem_LA,y=bio1_LA1,method="ngb",filename="demLA.grd", format="raster",progress="text",overwrite=T) #resample DEM to resolution of climate
elev_LA<-getValues(dem2_LA)

## For each survey site, find the average elevation difference of closest 5%, check for >50% within 1°C
LA_coords<-xyFromCell(bio1_LA0,1:length(b1_LA0)) # find X-Y values for all LA cells
LAi<-which(is.na(b1_LA0*elev_LA)==F) #index of cells with valid dem & climate values
LA_avg_b1<-rep(NA,length(LA_points[,1]))
LA_avg_b5<-rep(NA,length(LA_points[,1]))
LA_avg_b6<-rep(NA,length(LA_points[,1]))
LA_avg_b12<-rep(NA,length(LA_points[,1]))
LA_mr_b1<-rep(NA,length(LA_points[,1]))
LA_mr_b5<-rep(NA,length(LA_points[,1]))
LA_mr_b6<-rep(NA,length(LA_points[,1]))
LA_mr_b12<-rep(NA,length(LA_points[,1]))
LA_pt_Hb1<-LA_points$H_BIO_1
LA_pt_Cb1<-LA_points$C_BIO_1
LA_pt_Hb5<-LA_points$H_BIO_5
LA_pt_Cb5<-LA_points$C_BIO_5
LA_pt_Hb6<-LA_points$H_BIO_6
LA_pt_Cb6<-LA_points$C_BIO_6
LA_pt_Hb12<-LA_points$H_BIO_12
LA_pt_Cb12<-LA_points$C_BIO_12

for(i in 1:length(LA_avg_b1)) {
  b1_pts<-order(abs(b1_LA1-LA_points[i,"H_BIO_1"]))[1:(0.05*round(length(LAi)))] #top 5% hist_bio1
  LA_mr_b1[i]<-((length(which((abs(LA_pt_Hb1[i]-b1_LA1[b1_pts])/100)<1))/length(b1_pts))<0.5)*1 #micro-refugia
  LA_avg_b1[i]<-mean(elev_LA[b1_pts],na.rm=T)  
  b5_pts<-order(abs(b5_LA1-LA_points[i,"H_BIO_5"]))[1:(0.05*round(length(LAi)))] #top 5% hist_bio5
  LA_mr_b5[i]<-((length(which((abs(LA_pt_Hb5[i]-b5_LA1[b5_pts])/100)<1))/length(b5_pts))<0.5)*1 #micro-refugia
  LA_avg_b5[i]<-mean(elev_LA[b5_pts],na.rm=T)	
  b6_pts<-order(abs(b6_LA1-LA_points[i,"H_BIO_6"]))[1:(0.05*round(length(LAi)))] #top 5% hist_bio6
  LA_mr_b6[i]<-((length(which((abs(LA_pt_Hb6[i]-b6_LA1[b6_pts])/100)<1))/length(b6_pts))<0.5)*1 #micro-refugia
  LA_avg_b6[i]<-mean(elev_LA[b6_pts],na.rm=T)	
  b12_pts<-order(abs(b12_LA1-LA_points[i,"H_BIO_12"]))[1:(0.05*round(length(LAi)))] #top 5% hist_bio12
  LA_mr_b12[i]<-((length(which((abs(LA_pt_Hb12[i]-b12_LA1[b12_pts])/1000)<10))/length(b12_pts))<0.5)*1 #micro-refugia
  LA_avg_b12[i]<-mean(elev_LA[b12_pts],na.rm=T)
}
elev_LA_pts<-extract(dem_LA,data.frame(LA_points$X,LA_points$Y))
	
###### Southern Sierra
bio5_SS0<-resample(x=bio5_SS0,y=bio1_SS1,method="ngb",progress="text")
bio5_SS1<-resample(x=bio5_SS1,y=bio1_SS1,method="ngb",progress="text")
bio6_SS0<-resample(x=bio6_SS0,y=bio1_SS1,method="ngb",progress="text")
bio6_SS1<-resample(x=bio6_SS1,y=bio1_SS1,method="ngb",progress="text")

SS_points<-unqsites[which(unqsites$REGION=="SS"),];
b1_SS0<-getValues(bio1_SS0)
b1_SS1<-getValues(bio1_SS1)
b5_SS0<-getValues(bio5_SS0)
b5_SS1<-getValues(bio5_SS1)
b6_SS0<-getValues(bio6_SS0)
b6_SS1<-getValues(bio6_SS1)
b12_SS0<-getValues(bio12_SS0)
b12_SS1<-getValues(bio12_SS1)

dem2_SS<-resample(x=dem_SS,y=bio1_SS1,method="ngb",filename="demSS.grd", format="raster",progress="text",overwrite=T) #resample DEM to resolution of climate
elev_SS<-getValues(dem2_SS)

## For each survey site, find the average elevation difference of closest 5%, check for >50% within 1°C
SS_coords<-xyFromCell(bio1_SS0,1:length(b1_SS0)) # find X-Y values for all SS cells
SSi<-which(is.na(b1_SS0*elev_SS)==F) #index of cells with valid dem & climate values
SS_avg_b1<-rep(NA,length(SS_points[,1]))
SS_avg_b5<-rep(NA,length(SS_points[,1]))
SS_avg_b6<-rep(NA,length(SS_points[,1]))
SS_avg_b12<-rep(NA,length(SS_points[,1]))
SS_mr_b1<-rep(NA,length(SS_points[,1]))
SS_mr_b5<-rep(NA,length(SS_points[,1]))
SS_mr_b6<-rep(NA,length(SS_points[,1]))
SS_mr_b12<-rep(NA,length(SS_points[,1]))
SS_pt_Hb1<-SS_points$H_BIO_1
SS_pt_Cb1<-SS_points$C_BIO_1
SS_pt_Hb5<-SS_points$H_BIO_5
SS_pt_Cb5<-SS_points$C_BIO_5
SS_pt_Hb6<-SS_points$H_BIO_6
SS_pt_Cb6<-SS_points$C_BIO_6
SS_pt_Hb12<-SS_points$H_BIO_12
SS_pt_Cb12<-SS_points$C_BIO_12

for(i in 1:length(SS_avg_b1)) {
  b1_pts<-order(abs(b1_SS1-SS_points[i,"H_BIO_1"]))[1:(0.05*round(length(SSi)))] #top 5% hist_bio1
  SS_mr_b1[i]<-((length(which((abs(SS_pt_Hb1[i]-b1_SS1[b1_pts])/100)<1))/length(b1_pts))<0.5)*1 #micro-refugia
  SS_avg_b1[i]<-mean(elev_SS[b1_pts],na.rm=T)  
  b5_pts<-order(abs(b5_SS1-SS_points[i,"H_BIO_5"]))[1:(0.05*round(length(SSi)))] #top 5% hist_bio5
  SS_mr_b5[i]<-((length(which((abs(SS_pt_Hb5[i]-b5_SS1[b5_pts])/100)<1))/length(b5_pts))<0.5)*1 #micro-refugia
  SS_avg_b5[i]<-mean(elev_SS[b5_pts],na.rm=T)	
  b6_pts<-order(abs(b6_SS1-SS_points[i,"H_BIO_6"]))[1:(0.05*round(length(SSi)))] #top 5% hist_bio6
  SS_mr_b6[i]<-((length(which((abs(SS_pt_Hb6[i]-b6_SS1[b6_pts])/100)<1))/length(b6_pts))<0.5)*1 #micro-refugia
  SS_avg_b6[i]<-mean(elev_SS[b6_pts],na.rm=T)	
  b12_pts<-order(abs(b12_SS1-SS_points[i,"H_BIO_12"]))[1:(0.05*round(length(SSi)))] #top 5% hist_bio12
  SS_mr_b12[i]<-((length(which((abs(SS_pt_Hb12[i]-b12_SS1[b12_pts])/1000)<10))/length(b12_pts))<0.5)*1 #micro-refugia
  SS_avg_b12[i]<-mean(elev_SS[b12_pts],na.rm=T)
}
elev_SS_pts<-extract(dem_SS,data.frame(SS_points$X,SS_points$Y))

########### Export
neighbor_export<-data.frame(rbind(YO_points[,c(3:8,10:11,12:20)],LA_points[,c(3:8,10:11,12:20)],SS_points[,c(3:8,10:11,12:20)]))
neighbor_export$elev<-c(elev_YO_pts,elev_LA_pts,elev_SS_pts)
neighbor_export$nr_elev_b1<-c(YO_avg_b1 ,LA_avg_b1,SS_avg_b1)
neighbor_export$nr_elev_b5<-c(YO_avg_b5 ,LA_avg_b5,SS_avg_b5)
neighbor_export$nr_elev_b6<-c(YO_avg_b6 ,LA_avg_b6,SS_avg_b6)
neighbor_export$nr_elv_b12<-c(YO_avg_b12 ,LA_avg_b12,SS_avg_b12)
neighbor_export$micro_b1<-c(YO_mr_b1 ,LA_mr_b1,SS_mr_b1)
neighbor_export$micro_b5<-c(YO_mr_b5 ,LA_mr_b5,SS_mr_b5)
neighbor_export$micro_b6<-c(YO_mr_b6 ,LA_mr_b6,SS_mr_b6)
neighbor_export$micro_b12<-c(YO_mr_b12 ,LA_mr_b12,SS_mr_b12)

##This creates an exportable table that has the avg elevation of the 5% nearest neighbors (within each region) for each survey site, along with presence of microrefugia

write.table(neighbor_export,"new_nn_elv_20140320.csv",sep=",")

