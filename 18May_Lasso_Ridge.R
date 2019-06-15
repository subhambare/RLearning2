A = read.csv(file.choose())
str(A)
fivenum(A$PROFIT)
A$PR0FIT_TYPE=ifelse(A$PROFIT<=107978,0,1)
A$PR0FIT_TYPE = as.factor(A$PR0FIT_TYPE)
sf = sample(2,nrow(A),replace = TRUE,prob = c(0.8,0.2))
trd = A[sf==1,]
tsd = A[sf==2,]
model1 = glm(PR0FIT_TYPE ~ RND+MKT+ADMIN,data = trd,family = "binomial")
pred = predict(model1,tsd)
w = ifelse(pred <= 0.5,0,1)
cm = table(predicted = w,actual = tsd$PR0FIT_TYPE)
cbind(tsd$PR0FIT_TYPE,w)