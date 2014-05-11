

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
png(file='plot2.png')

with(data, plot(Time, Global_active_power, type="n", xlab="",
                ylab="Global Active Power (kilowatts)"))
with(data, lines(Time, Global_active_power))

dev.off()



