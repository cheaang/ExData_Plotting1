df <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")
subset_df <- subset(df, Date>="2007-02-01" & Date<='2007-02-02')

# Plot 2
png(filename="plot2.png", width = 480, height = 480, units = "px")
subset_df <- within(subset_df, { timestamp=strptime(paste(Date, Time), "%Y-%m-%d%H:%M:%S") })
with(subset_df, plot(timestamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()