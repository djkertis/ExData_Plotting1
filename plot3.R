data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", nrows=5, header=TRUE, sep=";")
classes <- sapply(data, class)

data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", nrows=2075260, header=TRUE, sep=";", colClasses = classes, comment.char = "", na.strings = "?")
data$Date<- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
filtData <- subset(data, Date>=as.POSIXlt("2007-02-01") & Date<as.POSIXlt("2007-02-03"))

png(filename = "plot3.png", width=480, height=480)

with(filtData, plot(Date, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(filtData, lines(Date,Sub_metering_1, col="black"))
with(filtData, lines(Date,Sub_metering_2, col="red"))
with(filtData, lines(Date,Sub_metering_3, col="blue"))
legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()

