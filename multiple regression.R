df <- read.csv("C:/Users/len0vo500/Machine Learning programs/Boston/0000000000002417_training_boston_x_y_train.csv")
#print(df)

col1<-df[1]
col2<-df[2]
col3<-df[3]
col4<-df[4]
col5<-df[5]
col6<-df[6]
col7<-df[7]
col8<-df[8]
col9<-df[9]
col10<-df[10]
col11<-df[11]
col12<-df[12]
col13<-df[13]
y<-df[14]

input <- df[,c("X..CRIM","ZN","INDUS","CHAS","NOX","RM","AGE","DIS","RAD","TAX","PTRATIO","B","LSTAT","Y")]
#print(input)

model <- lm(Y~X..CRIM+ZN+INDUS+CHAS+NOX+RM+AGE+DIS+RAD+TAX+PTRATIO+B+LSTAT, data = input)

print(model)
