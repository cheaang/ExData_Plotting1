df <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")
subset_df <- subset(df, Date>="2007-02-01" & Date<='2007-02-02')

# Plot 3
png(filename="plot3.png", width = 480, height = 480, units = "px")
subset_df <- within(subset_df, { timestamp=strptime(paste(Date, Time), "%Y-%m-%d%H:%M:%S") })
with(subset_df, plot(timestamp, Sub_metering_1, type="l", ylab="Energy sub Metering", xlab=""))
lines(subset_df$timestamp, subset_df$Sub_metering_2, col='red')
lines(subset_df$timestamp, subset_df$Sub_metering_3, col='blue')
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()