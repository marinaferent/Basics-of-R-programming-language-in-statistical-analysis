read.csv("C:/Users/samyc/OneDrive/Desktop/R programming/7/wages.csv")
wages=read.csv("C:/Users/samyc/OneDrive/Desktop/R programming/7/wages.csv")
View(wages)

salary=wages[,6]
salbegin=wages[,7]
salaries=wages[,c(6,7)] ##Both salaries
wages[,c(6,7)]

pdf(file="C:/Users/samyc/OneDrive/Desktop/R programming/7/Salaries Plot.pdf")
	plot(salbegin, salary, main="Relation between Salary and Salbegin", las=1)
	abline(lm(salary ~ salbegin), col = "red", lwd = 3)
	text(paste("Correlation:", round(cor(salbegin,salary), 2)), x = 70000, y = 60000)
dev.off

if (cor(salary,salbegin)>0)
{
  print("Positive correlation")
} else 
{
  if (cor(salary,salbegin)<0)
  {
    print("Negative correlation")
  } else
  {
    print("No correlation")
  }
} 