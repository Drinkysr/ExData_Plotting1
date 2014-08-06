##Coursera: Exploratory Data Analysis Assignment 1 file 2


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

#Plot 2
subx$fDate<-as.Date(subx$Date,format="%d/%m/%Y")
subx$DateTime<-strptime(paste(subx$Date,subx$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png",height=480,width=480)
plot(subx$DateTime,subx$Global_active_power,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(subx$DateTime,subx$Global_active_power)
dev.off()
