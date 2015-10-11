plot4 <- function(){
  ##download zip file and extract household_power_consumption.txt
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep=';')
  unlink(temp)
  
  ##subset of data between February 1, 2007 & February 2, 2007
  data$Time <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
  
  ##create plot space
  par(mfrow = c(2,2))
  
  ##plot 1
  plot(data$Time, as.numeric(as.character(data$Global_active_power)), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  ##plot2
  plot(data$Time, as.numeric(as.character(data$Voltage)), type="l", ylab = "Voltage", xlab = "datetime")
  
  ##plot3
  plot(data$Time, as.numeric(as.character(data$Sub_metering_1)), type="n", xlab = "", ylab = "Energy sub metering")
  lines(data$Time, as.numeric(as.character(data$Sub_metering_1)), col="Black")
  lines(data$Time, as.numeric(as.character(data$Sub_metering_2)), col="Red")
  lines(data$Time, as.numeric(as.character(data$Sub_metering_3)), col="Blue")
  legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"), lty=c(1,1), merge=FALSE)
  
  ##plot4
  plot(data$Time, as.numeric(as.character(data$Global_reactive_power)), type="l", ylab = "Global_reactive_power", xlab = "datetime")
}