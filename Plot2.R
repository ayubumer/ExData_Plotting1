
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

png(filename="./Proj1/Plot2.png"
    ,width=480,height=480,units = "px"                 
)

plot(as.numeric(DT2$Global_active_power)~DT2$DateTime  ,type = "l",xlab="" ,ylab = "Global Active Power(Kilowatts)")

dev.off()
