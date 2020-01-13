# read houseohld power consumption data and plot a Global Acitive Power over time to the file plot2.png

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

# plot a Global Acitive Power over time to the file plot2.png
png(filename = "plot2.png")
plot(power2day$dateTime, power2day$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()