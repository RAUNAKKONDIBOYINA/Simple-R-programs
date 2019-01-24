reset=0
while(TRUE)
{
  if(reset==0)
  {
    flag=0
    total=0
    array=c()
    i=1
    print("enter 1st integer")
    n<-readline()
    n<-as.integer(n)
    
    print("enter 2nd integer")
    m<-readline()
    m<-as.integer(m)
    k=0
    print("enetr operator")
    o<-readline()
    print(o)
    
    array[i]=n
    array[i+1]=m
    i=i+2
    while(TRUE)
    {
      if(o=='+')
      {
        if(flag==0)
        {
          total=m+n
          flag=1
        }
        else
        {
          total=total+k
        }
      }
      if(o=='-')
      {
        if(flag==0)
        {
          total=n-m
          flag=1
        }
        else
        {
          total=total-k
        }
      }
      if(o=='*')
      {
        if(flag==0)
        {
          total=n*m
          flag=1
        }
        else
        {
          total=total*k
        }
      }
      if(o=='/')
      {
        if(flag==0)
        {
          total=n/m
          flag=1
        }
        else
        {
          total=total/k
        }
      }
      if(o=='sd')
      {
        if(flag==0)
        {
          total=sd(array)
          flag=1
        }
        else
        {
          total=sd(array)
        }
      }
      if(o=='mean')
      {
        if(flag==0)
        {
          total=mean(array)
          flag=1
        }
        else
        {
          total=mean(array)
        }
      }
      if(o=='median')
      {
          array=sort(array)
          if((i-1)%%2==0)
          {
            total=(array[i/2]+array[(i/2)+1])/2
          }
          else
          {
            total=array[((i-1)+1)/2]
          }
          flag=1
        
      }
      if(o=='mode')
      {
        
          array=sort(array)
          if(i%%2==0)
          {
            median_a=(array[i/2]+array[(i/2)+1])/2
          }
          else
          {
            median_a=array[(i+1)/2]
          }
          
          mean_a=mean(array)
          total=(3*median_a)-(2*mean_a)
          flag=1
        
        
      }
      print("total=")
      print(total)
      print("enter 0 or 1 reset option")
      reset=readline()
      reset=as.integer(reset)
      if(reset==0)
      {
        break
      }
      else
      {
        print("enter another number")
        k=readline()
        k=as.integer(k)
        array[i]=k
        i=i+1
        print("enter operator")
        o=readline()
      }
      
    }
    
  }
}
