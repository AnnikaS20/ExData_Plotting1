# Set my working directory 
setwd("~/Studium/Weiterbildungen/R/Exploratory_DataAnalysis/Assignment1")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Only take the data from the specific timespan
timespan <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_ready <- as.Date(timespan$Date, format="%d/%m/%Y")
# Concatenate Date + Time 
List_DateAndTime <- paste(data_ready, timespan$Time) 
# Use a date-time conversion function 
List_DateAndTime_Converted <- as.POSIXct(List_DateAndTime)

# I need to change my timezone to have the right abbreviations on the x-axis
Sys.setlocale("LC_TIME", "English")

# Make and save my plot
png("plot3.png", width = 480, height = 480)
with(timespan, {
  plot(Sub_metering_1~List_DateAndTime_Converted, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~List_DateAndTime_Converted,col='Red')
  lines(Sub_metering_3~List_DateAndTime_Converted,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the diagram in R to be able to open the png file 
dev.off()
