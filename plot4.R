##-------------------------------------------------------
## plot4.R
## ------------------------------------------------------

## Load the data
d <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=T)

d$Time <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d$Date <- as.Date(d$Date , "%d/%m/%Y")

d1 <- subset(d, (d$Date == as.Date('2007-02-01') | d$Date == as.Date('2007-02-02')))

## Change settings to get weekdays is English
Sys.setlocale("LC_TIME", "C")

## Create the plot in png format
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

## Set the plotting parameters
par(mfrow = c(2,2))

## Create plot (1, 0)
plot(d1$Time,d1$Global_active_power,ylab="Global Active Power",xlab="", type="l" )

## Create plot (0,1)
plot(d1$Time,d1$Voltage,ylab="Voltage",xlab="datetime", type="l" )

## Create plot (2,0)
## Create empty plot
plot(d1$Time,d1$Sub_metering_1,ylab="Energy Sub metering",xlab="", type="n")
## Add lines
lines(d1$Time,d1$Sub_metering_1, type="l", col="black")
lines(d1$Time,d1$Sub_metering_2, type="l", col="red" )
lines(d1$Time,d1$Sub_metering_3, type="l", col="blue" )

## Add a legend in the top right corner
legend( x="topright", 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black","red","blue"), lwd=1, lty=1)


## Create plot (0,2)
plot(d1$Time,d1$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime", type="l" )


dev.off()