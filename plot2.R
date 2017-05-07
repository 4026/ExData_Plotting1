source("load_data.R")


# Function to plot a histogram of global active power values.
plot2 <- function() {
    if (!exists("power_consumption")) {
        power_consumption <<- load_data()
        
    }
    
    png("plot2.png", width=480, height=480, units="px")
    with(
        power_consumption, 
        plot(
            Time, 
            Global_active_power, 
            type = "l", 
            xlab="", 
            ylab = "Global Active Power (kilowatts)"
        )
    )
    dev.off()
}