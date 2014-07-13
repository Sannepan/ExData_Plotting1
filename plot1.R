##-------------------------------------------------------
## plot1.R
## ------------------------------------------------------

## Load the data
d <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=T)

d$Date <- as.Date(d$Date , "%d/%m/%Y")

d1 <- subset(d, (d$Date == as.Date('2007-02-01') | d$Date == as.Date('2007-02-02')))

## Create the plot in png format
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

hist(d1$Global_active_power, nclass=12, col="red", xlab="Global Active Power (kilowatts)", ylab='Frequency', main="Global Active Power")

dev.off()
