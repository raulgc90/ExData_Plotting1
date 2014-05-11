
# Read and clean data
raw_data <- read.table('household_power_consumption.txt', header=TRUE, 
                   na.strings="?", sep=";", as.is=TRUE)

full_data <- raw_data
full_data$Date <- as.Date(full_data$Date, format='%d/%m/%Y')

full_data$Time = strptime(paste(format(full_data$Date), full_data$Time, 
                                sep=" "), format="%Y-%m-%d %H:%M:%S")

data <- subset(full_data, full_data$Date == as.Date('2007-02-01') 
            | full_data$Date == as.Date('2007-02-02'))

remove(full_data, raw_data)

# Plot
png(file='plot4.png')

par(mfrow=c(2,2))

# 1,1
with(data, plot(Time, Global_active_power, type="n", xlab="",
                ylab="Global Active Power"))
with(data, lines(Time, Global_active_power))

# 1,2
with(data, plot(Time, Voltage, type="n", xlab="datetime"))
with(data, lines(Time, Voltage))


# 2,1
with(data, plot(Time, Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering"))
with(data, lines(Time, Sub_metering_1, col="black"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))

legend("topright", lty=1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"))

# 2,2
with(data, plot(Time, Global_reactive_power, type="n", xlab="datetime"))
with(data, lines(Time, Global_reactive_power))

dev.off()


