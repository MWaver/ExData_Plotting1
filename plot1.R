
# LOADING THE DATA

    # Reading the file
    df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

    # Converting date variable to date format / 
    # Subsetting dates to shorten future processing time
    df$Date <- strptime(df$Date, format = "%d/%m/%Y")
    df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

# GENERATING THE PLOT
    
    png("plot1.png", width = 480, height = 480)
    hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
    