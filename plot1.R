
tab5rows <- read.table("~/household_power_consumption.txt", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

data <- read.table("~/household_power_consumption.txt", sep=";",header=TRUE, na.strings= "?",colClasses = classes)

data[,1] <- as.Date(strptime(data[,1],"%d/%m/%Y"))

mydata <- rbind(data [data[,1]=="2007-02-01", ],data [data[,1]=="2007-02-02", ])

rownames(mydata) <- 1:nrow(mydata)
hist(mydata$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power",col="red")
##png("plot1.png",width = 480, height = 480, units = "px")
dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px") ## Copy my plot to a PNG file
dev.off()
