# IMPORTANT: This script assumes the data file "household_power_consumption.txt" is
# present in the current working directory.

# LOADING THE DATA

    filename <- "household_power_consumption.txt"

    # Reading the file
    df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

    # Converting date variable to date format / 
    # Subsetting dates to shorten future processing time
    df$Date <- strptime(df$Date, format = "%d/%m/%Y")
    df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

    # Pasting Date & Time together into a new variable DateTime; Converting to date format.
    # NOTE: I am fully aware that this is duplicating data. However my main goal at this point
    # is to explore data/generate a graph, and not to ensure tidy data to write into a file.
    df$DateTime <- paste(df$Date, df$Time, sep = " ")
    df$DateTime <- strptime(df$DateTime, format = "%Y-%m-%d %H:%M:%S")

# GENERATING THE PLOT

    png("plot2.png", width = 480, height = 480)
    plot(df$DateTime,df$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
    