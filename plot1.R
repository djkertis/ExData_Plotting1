data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", nrows=5, header=TRUE, sep=";")
classes <- sapply(data, class)

data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", nrows=2075260, header=TRUE, sep=";", colClasses = classes, comment.char = "", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
filtData <- subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
filtData$Time <- strptime(filtData$Time, "%H:%M:%S")
png(filename = "plot1.png", width=480, height=480)
hist(filtData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

