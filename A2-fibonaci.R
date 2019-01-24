a <- readline(prompt="Enter an integer 1: ")
a <- as.integer(a)

b <- readline(prompt="Enter an integer 2: ")
b <- as.integer(b)

n <- readline(prompt="Enter no. of fib: ")
n <- as.integer(n)

i=3
c=0
while(i<=n)
{
  c=a+b
  a=b
  b=c
  i=i+1
}

print(c)
