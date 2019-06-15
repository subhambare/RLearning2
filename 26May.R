
install.packages("randomForest")
library(randomForest)
A = data.frame(ISLR::Hitters)
str(A)
B = na.omit(A)
sf = sample(2,nrow(B),replace = TRUE,prob = c(0.7,0.3))
trd = B[sf == 1,]
tsd = B[sf == 2,]

#---------FOREST---------

rf = randomForest(League ~ .,data = trd,na.action = na.pass,ntree = 5)
pred = predict(rf,tsd)
cbind(pred,tsd$League)
cm = table(pred,Actual = tsd$League)
misclassification_rf = (1-(sum(diag(cm))/nrow(tsd))) * 100
misclassification_rf

#----TREE-----
install.packages("rpart")
library(rpart)
#tr = tree::tree(League ~ .,data = trd,na.action = na.pass)
tr = rpart::rpart(League ~ .,data = trd,na.action = na.pass)
predtr = predict(tr,tsd)
W = ifelse(predtr[,1]>0.5,"A","N")
cbind(W,tsd$League)
cm1 = table(W,tsd$League)
misclassification_tr = (1-(sum(diag(cm1))/nrow(tsd))) * 100
misclassification_tr


#ifelse()

#=============KNN=============
install.packages("caret")
install.packages("e1071")
library(caret)
ISLR::OJ
A = data.frame(iris)
sf = sample(2,nrow(A),replace = TRUE,prob = c(0.7,0.3))
trd = A[sf == 1,] 
tsd = A[sf == 2,] 

tc = trainControl(method = 'cv',number = 6,verboseIter = TRUE)

model1 = train(Species ~ . ,
               data = trd, 
               method = 'knn', 
               trControl = tc, 
               preProc = c("center","scale"))

pred = predict(model1,tsd)
cbind(pred,actual = tsd$Species)

cm1=   table(pred,actual = tsd$Species)
cm1
cclass =(sum(diag(cm))/nrow(tsd))*100
mclass = 100-cclass
mclass

library(class)
cl = factor(c(rep("s", 25), rep("c"), 25),c("v", 25))

pred = predict(model1,tsd)
cbind(pred,actual = tsd$Species)

cm1=   table(pred,actual = tsd$Species)
cclass =(sum(diag(cm))/nrow(tsd))*100
mclass = 100-cclass

