##-------------------------------------------------------
## plot2.R
## ------------------------------------------------------

## Load the data
d <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=T)

d$Time <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d$Date <- as.Date(d$Date , "%d/%m/%Y")

d1 <- subset(d, (d$Date == as.Date('2007-02-01') | d$Date == as.Date('2007-02-02')))

## Change settings to get weekdays is English
Sys.setlocale("LC_TIME", "C")

## Create the plot in png format
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

plot(d1$Time,d1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l" )

dev.off()