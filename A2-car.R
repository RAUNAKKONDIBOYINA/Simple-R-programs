head(cars)
attach(cars)

#hist(dist)

#plot(speed,dist)

which.min(dist)

which.max(dist)

speed<-cars$speed
dist<-cars$dist

print(speed[which.min(dist)])
