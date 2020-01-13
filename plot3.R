# read houseohld power consumption data and plot Energy sub metering for 3 sub meters over time to the file plot3.png

# read data
power <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", na.strings = "?", stringsAsFactors = F)
power$dateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S")
power2day <- power[power$dateTime >= "2007-02-01" & 
                       power$dateTime < "2007-02-03",]
power2day <- power2day[!is.na(power2day$Global_active_power),]
# change local time to English to print weekdays in english
Sys.setlocale("LC_TIME", "English")

# plot sub meters over time to the file plot3.png
png(filename = "plot3.png")
plot(power2day$dateTime, power2day$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(power2day$dateTime, power2day$Sub_metering_2, col = "red")
lines(power2day$dateTime, power2day$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()