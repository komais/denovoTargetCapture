## Update: Ignoring Lattice, creating 2 sets of conditioning plots, for each precip
## Update: incorporating map in as well
## Update: playing with plot B options
## Update: Gave UP with Kevin and reverted to GCB-type plpots

## Load Libraries
library(dismo)
library(maptools)
gpclibPermit()
library(fields)
library(rgdal)

################ IMPORT GIS DATA
folder<-getwd()
setwd("/Users/mtingley/Documents/GIS_Data/California_admin_data")
ca_bound<-readOGR(dsn=getwd(),layer="state_boundary")
ca_county<-readOGR(dsn=getwd(),layer="state_counties")
setwd("/Users/mtingley/Documents/GIS_Data/LifeZones_Grinnell")
lifezones<-readOGR(dsn=getwd(),layer="G_LifeZones_alb") #brings in .proj
setwd(folder)
neighbor<-read.csv("new_nn_elv_20140401.csv")


################# IMPORT Relief TIFF
setwd("/Users/mtingley/Documents/GIS_Data/CA relief")
#list.files()
relief1<-raster(list.files()[4])

## Survey points
hist_pts<-neighbor[neighbor$ERA=="H",]
proj<-proj4string(lifezones) #Projection of lifezones in Calif AEA
points2<-project(as.matrix(hist_pts[,c(3,2)]),proj=proj)

##### PLOT Color Ramp Koo
col_lifezone<-c("#0080AAAA","#00663370","#00FF7025","#FFFF6680","light gray")
col_list<-col_lifezone[lifezones$LIFE_ZONE]
col_list[105]<-"#FFBB0050"
col_list[40]<-"#FFBB0050"
col_list[69]<-"#FFBB0050"

# Region boxes
la.x<-bbox(extend(extent(points2[hist_pts$REGION=="LA",]),20000))
yo.x<-bbox(extend(extent(points2[hist_pts$REGION=="YO",]),20000))
ss.x<-bbox(extend(extent(points2[hist_pts$REGION=="SS",]),20000))
	
# Change in elevation per site
neighbor<-hist_pts
elev_pt<-neighbor$elev
region_s<-neighbor$REGION
ord_LA<-which(region_s=="LA")[order(elev_pt[region_s=="LA"])]
ord_YO<-which(region_s=="YO")[order(elev_pt[region_s=="YO"])]
ord_SS<-which(region_s=="SS")[order(elev_pt[region_s=="SS"])]
p0_t<-neighbor$H_BIO_12/1000 #/1000 converts to cm
p1_t<-neighbor$C_BIO_12/1000
t0_t<-neighbor$H_BIO_6/100
t1_t<-neighbor$C_BIO_6/100
p_micro<-neighbor$micro_b12
t_micro<-neighbor$micro_b6
p_near<-neighbor$nr_elv_b12
t_near<-neighbor$nr_elev_b6
elev_col<-round((elev_pt-min(elev_pt))/100)+1
p_shift<-p_near-elev_pt
t_shift<-t_near-elev_pt

cloud_data<-data.frame(p_shift,t_shift,p_micro,t_micro)
cloud_data$key<-as.numeric(factor(sign(cloud_data[,1])+sign(cloud_data[,2])*3+sign(cloud_data[,3])*5+10))

############# Climate space shift plot ############
setwd(folder)
pdf(file="NN_Fig_040114.pdf",width=5.4,height=6.8)

par(mar=c(3,4,1.5,2),oma=c(0.3,0.1,0.2,0.4),las=1,tcl=0.5, xaxs="i", yaxs="i", mgp=c(1.6,0.2,0),family="Helvetica",cex.axis=0.7, pty="m")


layout.mx<-matrix(data=c(1,1,1,1,2,3,4,5,6,7),ncol=2,byrow=T)
layout.grp<-layout(layout.mx)
#layout.show(layout.grp)

