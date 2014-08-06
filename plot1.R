#Coursera: Exploratory Data Analysis Assignment 1 file 1


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

#Plot 1
png("plot1.png",height=480, width = 480)
hist(subx$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power", col="red")
dev.off()