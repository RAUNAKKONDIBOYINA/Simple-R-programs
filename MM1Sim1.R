mm1data= function(arrivalRate, serviceRate)
{
x= seq(1, 5000, by=1)
arrivalTime=rexp(5000, arrivalRate)
serviceTime=rexp(5000, serviceRate)
totalTime=10000
arrivalTime=cumsum(arrivalTime)
busy=FALSE
x=1
currTime=arrivalTime[1]
que=list()
nservice=1
busyTime=1000000
prevScheduled=0
iQt=0
totWaitingTime=0
totSystemTime=0
ws=0
while(currTime <= totalTime)
{
  iQt=iQt+length(que)*(currTime-prevScheduled)
  if (currTime==arrivalTime[x])
  {
    que=append(que, currTime)
    x=x+1
  }
  if (busy==FALSE && length(que)!=0)
  {
    c=que[1]
    c=unlist(c)
    busy=TRUE
    busyTime=currTime+serviceTime[nservice]
    totWaitingTime=totWaitingTime+currTime-c
    ws=ws+1
    que[1]=NULL
  }
  if (currTime==busyTime)
  {
    busy=FALSE
    totSystemTime=totSystemTime+currTime-arrivalTime[nservice]
    nservice=nservice+1
    if (busy==FALSE && length(que)!=0)
    {
      c=que[1]
      c=unlist(c)
      busy=TRUE
      busyTime=currTime+serviceTime[nservice]
      totWaitingTime=totWaitingTime+currTime-c
      que[1]=NULL
    }
    else
    {
      busyTime=1000000
    }
  }
  prevScheduled= currTime
  if (x==5001)
  {
    break;
  }
  if (busyTime>=arrivalTime[x])
  {
    currTime=arrivalTime[x]
  }
  else
  {
    currTime=busyTime
  }
}
iQt=iQt+length(que)*(totalTime-prevScheduled)
timeAvg=iQt/totalTime
avgWaitingTime=totWaitingTime/ws
avgSystemTime=totSystemTime/(nservice-1)
write.table(timeAvg, "new.txt", append = FALSE, sep = " ", dec = ".", row.names=FALSE, col.names=FALSE)
write.table(avgWaitingTime, "new.txt", append = TRUE, sep = " ", dec = ".", row.names=FALSE, col.names=FALSE)
write.table(avgSystemTime, "new.txt", append = TRUE, sep = " ", dec = ".", row.names=FALSE, col.names=FALSE)
}