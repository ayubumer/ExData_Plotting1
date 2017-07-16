
##adding library
library("data.table")
##loading full file
DT<- fread("./Proj1/household_power_consumption.txt"
           ,na.strings=NULL)

## updating date format 

DT$Date <-as.Date(DT$Date,format = "%d/%m/%Y")

##adding new column with datetime foramat


DT[,DateTime:=as.POSIXct(paste(DT$Date,DT$Time))]


### subsetting the specified dates

DT2<-DT[which(DT$Date >= "2007-02-01" & DT$Date <="2007-02-02" ),]


##Ploting
png(filename="./Proj1/Plot3.png"
    ,width=480,height=480,units = "px"                 
)


with(DT2,
     plot(DT2$DateTime,as.numeric(DT2$Sub_metering_1),
          type="n",xlab = "",ylab = "Energy Sub Metering",main=""
     )
)

lines(DT2$DateTime,as.numeric(DT2$Sub_metering_1),col="black")
lines(DT2$DateTime,as.numeric(DT2$Sub_metering_2),col="red")
lines(DT2$DateTime,as.numeric(DT2$Sub_metering_3),col="blue")

legend("topright",lwd=3,col=c("Black","Red","Blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

