# required lib
library(lubridate)

# path to source file
fpath <- "./household_power_consumption.txt"

# reading source file
pwcons <- read.csv(fpath, sep=";", na.strings="?", as.is=T)

# filter on days and append a converted datetime variables
pwcons <- pwcons[pwcons$Date %in% c("1/2/2007", "2/2/2007"), ]
pwcons$DateTime <- dmy_hms(paste(pwcons$Date, pwcons$Time, sep = " "), locale = "English")

# init PNG device with default parameters : width = 480, height = 480, units = "px"
png("plot4.png")

# plot 4
par(mfrow=c(2, 2))

# subplot (1, 1)
plot(pwcons$DateTime, pwcons$Global_active_power, type="l",
       xlab="", ylab="Global Active Power")

# subplot (1, 2)
plot(pwcons$DateTime, pwcons$Voltage, type="l",
       xlab="datetime", ylab="Voltage")

# subplot (2, 1)
plot(pwcons$DateTime, pwcons$Sub_metering_1, type="l", 
       xlab="", ylab="Energy sub metering", col="black")

lines(pwcons$DateTime, pwcons$Sub_metering_2, col="red")
lines(pwcons$DateTime, pwcons$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd=1 ,col=c("black", "red", "blue"), bty="n")

# subplot (2, 2)
plot(pwcons$DateTime, pwcons$Global_reactive_power, type="l", 
       xlab="datetime", ylab="Global_reactive_power", col="black")

# shut down device
dev.off()
