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

##Create png file and draw the historam of Global Active Power
png("plot1.png", width=480, height=480)
Global_Active_Power<- as.numeric(UCIsubset$Global_active_power)
hist(Global_Active_Power, col ="red", main = "Global Active Power(kilowatts)" )
dev.off()

