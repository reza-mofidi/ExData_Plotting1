## Download the database and unzip the file this is same as plot1
if(!file.exists("~/data")){dir.create("~/data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="~/data/UCI_datset.zip")

if(!file.exists("~/data/UCI_datset")){
  unzip("~/data/UCI_datset.zip", exdir="~/data")
}

## read the datafile and create a subset which includes measurements between 1/2/2007 and 2/2/2007 this is same as plot1
dataset<- "~/data/household_power_consumption.txt"
UCIdataset<- read.table(dataset, header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
UCIsubset<- UCIdataset[UCIdataset$Date %in% c("1/2/2007","2/2/2007") ,]

## ##Create png file and draw the plot2
d_t<- strptime(paste(UCIsubset$Date, UCIsubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
Global_Active_Power<- as.numeric(UCIsubset$Global_active_power)
plot(d_t, Global_Active_Power, type="l", xlab= "", ylab = "Global Active Power(kilowatts)" )
dev.off()

