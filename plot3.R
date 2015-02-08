# read the data from file
df<-read.table('household_power_consumption.txt', header=TRUE, sep=";")
df<-df[(df$Date=="1/2/2007")|(df$Date=="2/2/2007"),]

# assign both data time info to Time column
df$Time <-strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#convert to numeric column
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#set graphic layout
par(mfcol = c(1, 1))

#plot in the file
dev.copy(png, file='plot3.png')
with(df, plot(Time, Sub_metering_1, xlab = '', type ="n",
              ylab='Energy sub metering'))
with(df, points(Time, Sub_metering_1,  type ="l"))
with(df, points(Time, Sub_metering_2,  type ="l", col="red"))
with(df, points(Time, Sub_metering_3,  type ="l", col="blue"))

legend("topright", pch=NA, lwd=1, lty=1,col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

