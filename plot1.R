
# read and clean data
raw_data <- read.table('household_power_consumption.txt', header=TRUE, 
                   na.strings="?", sep=";", as.is=TRUE)

full_data <- raw_data
full_data$Date <- as.Date(full_data$Date, format='%d/%m/%Y')

data <- subset(full_data, full_data$Date == as.Date('2007-02-01') 
            | full_data$Date == as.Date('2007-02-02'))

remove(full_data, raw_data)

# plot data
png(file='plot1.png')

hist(data$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()





