install.packages("rpart")
install.packages("rpart.plot");
install.packages("caret");
install.packages("lattice");
install.packages("dbscan");
install.packages("neuralnet");
#useful for confusion matrix
library(neuralnet);
library(rpart)
library(caret)
#classification tree using rpart
library(rpart.plot)
library(lattice);
#to plot the model
#listing out the libraries
library(readxl)
library(readxl)
mydata <- read_excel("C:/Users/karthik/Desktop/data.xlsx")
View(mydata)
#importing dataset
mydata["result"]<-NA;
mydata["result"]<- ifelse(mydata["diagnosis"]=='B',0,1);

set.seed(1234)
mydata<-mydata[sample(nrow(mydata)),]

#Create 10 equally size folds
folds <- cut(seq(1,nrow(mydata)),breaks=10,labels=FALSE)

#Perform 10 fold cross validation
for(i in 1:10){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  test <- mydata[testIndexes, ]
  train <- mydata[-testIndexes, ]
  #Use the test and train data partitions however you desire...
}


a=neuralnet(formula=result~radius_mean+texture_mean+perimeter_mean+area_mean+smoothness_mean+concavity_mean,data=train,hidden=2,threshold = 0.1)
plot(a)

a=neuralnet(formula=result~radius_mean+texture_mean+perimeter_mean+area_mean+smoothness_mean+concavity_mean,data=train,hidden=0,threshold = 0.5)
plot(a)
