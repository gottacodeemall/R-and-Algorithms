install.packages("rpart")
install.packages("rpart.plot");
install.packages("caret");
install.packages("lattice");
install.packages("dbscan");
install.packages("pROC");
install.packages("factoextra")
#useful for confusion matrix
library(cluster);
library(pROC);
library(rpart);
library(caret);
#classification tree using rpart
library(rpart.plot);
library(lattice);
library(dbscan);
library(fpc)
library(factoextra)
#to plot the model
#listing out the libraries
library(readxl)
mydata <- read_excel("C:/Users/karthik/Desktop/iris.xlsx")
mydata<-mydata[,-c(5,5)]


result<- fpc::dbscan(mydata,eps=0.5,minPts=5)
fviz_cluster(result,data=mydata,stand=FALSE,ellipse=FALSE,show.clust.cent=FALSE,geom="point",palette="jco",ggtheme=theme_classic())