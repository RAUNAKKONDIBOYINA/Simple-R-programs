function(arrivalRate, serviceRate)
{
  arrivalTime=rexp(1000, arrivalRate)
  serviceTime=rexp(1000, serviceRate)
  arrivalTime=cumsum(arrivalTime)
}