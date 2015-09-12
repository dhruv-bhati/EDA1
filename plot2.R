data1 <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
data2 <- subset(data1, strptime(data1$Date,"%d/%m/%Y") == strptime("01/02/2007","%d/%m/%Y") | strptime(data1$Date,"%d/%m/%Y") == strptime("02/02/2007","%d/%m/%Y"))
for(i in 1:dim(data2)[1]) {
  data2[i,"Temp"] <- as.character(strptime(paste0(data2[i,"Date"],data2[i,"Time"]), "%d/%m/%Y%H:%M:%S"))
}
plot(strptime(data2$Temp,"%Y-%m-%d %H:%M:%S"), data2$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.copy(png, file = "plot2.png")
dev.off()
