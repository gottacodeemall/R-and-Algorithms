install.packages("rpart")
install.packages("rpart.plot");
install.packages("caret");
install.packages("lattice");
install.packages("dbscan");
install.packages("e1071");
install.packages("rminer");
install.packages("igraph")
library(e1071)
library(rminer)
#useful for confusion matrix
library(rpart)
library(caret)
#classification tree using rpart
library(rpart.plot)
library(lattice);
#to plot the model
#listing out the libraries
library(readxl)
data_url <- c("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data");
download.file(url=data_url,destfile = "car.data");
mydata <- read.csv("car.data",sep=",",header=FALSE)
View(mydata)
#importing dataset

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

naivemodel<-naiveBayes(V7~.,data=train);

test_pred<-predict(naivemodel,newdata=test);
confusionMatrix(test_pred,test$V7);
result<- table(test_pred,test$V7)
precision <- result[1][1]/(sum(result[1,]));    
recall <- result[1][1]/(sum(result[,1])); 
f_measure <- 2 * ((precision * recall) / (precision + recall))
precision
recall
f_measure
pred<- predict(naivemodel,test,type='raw')
auc<-auc(test$V7,pred[,2])
plot(roc(test$V7,pred[,2]))

