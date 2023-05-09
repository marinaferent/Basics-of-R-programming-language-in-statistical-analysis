##Opening Wages
setwd("C:/Users/Alina-Ioana/Desktop/R/7")
wages=read.csv("Wages.csv")
View(wages)

##Plotting on scatter plot and computing correlaion
correlation=cor(wages$salary, wages$salbegin)
correlation
plot(wages$salbegin, wages$salary, main="Salary and Salbegin cross-tab analysis", xlab="Salbegin", ylab="salary", sub=paste("Correlation coefficient ",correlation))

##Saving as png
png("Cross-tab Analysis.png")
  plot(wages$salbegin, wages$salary, main="Salary and Salbegin cross-tab analysis", xlab="Salbegin", ylab="salary", sub=paste("Correlation coefficient ",correlation))
dev.off()

##Conditional statements to print corrrelation, function
statements=function(x,y,z){
  correlation=cor(x,y)
  if (correlation>0 && correlation>0.7){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so it is a high positive corrrelation between ", z[1]," and ", z[2]))
  }
  
  if (correlation>0 && correlation<0.7 && correlation>0.3){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so it is a medium positive corrrelation between ", z[1]," and ", z[2]))
  }
  
  if (correlation>0 && correlation<0.3){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so it is a low positive corrrelation between ", z[1]," and ", z[2]))
  }
  
  if (correlation<0 && abs(correlation)>0.7){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so it is a high negative corrrelation between ", z[1]," and ", z[2]))
  }
  
  if (correlation<0 && abs(correlation)<0.7 && abs(correlation)>0.3){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so it is a medium negative corrrelation between ", z[1]," and ", z[2]))
  }
  
  if (correlation<0 && abs(correlation)<0.3){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so it is a low negative corrrelation between ", z[1]," and ", z[2]))
  }
  
  if (correlation==0){
    interpretation=(paste0("The correlation coefficient is ", correlation, " so there is no correlation between ", z[1]," and ", z[2]))
  }
  
  print(interpretation)
}

statements(wages$salary,wages$salbegin,c("salary","salbegin"))

##Matrix and csv file
matrix=matrix(data=NA,nrow=1,ncol=2)
colnames(matrix)=c("Correlation","Interpretation")
matrix[1,1]=correlation
matrix[1,2]=interpretation
View(matrix) 
write.csv(matrix,"Matrix.csv")