


b=c()
x=1
b[0]=1
i=1
while(x<=990)
{
  d<-x+ sample(1:10,1)
  b[i]<-d
  i=i+1
  x<-d
}

print(b)

