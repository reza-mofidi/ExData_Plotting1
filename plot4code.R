## Download the database and unzip the file
if(!file.exists("~/data")){dir.create("~/data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="~/data/UCI_datset.zip")

if(!file.exists("~/data/UCI_datset")){
  unzip("~/data/UCI_datset.zip", exdir="~/data")
}

## read the datafile and create a subset which includesmeasurements between 1/2/2007 and 2/2/2007
dataset<- "~/data/household_power_consumption.txt"
UCIdataset<- read.table(dataset, header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
UCIsubset<- UCIdataset[UCIdataset$Date %in% c("1/2/2007","2/2/2007") ,]

##Create png file and structure UCIsubsetdata by changing Global Active power, and submetering 1-3 enteries in UCIsubset to numeric vectors.
d_t<- strptime(paste(UCIsubset$Date, UCIsubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power<- as.numeric(UCIsubset$Global_active_power)
Global_reactive_Power<- as.numeric(UCIsubset$Global_reactive_power)
voltage<- as.numeric(UCIsubset$Voltage)
sub_metering_1<- as.numeric(UCIsubset$Sub_metering_1)
sub_metering_2<- as.numeric(UCIsubset$Sub_metering_2)
sub_metering_3<- as.numeric(UCIsubset$Sub_metering_3)

##create plot-4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(d_t, Global_Active_Power, type="l", xlab= "", ylab = "Global Active Power(kilowatts)" )
plot(d_t, voltage, type="l", xlab= "date and Time", ylab = "Voltage")
plot(d_t, sub_metering_1 , type="l", xlab= "", ylab = "Energy Submetering")
lines(d_t, sub_metering_2 , type="l", col="red")
lines(d_t, sub_metering_3 , type="l", col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, lwd=2, col = c("black", "red", "blue"))
plot(d_t, Global_reactive_Power, type="l", xlab= "date and Time", ylab = "Global_reactive_Power")
dev.off()
