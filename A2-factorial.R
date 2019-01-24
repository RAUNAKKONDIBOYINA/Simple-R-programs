n <- readline(prompt="Enter an integer: ")
n <- as.integer(n)

fac=1
i=1
while(i<=n)
{
  fac=fac*i
  i=i+1
}

print("factorial")
print(fac)