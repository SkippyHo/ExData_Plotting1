
tab5rows <- read.table("~/household_power_consumption.txt", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

data <- read.table("~/household_power_consumption.txt", sep=";",header=TRUE, na.strings= "?",colClasses = classes)

data[,1] <- as.Date(strptime(data[,1],"%d/%m/%Y"))

mydata <- rbind(data [data[,1]=="2007-02-01", ],data [data[,1]=="2007-02-02", ])

rownames(mydata) <- 1:nrow(mydata)

mydata[,1] <- paste(mydata$Date, mydata$Time)
mydata$Time<-NULL
mydata[,1]<-as.POSIXct(mydata[,1])
plot(mydata$Date,mydata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(mydata$Date,mydata$Sub_metering_2,col="red")
lines(mydata$Date,mydata$Sub_metering_3,col="blue")
legend("topright", lty=1,col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
##png("plot1.png",width = 480, height = 480, units = "px")
dev.copy(png, file = "plot3.png",width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off()
