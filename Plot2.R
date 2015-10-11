plot2 <- function(){
  ##download zip file and extract household_power_consumption.txt
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep=';')
  unlink(temp)
  
  ##subset of data between February 1, 2007 & February 2, 2007
  data$Time <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
  
  ##Create line chart
  plot(data2$Time, as.numeric(as.character(data2$Global_active_power)), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
}