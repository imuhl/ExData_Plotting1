# read houseohld power consumption data and plot plots over time to the file plot4.png

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

# plot 4 plots over time to the file plot4.png
png(filename = "plot4.png")
par(mfrow = c(2,2))
# 1.Plot: Global Active Power over time
plot(power2day$dateTime, power2day$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
# 2.Plot: Voltage over time
plot(power2day$dateTime, power2day$Voltage, type = "l",
     xlab = "datetime",
     ylab = "Voltage")
# 3.Plot: sub meters over time
plot(power2day$dateTime, power2day$Sub_metering_1, type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(power2day$dateTime, power2day$Sub_metering_2, col = "red")
lines(power2day$dateTime, power2day$Sub_metering_3, col = "blue")
legend("topright", box.col = "transparent", bg = "transparent",
       lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# 4.Plot: Global Reactive Power over time
plot(power2day$dateTime, power2day$Global_reactive_power, type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()