## Map
par(mar=c(0,0,0,0),oma=c(0,0,0,0),mgp=c(0,0,0))
image(relief1,col=gray(seq(0,1,0.01)), axes=F, xlab="",ylab="",xlim=c(-400000,490000), ylim=c(-620000,460000),asp=1)
plot(lifezones,col=col_list,add=T, border=NA)
points(points2,pch=21,col="black",bg="red",cex=0.7)
polygon(x=la.x[1,c(1,1,2,2)],y=la.x[2,c(1,2,2,1)])
polygon(x=yo.x[1,c(1,1,2,2)],y=yo.x[2,c(1,2,2,1)])
polygon(x=ss.x[1,c(1,1,2,2)],y=ss.x[2,c(1,2,2,1)])
text(x=la.x[3],y=la.x[4],label="Lassen",pos=4,cex=1)
text(x=yo.x[3],y=yo.x[4],label="Yosemite",pos=4,cex=1)
text(x=ss.x[3],y=ss.x[4],label="S. Sierra",pos=4,cex=1)
legend(x="topright",fil=c("#0080AACC","#006633CC","#00FF7050","#FFFF6670","light gray",NA),legend=c("Boreal","Transition","Upper Sonoran","Lower Sonoran","Water","Survey transect"), bty="n",pt.bg=c(NA,NA,NA,NA,NA,"red"),pch=c(NA,NA,NA,NA,NA,21), border=c(rep("black",5),NA), cex=0.9, pt.cex=1.3)
title(main="A",adj=0.02,cex.main=1.5,line=-1.4)
title(main="B",adj=0.02,cex.main=1.5,line=-20)
title(main="C",adj=0.57,cex.main=1.5,line=-20)

## Climate vectors
par(mar=c(2,3,0.5,1),mgp=c(1.6,0.2,0))
plot(c(0,4000),c(0,300),type="n",xlab="",main="",yaxt="n",ylab="")
title(main="Lassen",adj=0.95,line=-0.8,cex.main=0.8)
axis(4)
arrows(elev_pt[ord_LA],y0=p0_t[ord_LA],y1=p1_t[ord_LA],col="dark blue",length=0.04,lwd=1)
par(new=T)
plot(c(0,4000),c(-20,10),type="n",axes="F",main="",xlab="",ylab="")
axis(2)
arrows(elev_pt[ord_LA],y0=t0_t[ord_LA],y1=t1_t[ord_LA], col="red",length=0.04,lwd=1)

par(mar=c(2,5,0.5,1),mgp=c(1.8,0.2,0))
plot(c(0,4000),c(-2100,2100),type="n",xlab="",ylab="",las=1,main="",yaxt="n", cex.lab=0.7)
title(main="Lassen",adj=0.95,line=-0.8,cex.main=0.8)
axis(side=2,at=c(-2000,-1000,0,1000,2000),labels=c("-2000","-1000",0,"+1000","+2000"))
abline(h=0,lty=3)
points(elev_pt[ord_LA][p_micro[ord_LA]==0],(p_near[ord_LA]-elev_pt[ord_LA])[p_micro[ord_LA]==0],col="black",pch=24, bg="#0000FF80")
points(elev_pt[ord_LA][t_micro[ord_LA]==0],(t_near[ord_LA]-elev_pt[ord_LA])[t_micro[ord_LA]==0],col="black",pch=22, bg="#FF000080")
points(elev_pt[ord_LA][p_micro[ord_LA]==1],(p_near[ord_LA]-elev_pt[ord_LA])[p_micro[ord_LA]==1],col="#0000FF80",pch=24, bg="#FFFFFF80")
points(elev_pt[ord_LA][t_micro[ord_LA]==1],(t_near[ord_LA]-elev_pt[ord_LA])[t_micro[ord_LA]==1],col="#FF000080",pch=22, bg="#FFFFFF80")

par(mar=c(2,3,0.5,1),mgp=c(1.6,0.2,0))
plot(c(0,4000),c(0,300),type="n",xlab="",main="",yaxt="n",ylab="")
title(main="Yosemite",adj=0.95,line=-0.8,cex.main=0.8)
axis(4)
mtext(side=4,line=1.6,"Precipitation (cm)",las=0,cex=0.7)
arrows(elev_pt[ord_YO],y0=p0_t[ord_YO],y1=p1_t[ord_YO],col="dark blue",length=0.04,lwd=1)
par(new=T)
plot(c(0,4000),c(-20,10),type="n",axes="F",main="",xlab="",ylab="")
axis(2)
mtext(side=2,line=1.2,"Temperature (°C)",las=0,cex=0.7)
arrows(elev_pt[ord_YO],y0=t0_t[ord_YO],y1=t1_t[ord_YO], col="red",length=0.04,lwd=1)

