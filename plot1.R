df <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")
subset_df <- subset(df, Date>="2007-02-01" & Date<='2007-02-02')

# Plot 1
global_active <- subset_df$Global_active_power
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(global_active), col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()