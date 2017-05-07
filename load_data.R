# Function to load the data form the file and transform it into a useful format.
load_data <- function() {
    #Read file in
    power_consumption <- read.csv2(
        "household_power_consumption.txt", 
        na.strings = "?", 
        stringsAsFactors = FALSE
    )
    
    # Convert Date column to dates, and use that to limit the data to only the days we're interested 
    # in.
    power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
    relevant_dates = power_consumption$Date >= as.Date('2007-02-01') & power_consumption$Date <= as.Date('2007-02-02')
    power_consumption <- power_consumption[relevant_dates, ]
    
    #Format the other columns
    datetimes = paste(power_consumption$Date, power_consumption$Time)
    power_consumption$Time <- strptime(datetimes, "%Y-%m-%d %H:%M:%S")
    power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
    power_consumption$Global_reactive_power <- as.numeric(power_consumption$Global_reactive_power)
    power_consumption$Voltage <- as.numeric(power_consumption$Voltage)
    power_consumption$Global_intensity <- as.numeric(power_consumption$Global_intensity)
    power_consumption$Sub_metering_1 <- as.numeric(power_consumption$Sub_metering_1)
    power_consumption$Sub_metering_2 <- as.numeric(power_consumption$Sub_metering_2)
    power_consumption$Sub_metering_3 <- as.numeric(power_consumption$Sub_metering_3)
    
    power_consumption
}