#https://datascienceplus.com/extracting-tables-from-pdfs-in-r-using-the-tabulizer-package/
#https://cran.r-project.org/web/packages/tabulizer/vignettes/tabulizer.html

#! to load properly tabulizer needs latest Java version 
## to install the latest Java version: https://java.com/en/download/help/download_options.html

#installing the packages (also called libraries) that contain the functions we need:
	##we only need to install them once (i.e. the next time we will need these packages, we won't need to use the install.packages()function)
install.packages("tabulizer") 
install.packages("dplyr")
install.packages("shiny")


#loading the packages (also called libraries) that contain the functions we need:
	##this tells R we will be using these packages today in our code
library(tabulizer) 
#! to load properly tabulizer needs latest Java version 
## to install the latest Java version: https://java.com/en/download/help/download_options.html
library(dplyr)
library(shiny)
library(miniUI)

#EXERCISE_POINT_1: R returns the following error: Error in library(miniUI) : there is no package called ‘miniUI’. Solve it.

#indicating the path to our .pdf document (could be used on a website as well)
location="E:/Work/Multicultural Business Institute/R/R_FBE2021/Meeting 2/rBasics_Meeting2_DEBUG/manca2010.pdf"


flexicurityData_tables=extract_tables(location, pages=54) #extracts the table on page 54 and save it to flexicurityData_tables
View(flexicurityData_tables)	#visualise flexicurityData_tables


flexicurityData_areas=extract_areas(location, pages=54)
	#extract_areas allows the user to select the table to be extracted
	#extract_areas needs packages shiny and miniUI to be installed
View(flexicurityData_areas) #visualise flexicurityData_areas

#saving flexicurityData_tables into a.csv file (same can be done with flexicurityData_areas)
write.csv(flexicurityData_tables, "E:/Work/Multicultural Business Institute/R/R_FBE2021/Meeting 2/rBasics_Meeting2_DEBUG/Flexicurity values 2005.csv")