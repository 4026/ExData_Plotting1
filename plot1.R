source("load_data.R")


# Function to plot a histogram of global active power values.
plot1 <- function() {
    if (!exists("power_consumption")) {
        power_consumption <<- load_data()
        
    }
    
    png("plot1.png", width=480, height=480, units="px")
    hist(
        power_consumption$Global_active_power, 
        col="red", 
        main="Global active power", 
        xlab = "Global Active Power (kilowatts)"
    )
    dev.off()
}