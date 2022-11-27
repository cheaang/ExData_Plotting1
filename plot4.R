df <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")
subset_df <- subset(df, Date>="2007-02-01" & Date<='2007-02-02')


# Plot 4
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
subset_df <- within(subset_df, { timestamp=strptime(paste(Date, Time), "%Y-%m-%d%H:%M:%S") })
#First plot
with(subset_df, plot(timestamp, Global_active_power, type="l", ylab="Global Active Power", xlab=""))
#Second plot
with(subset_df, plot(timestamp, Sub_metering_1, type="l", ylab="Energy sub Metering", xlab=""))
lines(subset_df$timestamp, subset_df$Sub_metering_2, col='red')
lines(subset_df$timestamp, subset_df$Sub_metering_3, col='blue')
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Third plot
with(subset_df, plot(timestamp, Voltage, type="l", ylab="Voltage", xlab="datetime"))
#Forth plot
with(subset_df, plot(timestamp, Global_reactive_power, type="l", xlab="datetime"))
dev.off()