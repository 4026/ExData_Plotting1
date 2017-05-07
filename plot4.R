source("load_data.R")


# Function to plot several time series charts for power consumption data.
plot4 <- function() {
    if (!exists("power_consumption")) {
        power_consumption <<- load_data()
        
    }
    
    png("plot4.png", width=480, height=480, units="px")
    par(mfcol=c(2,2))
    with(power_consumption, {
        
        # Top left chart
        plot(Time, Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
        
        # Bottom left chart
        plot(Time, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
        lines(Time, Sub_metering_2, col="red")
        lines(Time, Sub_metering_3, col="blue")
        legend(
            "topright", 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col=c("black", "red", "blue"), 
            lwd=1,
            bty="n"
        )
        
        #Top right chart
        plot(Time, Voltage, type = "l", xlab="datetime", ylab = "Voltage")
        
        #Bottom right chart
        plot(
            Time, 
            Global_reactive_power, 
            type = "l", 
            xlab="datetime", 
            ylab = "Global_reactive_power"
        )
    })
    
    dev.off()
}