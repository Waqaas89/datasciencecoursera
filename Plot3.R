# Read data file as a table, while skipping the headers and choosing a suitable delimiter
# Name the headers separately. Afterwards subset the power consumption data for required time period
# Then plot the data using a histogram, which is a basic plot function
power <- read.table("household_power_consumption.txt", skip = 1)
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                  "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subpower <- subset(power, power$Date == 2007-02-01 | power$Date == 2007-02-02)

# Transforming the Date and Time columns from characters to objects of the type Date and POSIXlt 
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H/%M/%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot data using base plotting function and with() to add multiple plots in the same graph
# In the end, add legend in a topright position
plot(subpower$Time, subpower$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering")
with(subpower, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(subpower, lines(Time, as.numeric(as.character(Sub_metering_2)), col ="red"))
with(subpower, lines(Time, as.numeric(as.character(Sub_metering_3)), col ="blue"))
legend("topright", lty = 1, col = c("black,"red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")
