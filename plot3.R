# R file for Third Plot : Day vs Energy Sub Metering
power <- read.csv("../household_power_consumption.txt",sep = ";",na.strings = "?",stringsAsFactors = FALSE)
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007"  )
power$DateTime <- paste(power$Date,power$Time,sep = " ")
power$DateTime <- as.POSIXct((strptime(power$DateTime,"%d/%m/%Y %H:%M:%S")))
png("plot3.png",width = 480, height = 480)
with(power,plot(DateTime,Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering"))
with(power,lines(DateTime,Sub_metering_1, col = "black"))
with(power,lines(DateTime,Sub_metering_2, col = "red"))
with(power,lines(DateTime,Sub_metering_3, col = "blue"))
with(power,legend("topright", lty = 1, lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
dev.off()