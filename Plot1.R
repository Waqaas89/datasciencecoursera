# Read data file as a table, while skipping the headers and choosing a suitable delimiter
# Name the headers separately. Afterwards subset the power consumption data for required time period
# Then plot the data using a histogram, which is a basic plot function
power <- read.table("household_power_consumption.txt", skip = 1)
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                  "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subpower <- subset(power, power$Date == 2007-02-01 | power$Date == 2007-02-02)
hist(as.numeric(as.character(subpower$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 

title(main ="Global Active Power")
