# read the data from file
df<-read.table('household_power_consumption.txt', header=TRUE, sep=";")
df<-df[(df$Date=="1/2/2007")|(df$Date=="2/2/2007"),]

# assign both data time info to Time column
df$Time <-strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#convert to numeric column
df$Global_active_power <- as.numeric(df$Global_active_power)

#set graphic layout
par(mfcol = c(1, 1))

#plot in the file
dev.copy(png, file='plot2.png')
with(df, plot(Time, Global_active_power, xlab = '', type ="l",
              ylab='Global Active Power (kilowatts)'))
dev.off()
