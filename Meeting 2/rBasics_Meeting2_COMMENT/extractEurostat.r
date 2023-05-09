install.packages(plyr)
library(plyr)

setwd("E:/Multicultural Business Institute/R/Meeting 1/rBasics_Meeting1_Exercise 6/Inputs") 
#change with your own location of the documents to be able to run it
#####!!!when writing the location/path use "/". Ubuntu and Mac users: copies the path with "/". Windows users: copies the path with "\" - change it in R.

variables=read.csv("variables.csv")
View(variables)

datasetFinal=read.csv("datasetEurostat.csv")
View(datasetFinal)

attach("eurostatData.RData")
is.list(eurostatData)

names(eurostatData)
View(names(eurostatData))

View(eurostatData[[1]])
View(eurostatData$LFSA_EWPEVE)


eveningWork=subset(eurostatData$LFSA_EWPEVE, unit=="PC" & sex=="T" & age=="Y15-64" & wstatus=="EMP" & frequenc == "USU", c(country,time,values))
View(eveningWork)
nrow(eveningWork)
#the "PC", "T", "Y15-64", "EMP" and "USU" are eurostat abbreviations for:
	#"percent of population", "total (both males and females)", "age 15 to 64", "employed", "usually" 
#similarly "wstatus" and "frequenc" stand for "working status" and "frequency"
#I am interested in the scope of the above subset - you may explain:
	#what the subset() function does in general
	#in particular what eurostatData$LFSA_EWPEVE is as an R structure: list, data frame, vector
	#in particular what <<unit, sex, age, wstatus, frequenc, country, time, values>> are for my structure: column names, row names, values
	#in particular what <<"PC", "T", "Y15-64", "EMP" and "USU"> are for my structure: column names, row names, values
	#in particular what is the difference between <<unit=="PC" & sex=="T" & age=="Y15-64" & wstatus=="EMP" & frequenc == "USU">> and <<c(country,time,values)>>
			#does the sort function treat <<unit, sex, age, wstatus, frequenc>> differntly from <<country, time, values>>? how?
			#HINT: try to run 
			#<<eveningWorkRo=subset(eurostatData$LFSA_EWPEVE, unit=="PC" & sex=="T" & age=="Y15-64" & wstatus=="EMP" & frequenc == "USU" & country=="Romania", c(time,values))>>
			#and then <<View(eveningWorkRo)>> and <<nrow(eveningWorkRo)>>
			#which is the difference between eveningWorkRo and eveningWork
View(datasetFinal)

datasetFinal=join(datasetFinal, eveningWork, by = c("country", "time"), type = "left")
colnames(datasetFinal)[ncol(datasetFinal)]=paste0("Share of workers doing evening work")


View(datasetFinal)

write.csv(datasetFinal, "E:/Multicultural Business Institute/R/rBasics_Meeting1_Exercise 6/Outputs/Eurostat Data.csv",row.names=FALSE, na="na")
