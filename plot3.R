source("load_data.R")


# Function to plot a time series of sub metering values.
plot3 <- function() {
    if (!exists("power_consumption")) {
        power_consumption <<- load_data()
        
    }
    
    png("plot3.png", width=480, height=480, units="px")
    with(power_consumption, {
        plot(Time, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
        lines(Time, Sub_metering_2, col="red")
        lines(Time, Sub_metering_3, col="blue")
        legend(
            "topright", 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col=c("black", "red", "blue"), 
            lwd=1
        )
    })
    
    dev.off()
}