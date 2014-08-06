##Coursera: Exploratory Data Analysis Assignment 1 file 3


#Check to see if the data file is in the directory and get it if not
if(!file.exists("household_power_consumption.txt")){
        url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, "temp.zip")
        unzip("temp.zip",exdir=".")
}



x<-read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?" )

#subset to relevant dates, February 
subx<-x[x$Date=="1/2/2007" | x$Date =="2/2/2007",]
rm(x)

#create date/time variables in proper format
subx$fDate<-as.Date(subx$Date,format="%d/%m/%Y")
subx$DateTime<-strptime(paste(subx$Date,subx$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 4

png("plot4.png",height=480,width=480)
par(mfcol=c(2,2))
##Panel 1 #Same as plot 2
plot(subx$DateTime,subx$Global_active_power,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(subx$DateTime,subx$Global_active_power)

##Panel 2 #Same as plot 3
plot(subx$DateTime,subx$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering")
lines(subx$DateTime,subx$Sub_metering_1, col="black")
lines(subx$DateTime,subx$Sub_metering_2, col="red")
lines(subx$DateTime,subx$Sub_metering_3, col="blue")
legend(x="topright", col=c("black","red","blue"), lwd=1,legend=names(subx[c(7,8,9)]), 
       cex=0.9,  bty="n")

##Panel 3
plot(subx$DateTime,subx$Voltage,type = "n", xlab="datetime",ylab="Voltage")
lines(subx$DateTime,subx$Voltage)

##Panel 4
plot(subx$DateTime,subx$Global_reactive_power,type = "n", xlab="datetime",
     ylab=names(subx)[4])
lines(subx$DateTime,subx$Global_reactive_power)
dev.off()
