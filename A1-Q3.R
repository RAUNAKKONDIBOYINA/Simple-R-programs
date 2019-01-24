matrix1 <- matrix(c(7,9,12,2,4,13), nrow = 2,byrow=TRUE)
print(matrix1)

matrix2 <- matrix(c(1,7,12,19,2,8,13,20,3,9,14,21), nrow = 3,byrow=TRUE)
print(matrix2)

print("multiplied matrix")
matrix3<-matrix1%*%matrix2
print(matrix3)
