data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", nrows=5, header=TRUE, sep=";")
classes <- sapply(data, class)

data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", nrows=2075260, header=TRUE, sep=";", colClasses = classes, comment.char = "", na.strings = "?")
data$Date<- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
filtData <- subset(data, Date>=as.POSIXlt("2007-02-01") & Date<as.POSIXlt("2007-02-03"))

png(filename = "plot2.png", width=480, height=480)

with(filtData, plot(Date, Global_active_power, type="l", xlab=""))

dev.off()

