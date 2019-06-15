A = read.csv(file.choose())
str(A)
cor(A[,c(1,2,3,5)])
set.seed(123)
sf = sample(2,nrow(A),replace = TRUE,prob = c(0.7,0.3))
trd = A[sf==1,]
tsd = A[sf==2,]
nrow(A)
nrow(trd)
nrow(tsd)
model1 = lm(PROFIT ~ RND,data = trd)
model2 = lm(PROFIT ~ RND+MKT,data = trd)
model3 = lm(PROFIT ~ RND+MKT+ADMIN,data = trd)
model4 = lm(PROFIT ~ RND+ADMIN,data = trd)

pred1 = predict(model1,tsd)
pred2 = predict(model2,tsd)
pred3 = predict(model3,tsd)
pred4 = predict(model4,tsd)

cbind(tsd,pred1,pred2,pred3,pred4)

#========================

library(ISLR)
A = data.frame(ISLR::Credit)
A = MASS::Cars93 
A = data.frame(iris)
A = data.frame(Hitters)
A = data.frame(ISLR::Wage)

191792.1 - (49120 + 0.7765*162597.7 + 0.0279*443898.5)


model3
RND = c(160000,170000)
MKT = c(450000,500000)
STATE = c("Florida","New York")
W = data.frame(RND,MKT,STATE)
pred_W = predict(model3,W)
pred_W
cbind(W,pred_W)

