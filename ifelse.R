#---scalar variables

A=10
B="String"
C=1:10
import sqldf

#-----vector - Columner data
B = c(A, 8, 34, 43)


#---List
B = list(1:3,2)

#---Array

#---Seq functions
A = seq (0,100,by = 2)

#----Matrix repesentation of data
a = matrix(1:20, nrow=3, ncol=4, byrow=TRUE)


#--- Data frames, tabular representation of data
employees = data.frame(eid, fn, sal, ln)
employees = data.frame(eid, fn, sal, ln, stringsAsFactors = FALSE)
str(employees)
employees[1,]
employees[c(1,2),]
employees[,]
write.csv(employees,"c:\abc.csv")
graphics.off(employees)

employees = employees(employees, did)
employees = data.frame(employees, did)
graphics.off(employees)
A = read.csv("c:/abc2.csv")
view(A)

#------If else---------

if ( i %% 2 == 1 ) {
  
  print("Number if odd")
  print("if psrt got executed")
  
}  else {
  print("number is even")
  print("else part got executed")
}

#-------nested if else------

a=10
b=20
c=30

if ( a > b & a > c )  print("a is greater") else
  if ( b > c & b > a )  print("b is greater") else
    if ( c > a & c > b)  print("c is greater") else
      if ( a == b & b== c )  print ("all are equeal")

#---ifelse statement

ifelse(a>b,a,b)
ifelse(a>b,{print("1st stmt");print("2nd stmt")},b)


#--read what is sampling with replacement

#---
A= read.csv(file.choose())
sf=sample(2,nrow(A), replace=TRUE, prob=c(0.6,0.4))
trd = A[sf==1,]
tsd = A[sf==2,]
nrow(A)
ncol(A)
set.seed(1122)
length(sf)

B=read.csv(file.choose(), col.names = c("C1","C2", "C3", "C4", "C5"), header=FALSE)

B[-2,]


#--- Install packages
install.packages("sqldf")
library(sqldf)

#--- few more packages installed with datasets

install.packages("MASS")
install.packages("ISLR")

sqldf
dplyr


2 teams
data manupuation reporting 
reprting and further 

sqldf("select income, student from A where student = 'Yes' and income > 100")
A = ISLR::Credit
sqldf("select * from trees")
 
sqldf("select `limit`, income, student from A where student = 'Yes' and income > 100")

#----------------------------
sqldf("select Income,student from A where student = 'Yes'")
sqldf("select Income,student from A where student = 'Yes' and income > 100")
sqldf("select * from A where student = 'Yes' and income > 100")
sqldf("select * from A where student = 'Yes' and income > 100")
sqldf("select `Limit`,Rating from A where student = 'Yes' and income > 100")
sqldf("select * from A where student = 'Yes' and income > 100")
sqldf("select * from A where Ethnicity like 'A%'")

#-------------AGRREGATES---------------
sqldf("select AVG(Income) from A")
sqldf("select AVG(Age) from A")
sqldf("select AVG(Balance) from A")
sqldf("select AVG(Limit) from A")
sqldf("select AVG(`Limit`) from A")
sqldf("select COUNT() from A")
sqldf("select COUNT() from A GROUP BY ethnicity")
sqldf("select ethnicity,COUNT() from A GROUP BY ethnicity")
sqldf("select ethnicity,avg(income) from A GROUP BY ethnicity")
sqldf("select ethnicity,sum(income) from A GROUP BY ethnicity")
sqldf("select ethnicity,max(income) from A GROUP BY ethnicity")
sqldf("select ethnicity,COUNT() from A GROUP BY ethnicity")
)")

fivenum(A$Income)
