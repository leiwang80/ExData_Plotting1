# read the data from file
df<-read.table('household_power_consumption.txt', header=TRUE, sep=";")
df<-df[(df$Date=="1/2/2007")|(df$Date=="2/2/2007"),]

#convert to numeric column
df$Global_active_power <- as.numeric(df$Global_active_power)

#set graphic layout
par(mfcol = c(1, 1))

#plot in the file
dev.copy(png, file='plot1.png')
with(df, hist(Global_active_power, col="red", 
              xlab='Global Active Power (kilowatts)', main ='Global Active Power'))
dev.off()