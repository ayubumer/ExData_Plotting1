
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

##plot 4

### Sub plot 1
png(filename="./Proj1/Plot4.png"
    ,width=480,height=480,units = "px"                 
)


par(mfrow= c(2,2))

plot(as.numeric(DT2$Global_active_power)~DT2$DateTime  ,type = "l",xlab="" ,ylab = "Global Active Power(Kilowatts)")

### Sub plot 2
with(DT2,
     plot(DT2$DateTime,as.numeric(DT2$Voltage),type = "l",
          xlab = "DateTime",ylab = "Voltage",main=""
     )
)


### Sub plot 3

with(DT2,
     plot(DT2$DateTime,as.numeric(DT2$Sub_metering_1),
          type="n",xlab = "",ylab = "Energy Sub Metering",main=""
     )
)

lines(DT2$DateTime,as.numeric(DT2$Sub_metering_1),col="black")
lines(DT2$DateTime,as.numeric(DT2$Sub_metering_2),col="red")
lines(DT2$DateTime,as.numeric(DT2$Sub_metering_3),col="blue")

legend("topright",lwd=1,col=c("Black","Red","Blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.7
)

### Sub plot 4

with(DT2,
     plot(DT2$DateTime,as.numeric(DT2$Global_reactive_power ),type = "l",
          xlab = "DateTime",ylab = "Global_reactive_power",main=""
     )
)
dev.off()