par(mar=c(2,5,0.5,1),mgp=c(1.8,0.2,0))
plot(c(0,4000),c(-2100,2100),type="n",xlab="",ylab="",las=1,main="",yaxt="n")
title(main="Yosemite",adj=0.95,line=-0.8,cex.main=0.8)
axis(side=2,at=c(-2000,-1000,0,1000,2000),labels=c("-2000","-1000",0,"+1000","+2000"))
mtext(side=2,line=1.8,"NNE (m)",las=0,cex=0.7)
abline(h=0,lty=3)
#points(elev_pt[ord_YO],(t_near[ord_YO]-elev_pt[ord_YO]),col="black",pch=22, bg="#FF000080")
points(elev_pt[ord_YO][p_micro[ord_YO]==0],(p_near[ord_YO]-elev_pt[ord_YO])[p_micro[ord_YO]==0],col="black",pch=24, bg="#0000FF80")
points(elev_pt[ord_YO][t_micro[ord_YO]==0],(t_near[ord_YO]-elev_pt[ord_YO])[t_micro[ord_YO]==0],col="black",pch=22, bg="#FF000080")
points(elev_pt[ord_YO][p_micro[ord_YO]==1],(p_near[ord_YO]-elev_pt[ord_YO])[p_micro[ord_YO]==1],col="#0000FF80",pch=24, bg="#FFFFFF80")
points(elev_pt[ord_YO][t_micro[ord_YO]==1],(t_near[ord_YO]-elev_pt[ord_YO])[t_micro[ord_YO]==1],col="#FF000080",pch=22, bg="#FFFFFF80")

par(mar=c(2.2,3,0.5,1),mgp=c(1.6,0.2,0))
plot(c(0,4000),c(0,300),type="n",xlab="",main="",yaxt="n",ylab="")
title(main="S. Sierra",adj=0.95,line=-0.8,cex.main=0.8)
axis(4)
arrows(elev_pt[ord_SS],y0=p0_t[ord_SS],y1=p1_t[ord_SS],col="dark blue",length=0.04,lwd=1)
par(new=T)
plot(c(0,4000),c(-20,10),type="n",axes="F",main="",xlab="",ylab="")
axis(2)
arrows(elev_pt[ord_SS],y0=t0_t[ord_SS],y1=t1_t[ord_SS], col="red",length=0.04,lwd=1)
mtext(side=1,line=1,"Site Elevation (m)",las=0,cex=0.7)

par(mar=c(2.2,5,0.5,1),mgp=c(1.8,0.2,0))
plot(c(0,4000),c(-2100,2100),type="n",xlab="",ylab="",las=1,main="",yaxt="n", cex.lab=1)
title(main="S. Sierra",adj=0.95,line=-0.8,cex.main=0.8)
axis(side=2,at=c(-2000,-1000,0,1000,2000),labels=c("-2000","-1000",0,"+1000","+2000"))
abline(h=0,lty=3)
points(elev_pt[ord_SS][p_micro[ord_SS]==0],(p_near[ord_SS]-elev_pt[ord_SS])[p_micro[ord_SS]==0],col="black",pch=24, bg="#0000FF80")
points(elev_pt[ord_SS][t_micro[ord_SS]==0],(t_near[ord_SS]-elev_pt[ord_SS])[t_micro[ord_SS]==0],col="black",pch=22, bg="#FF000080")
points(elev_pt[ord_SS][p_micro[ord_SS]==1],(p_near[ord_SS]-elev_pt[ord_SS])[p_micro[ord_SS]==1],col="#0000FF80",pch=24, bg="#FFFFFF80")
points(elev_pt[ord_SS][t_micro[ord_SS]==1],(t_near[ord_SS]-elev_pt[ord_SS])[t_micro[ord_SS]==1],col="#FF000080",pch=22, bg="#FFFFFF80")
mtext(side=1,line=1,"Site Elevation (m)",las=0,cex=0.7)

dev.off()