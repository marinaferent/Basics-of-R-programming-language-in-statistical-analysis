#Comment the code below:

setwd("E:/Work/Multicultural Business Institute/R/R_FBE2021/Meeting 4/rBasics_Meeting4_COMMENT/Exercise 1")
#change it with your own working directory (the folder where you saved STOXX50 daily prices.csv)
##!!!when writing the location/path use "/". 
###Ubuntu and Mac users: copies the path with "/". Windows users: copies the path with "\" - change it in R. 
datasetYouth=read.csv("datasetYouth_2015.csv")


#save the directions
###variables:colnames(datasetYouth) - e.g. flexitimePc = the percent of youth in each country that used flexitime in 2015
									#-e.g. teleworkingNever =  the percent of youth in each country that never used teleworking in 2015
###analyzed phenomenon: flexicurity = the higher the flexicurity score is in a country the higher the degrees of job flexibility and employment security are in a contry									
##direction=1 in case the variable has a positive impact (expected from literature) on the phenomenon 
				#-eg. flexitimePC = the higher the percent of youth that used flexitime in 2015 in country, 
					## the higher the job flexibility in the country => the higher the country's flexicurity score is
##direction=-1 in case the variable has a negative impact (expected from literature) on the phenomenon 
				#-eg. teleworkingNever = the higher the percent of youth that never used teleworking in 2015 in a country
					##the lower the job flexibility in the country => the lower the country's flexicurity score is

direction=datasetYouth[1,]


datasetYouthNormalized=data.frame(matrix(NA,nrow=nrow(datasetYouth),ncol=ncol(datasetYouth)))
colnames(datasetYouthNormalized)=colnames(datasetYouth)
datasetYouthNormalized[,1:2]=datasetYouth[,1:2]

for(i in seq(3,ncol(datasetYouth),1))
{
	for(j in seq(2,nrow(datasetYouth),1))
	{
		if(direction[i]==1)
		{
			if(is.na(datasetYouth[j,i])=="FALSE")
			{
				datasetYouthNormalized[j,i]=as.numeric(as.character((datasetYouth[j,i]-min(na.omit(datasetYouth[-1,i])))/(max(na.omit(datasetYouth[-1,i]))-min(na.omit(datasetYouth[-1,i])))*100))
			}
		}
		else
		{
			if(is.na(datasetYouth[j,i])=="FALSE")
			{
				datasetYouthNormalized[j,i]=as.numeric(as.character((max(na.omit(datasetYouth[-1,i]))-datasetYouth[j,i])/(max(na.omit(datasetYouth[-1,i]))-min(na.omit(datasetYouth[-1,i])))*100))
			}
		}
	}
}

write.csv(datasetYouthNormalized, "datasetYouth_2015Normalized.csv")


