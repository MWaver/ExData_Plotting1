
# LOADING THE DATA

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

png("plot3.png", width = 480, height = 480)
plot(df$DateTime,df$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col = "red", type = "l")
lines(df$DateTime, df$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = "solid", col = c("black","red","blue"))
dev.off()
