setwd("E:/Work/Multicultural Business Institute/R/R_FBE2021/Meeting 4/rBasics_Meeting4_COMMENT/Exercise 2")
#change it with your own working directory (the folder where you saved STOXX50 daily prices.csv)
##!!!when writing the location/path use "/". 
###Ubuntu and Mac users: copies the path with "/". Windows users: copies the path with "\" - change it in R. 
campusData=read.csv("Campus crimes.csv")				 

View(campusData)	
colnames(campusData)
colnames(campusData)=c("enrollment", "private", "police", "crime")


median(campusData$enrollment) 
	
	
enrollSorted=sort(campusData$enrollment)
	 		 
n=length(campusData$enrollment)	 
if(n%%2==0)
{
	medianValue=mean(enrollSorted[n/2], enrollSorted[n/2 + 1]) 
} else {
	medianValue=enrollSorted[as.integer(n/2 +1)]			   
}

medianValue
View(medianValue)

install.packages("matrixStats")
library("matrixStats")	
colMedians(campusData)	


medianValues=matrix(NA, nrow=ncol(campusData), ncol=2)
View(medianValues)

for (i in 1:ncol(campusData)) 
{							  
	medianValues[i,1]=colnames(campusData)[i]	  
	sortedCampusData=sort(campusData[,i])		  
	if(nrow(campusData)%%2==0)					  
	{						
		medianValues[i,2]=mean(sortedCampusData[nrow(campusData)/2], sortedCampusData[nrow(campusData)/2 + 1]) 
	} else {				
		medianValues[i,2]=sortedCampusData[as.integer(nrow(campusData)/2 +1)] 
	}
}

medianValues
View(medianValues)

#Challenge 1_REPRODUCE: Find an R built-in function that computes the quartiles. Compute quariles for <<number of enrolled students>> in <<Campus crime.csv>> dataset.
#Challenge 2_REPRODUCE: Compute the quartiles (in challenge 1 above) by yourself through the usage of a conditional statement of your choice.
#Challenge 3_REPRODUCE: Find an R built-in function that computes the quartiles for all the columns in a dataframe. Compute quariles for <<Campus crime.csv>> dataset.
#Challenge 4_REPRODUCE: Compute the quartiles (in challenge 2 above) by yourself through the usage of a loop and a conditional statement of your choice.