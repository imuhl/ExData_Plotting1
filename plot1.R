# read houseohld power consumption data and plot a histogram to the file plot1.png

# read data
power <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", na.strings = "?", stringsAsFactors = F)
power$dateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S")
power2day <- power[power$dateTime >= "2007-02-01" & 
                       power$dateTime < "2007-02-03",]
power2day <- power2day[!is.na(power2day$Global_active_power),]

# plot histogram to file plot1.png
png(filename = "plot1.png")
hist(power2day$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Acitive Power")
dev.off()
