# R file for Second Plot : Day vs Global Active Power
power <- read.csv("../household_power_consumption.txt",sep = ";",na.strings = "?",stringsAsFactors = FALSE)
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007"  )
power$DateTime <- paste(power$Date,power$Time,sep = " ")
power$DateTime <- as.POSIXct((strptime(power$DateTime,"%d/%m/%Y %H:%M:%S")))
png("plot2.png",width = 480, height = 480)
with(power,plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.off()