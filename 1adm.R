install.packages("rpart")
install.packages("rpart.plot");
install.packages("caret");
install.packages("lattice");
install.packages("dbscan");
install.packages("pROC");
#useful for confusion matrix
library(pROC)
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
ind <- sample(2, nrow(mydata), replace=TRUE,prob=c(0.8, 0.2))
#https://www.rdocumentation.org/packages/base/versions/3.4.1/topics/sample getting radom columns
#used to split into 2 datasets of 80% and 20% probs
train <- mydata[ind==1,]
test <- mydata[ind==2,]

trctrl <- trainControl(method="repeatedcv",number=10,repeats=3);
set.seed(3333);
dtree_gini<- train(V7~. ,data=train,method="rpart",parms=list(split="gini"),trControl=trctrl,tuneLength=10)
prp(dtree_gini$finalModel,box.palette = "Blues",tweak=1.2)

summary(mydata)
pred_gini <- predict(dtree_gini,newdata = test);
confusionMatrix(test$V7,pred_gini)

result<- table(pred_gini,test$V7)
precision <- result[1][1]/(sum(result[1,]));    
recall <- result[1][1]/(sum(result[,1])); 
f_measure <- 2 * ((precision * recall) / (precision + recall))
precision
recall
f_measure




pred<- predict(dtree_gini,test,type='prob')
auc<-auc(test$V7,pred[,2])
plot(roc(test$V7,pred[,2]))