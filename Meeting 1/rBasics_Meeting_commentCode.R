performance=c(10, 9, 7, 8, 2, 10, 8, 3, 6, 9)
performance
View(performance)
extraCredit=c(1,1,1,1,1,5,1,1,2,0)
newPerformance=performance+extraCredit

gradeBook_1=cbind(performance,extraCredit)
gradeBook_1
View(gradeBook_1)
nrow(gradeBook_1)
ncol(gradeBook_1)
dim(gradeBook_1)
rownames(gradeBook_1)
colnames(gradeBook_1)

gradeBook_2=rbind(performance,extraCredit)
View(gradeBook_2)
nrow(gradeBook_2)
ncol(gradeBook_2)
dim(gradeBook_2)
rownames(gradeBook_2)[2]
colnames(gradeBook_2)

gradeBook_3=cbind(performance, extraCredit, newPerformance)
View(gradeBook_3)
dim(gradeBook_3)
gradeBook_3[,1]
gradeBook_3[,3]
gradeBook_3[6,]
gradeBook_3[1:5,2]
length(dim(gradeBook_3))
dim(gradeBook_3)[2]

passed=c("passed", "passed", "passed", "passed", "failed", "passed", "passed", "failed", "passed", "passed")
gradeBook_3=cbind(gradeBook_3,passed)
dim(gradeBook_3)
gradeBook_3[,4]

write.csv(gradeBook_3,"E:/Work/Multicultural Business Institute/R/Grade Book.csv")
#change with your own path to be able to run it
#####!!!when writing the location/path use "/". Ubuntu and Mac users: copies the path with "/". Windows users: copies the path with "\" - change it in R.
gradeBook=read.csv("E:/Work/Multicultural Business Institute/R/Grade Book.csv")

colnames(gradeBook)
gradeBook$passed
View(gradeBook$passed)