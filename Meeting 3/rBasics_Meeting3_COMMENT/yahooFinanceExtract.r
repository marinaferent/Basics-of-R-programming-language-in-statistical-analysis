#To run the code, use <<yahooSymbols.csv>>

install.packages("quantmod")
install.packages("tseries")
library(quantmod)
library(tseries)

setwd("E:/Work/Multicultural Business Institute/R/R_FBE2021/Meeting 3/rBasics_Meeting3_COMMENT")
#change it with your own working directory (the folder where you saved yahooSymbols.csv)
##!!!when writing the location/path use "/". 
###Ubuntu and Mac users: copies the path with "/". Windows users: copies the path with "\" - change it in R.
symbol=data.frame(read.csv("yahooSymbols.csv", sep=',',header=TRUE,stringsAsFactors=F))

startDate=as.Date("2015-01-01", format="%Y-%m-%d")
endDate=as.Date("2019-12-31", format="%Y-%m-%d")
calendarDays=endDate-startDate

yahooData=data.frame(matrix(NA,nrow=calendarDays,ncol=nrow(symbol)))
colnames(yahooData)=symbol[,1]

for(i in seq(1,nrow(symbol),1))
{
	temp=get.hist.quote(instrument=symbol[i,1], start=startDate, end=endDate, quote=c("C"), provider="yahoo", retclass="zoo",quiet=1)
	yahooData[(1:nrow(temp)),i]=temp[1:nrow(temp),1]
	print(i)
}

View(temp)
View(yahooData)
dim(yahooData)


#in case all the stocks have the same number of available days:
yahooData=yahooData[(1:nrow(temp)),]
#in case stocks have different number of available days:
yahooData=yahooData[(1:1242),] 
#what happens in <<yahooData=yahooData[(1:nrow(temp)),]>> if stocks have different number of available days?

View(yahooData)
dim(yahooData)

write.csv(yahooData, "Yahoo Data.csv")

#Challenge 1_REPRODUCE: Change the yahooData column names to <<Name>> of stock instead of <<Symbol>>.
#Challenge 2_DEBUG: Add symbol << KTCG.VI>> -<< Kapsch TrafficCom AG>> to your <<YahooSymbols.csv>> and run the code. You receive a warning message. What does it mean? Why do you receive it?

