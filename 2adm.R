install.packages("rpart")
install.packages("rpart.plot");
install.packages("caret");
install.packages("lattice");
install.packages("dbscan");
install.packages("pROC");
install.packages("cluster");
#useful for confusion matrix
library(pROC)
library(rpart)
library(caret)
#classification tree using rpart
library(rpart.plot)
library(lattice);
library(cluster);
#to plot the model
#listing out the libraries
library(readxl)
mydata <- read_excel("C:/Users/karthik/Desktop/iris.xlsx")
mydata<-mydata[,-c(5,5)]

result<- kmeans(mydata,4)
resnew<- daisy(mydata)
plot(silhouette(result$cluster, resnew), col=4:1, border=NA)