##############################################COURSE: Basics of R programming language for statistical analysis#####################################################

#Instructor: Marina FERENT-PIPAS
#email: marinaferent@gmail.com | marina.ferent@econ.ubbcluj.ro
#accredited by Multicultural Business Institute | mcb-institute.org

##############################################################MEETING 08: Linear regression | 09.09.2020 ##############################################################
####Exercise: You are provided with a dataset <<Wages>> which contains data of about 400 employees in Thailand.
##Analyze the determinants of salary using a linear regression. Test the assuptions of the linear regression.

#Step 1: Read Wages.csv file.
setwd("E:/Multicultural Business Institute/R/Meeting 8")
dataSet=read.csv("Wages.csv")
View(dataSet)
colnames(dataSet) #will provide the names of the variables

#Step 2: Test for the normality of the dependent variable
##Option 1: Plot salary variable on a histogram

hist(dataSet$salary)

png("salary.png")
  hist(dataSet$salary, main="Distribution of salary", xlab="Salary (Thai baht)", ylab="No. of employees")
dev.off()

##Option 2: Compute skewness and kurtosis.
install.packages("moments")
library(moments)

skewness(dataSet$salary)
kurtosis(dataSet$salary)

##Option 3: Compare the measures of central tendency

#Mean vs median
mean(dataSet$salary)
median(dataSet$salary)

#Mean vs modal interval
mean(dataSet$salary)
hist(dataSet$salary)

##Option 4: Compute coefficient of variation
sd(dataSet$salary)
mean(dataSet$salary)
coeffVariation=sd(dataSet$salary)/mean(dataSet$salary)
coeffVariation

##Option 5: Perform a Jarque-Bera normality test
install.packages("normtest")
library(normtest)

jb.norm.test(dataSet$salary)
#*Interpret the result of the Jarque-Bera test in R using a conditional statement.
jarque_bera=jb.norm.test(dataSet$salary) #store the results of your test
attributes(jarque_bera)   #see the attributes of the jarque_bera object
jarque_bera$p.value       #returns only the p-value of our test

#To interpret the result:
ifelse(jarque_bera$p.value>0.05, print("Salary is normally distributed"), print("Salary is NOT normally distributed"))
  ###alternatively:
if(jarque_bera$p.value>0.05){
  print("Salary is normally distributed")
} else {
  print("Salary is NOT normally distributed")
}

#Step 2.3: Analyze the relationship between variables
##1.1.Correlogram (correlation matrix)

cor(dataSet) #by default, Pearson's correlation coefficient

#but Pearson's correlation coefficient is only suitable for quantitative continuous variables:
cor(dataSet[,c(6,7,8,9,4)]) #we only select salary, salbegin, jobtime, prevexp and educ (columns 6,7,8,9,4 of dataSet)

#We may store our correlation matrix into an R matrix and export it into a .csv file for future use
correlations=cor(dataSet[,c(6,7,8,9,4)])
View(correlations)
write.csv(correlations,"correlations.csv")

###Additionally you may use a graphical representation of the correlogram by using the function corrgram() from package "corrgram":
install.packages("corrgram")
library(corrgram)

corrgram(dataSet[,c(6,7,8,9,4)], order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="correlations")

##1.2ANOVA for 1 quantitative continuos variable and 1 qualitative variable:
anova_salaryJobcat=aov(salary~jobcat, data=dataSet)
summary(anova)

##2.Scatter plot - helps un understand the possible relation forms - other than linear (get the intuition from economic theory and visualize through graph):
plot(dataSet$salbegin, dataSet$salary)
plot(dataSet$salbegin, log(dataSet$salary))
plot(log(dataSet$salbegin), log(dataSet$salary))


#*Let's plot log(salary) against all the quantitative independent variables and store all the scatter plots into a single pdf file.
dataQuant=dataSet[,c(6,7,8,9,4)] #we create a new matrix containing salary, salbegin, jobtime, prevexp and educ

#To plot all the scatter plots, we use a for loop. In our dataQuant matrix, salary is stored in column 1 and the rest of the quantitative variables are stored in columns 2:5. 
#We export them into  scatterplots.pdf file in our working directory:
pdf("scatterplots.pdf")
  for(i in 2:5){
    plot(dataQuant[,i],log(dataSet$salary), xlab=paste0(colnames(dataQuant[i])),ylab="log(salary)")
  }
dev.off()

#Step 3: Run the regression
regression=lm(log(salary) ~ log(salbegin) + jobtime + prevexp + as.factor(polytech) + educ + as.factor(gender) + as.factor(jobcat), data=dataSet)

#Step 4: Test the assumptions of the linear model
##*-	assumption 1: linearity of the model 
install.packages("lmtest")
library(lmtest)

resettest(regression) #performs the Ramsey-Rest test on our regression

#*Interpret the result of the Ramsey-Reset test in R using a conditional statement.
attributes(resettest(regression)) #shows the name under which the p-vale is stored
resettest(regression)$p.value     #extracts the p-value

ifelse(resettest(regression)$p.value>0.05, print("The model is correctly specified"), print("The model is NOT correctly specified"))
  ###alternatively:
if(resettest(regression)$p.value>0.05){
  print("The model is correctly specified")
} else {
  print("The model is NOT correctly specified")
}

##*_-	assumption 5:homoskedasticity of errors
install.packages("lmtest")    
library(lmtest)
bptest(regression)

#*Interpret the result of the Breusch-Pagan test in R using a conditional statement.
attributes(bptest(regression)) #shows the name under which the p-vale is stored
bptest(regression)$p.value     #extracts the p-value

ifelse(bptest(regression)$p.value>0.05, print("The residuals are homoscedastic."), print("The residuals are heteroskedastic."))
  ###alternatively:
if(bptest(regression)$p.value>0.05){
  print("The residuals are homoscedastic.")
} else {
  print("The residuals are heteroskedastic.")
}

#To correct for heteroskedasticity of errors:

#install.packages("sandwich")
#library(sandwich)
#coeftest(regression, vcov = vcovHC(regression, type = "HC0"))

#*-assumption 6: normality of the residuals
install.packages("olsrr")
library(olsrr)

ols_test_normality(regression)

#Step 5: Results and interpretation
summary(regression)

#*Interpret the coefficients using the print() and the paste0() functions.
#Extract the results
results=summary(regression)
attributes(results)

results$coefficients

results$coefficients[,1] #coefficients
results$coefficients[,2] #standard errors
results$coefficients[,3] #t-statistics
results$coefficients[,4] #p-values

results$coefficients[,1][2] #coefficient log sal begin
print(paste0("1% increase in salary begin results in a ", results$coefficients[,1][2],"% increase in salary, on average, ceteris paribus."))

print(paste0("1 week increase in job time results in a ", results$coefficients[,1][3]*100,"% increase in salary, on average, ceteris paribus."))
print(paste0("We expect a ", results$coefficients[,1][5]*100,"% increase in salary for an employee that graduated polytech compared to one that didn't, on average, ceteris paribus."))

#Interpret the Adjusted R-squared using the print() and the paste0() functions.
results$adj.r.squared
print(paste0("Our model explains ", results$adj.r.squared*100, "% of the variation in salary"))



