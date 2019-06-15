A = data.frame(iris)
head(A)
View(A)
A = na.omit(A)
sf = sample(2,nrow(A),replace=TRUE,prob = c(0.7,0.3))
trd= A[sf==1,]
tsd=A[sf==2,]
install.packages("naivebayes")
library(naivebayes)
model1 = naive_bayes(Species~.,data = trd)
pred = predict(model1,tsd)
cbind(pred,tsd$Species)
w = table(pred,tsd$Species)
#misclassification
misclassified = (1-(sum(diag(w))/nrow(tsd)))*100
model1$data
