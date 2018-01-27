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
png("plot2.png")

# plot 2
plot(pwcons$DateTime, pwcons$Global_active_power, type="l",
       xlab="", ylab="Global Active Power (kilowatts)")

# shut down device
dev.off()



