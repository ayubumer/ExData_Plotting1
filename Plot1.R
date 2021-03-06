
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

#plot 1 Histogram

png(filename="./Proj1/Plot1.png"
    ,width=480,height=480,units = "px"                 
)
hist(as.numeric(DT2$Global_active_power),col="red",
     xlab = "Global Active Power(Kilowatts)",
     main = "Global Active Power"
)

dev.off()