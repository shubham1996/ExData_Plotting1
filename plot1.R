# R file for First Plot : Global Active Power vs Frequency
power <- read.csv("../household_power_consumption.txt",sep = ";",na.strings = "?",stringsAsFactors = FALSE)
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007"  )
power$DateTime <- paste(power$Date,power$Time,sep = " ")
power$DateTime <- as.POSIXct((strptime(power$DateTime,"%d/%m/%Y %H:%M:%S")))
png("plot1.png",width = 480, height = 480)
with(power,hist(Global_active_power,col = "red", main = "Global Active Power",xlab = "Gloabl Active Power (kilowatts)", ylab = "Frequency"))
dev.off()