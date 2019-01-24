x <- 94842

if(x==94842)
{
  print("TRUE")
}else
{
  print("FALSE")
}


x<-NA
print(is.na(x))


y= 25

if(y< -12 || y>29)
{
  print("TRUE")
} else
{
  print("FALSE")
}

x=3

if(x%%2==1 && ((x> -8 && x< 12) || (x> 100 && x< 150)))
{
  print("true")
} else
{
  print("false")
}




alice.prefs <- c("Twitter", "Chrome", "Mac", "Summer")
bob.prefs <- c("Twitter", "Chrome", "Summer", "Mac")
print(all(alice.prefs==bob.prefs))
print(any(alice.prefs==bob.prefs))


age <- c(18, NA, 25, 71, NA, 45, NA, NA, 18)
print(is.na(age))

print(age[is.na(age)])

index=c()
i=1
k=1
for(val in age)
{
  if(is.na(val))
  {
    print(i)
    index[k]=i
    k=k+1
  }
  i=i+1
}
index=(index)*-1
print(index)

print(age[index])
print(age[!is.na(age)])












