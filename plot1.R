# Set my working directory
setwd("~/Studium/Weiterbildungen/R/Exploratory_DataAnalysis/Assignment1")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Only take the data from the specific timespan
timespan <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_ready <- as.Date(timespan$Date, format="%d/%m/%Y")


# Save and make my histogram
png("plot1.png", width = 480, height = 480)
hist(timespan$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


# Close the histogramm in R to be able to open the png file 
dev.off()

