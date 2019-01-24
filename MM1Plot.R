source("MM1Sim1.R")
i=1
j=0
x=seq(0.1, 0.9, by=0.1)
timeAvg=c()
theTimeAvg=c()
avgWaitingTime=c()
theAvgWaitingTime=c()
avgSystemTime=c()
theAvgSystemTime=c()
while(i!=10)
{
  j=1
  mm1data(i, 10)
  data= read.table("new.txt",header=F,sep=" ")
  while(j!=10)
  {
    mm1data(i, 10)
    z= read.table("new.txt",header=F,sep=" ")
    data=data+z
    j=j+1
  }
  data=data/10
  pho=i/10
  timeAvg[i]=data[1:1,1:1]
  avgWaitingTime[i]=data[2:2, 1:1]
  avgSystemTime[i]=data[3:3, 1:1]
  theTimeAvg[i]=(pho*pho)/(1-pho)
  theAvgWaitingTime[i]=theTimeAvg[i]/i
  theAvgSystemTime[i]=theTimeAvg[i]/(pho*i)
  i=i+1
}
png(file = "Time Average.jpg")
plot(x, timeAvg, type="o", col = "red", xlab = "Pho", ylab = "Time Average in Queue",main = "Time Average Chart")
legend("topleft", legend=c("Calculated", "Theoretical"),col=c("red", "blue"), lty=1:1, cex=0.8)
par(new=TRUE)
plot(x, theTimeAvg, type="o", axes=FALSE, col = "blue", xlab = "Pho", ylab = "Time Average in Queue",main = "Time Average Chart")
dev.off()
png(file = "Average Waiting Time.jpg")
plot(x, avgWaitingTime, type="o", col = "red", xlab = "Pho", ylab = "Average Waiting Time",main = "Average Waiting Time Chart")
legend("topleft", legend=c("Calculated", "Theoretical"),col=c("red", "blue"), lty=1:1, cex=0.8)
par(new=TRUE)
plot(x, theAvgWaitingTime, type="o", axes=FALSE, col = "blue", xlab = "Pho", ylab = "Average Waiting Time",main = "Average Waiting Time Chart")
dev.off()
png(file = "Average System Time.jpg")
plot(x, avgSystemTime, type="o", col = "red", xlab = "Pho", ylab = "Average System Time",main = "Average System Time Chart")
legend("topleft", legend=c("Calculated", "Theoretical"),col=c("red", "blue"), lty=1:1, cex=0.8)
par(new=TRUE)
plot(x, theAvgSystemTime, type="o", axes=FALSE, col = "blue", xlab = "Pho", ylab = "Average System Time",main = "Average System Time Chart")
dev.off()