a<-c(seq(5,160,by=5))
print(a)

b<-seq(87,56,-1)
print(b)

print("a*b")
d<-a*b
print(d)

print("19,20,21")
d[c(19,20,21)]

s<-d<2000
print(s)

print("d<2000")
s2<-d[s]
print(s2)

s3<-d>6000
print(s3)

s4<-d[s3]
s4
print("no. of elements in d>6000")
print(length(s4))

print("sum of d")
print(sum(d))

print("median")
print(median(d))

print("standard deviation")
print(sd(d))
