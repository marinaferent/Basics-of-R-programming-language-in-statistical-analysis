####### COURSE: Basics of R programming language for statistical analysis #######

#Instructor: Marina FERENT-PIPAS
#email: marinaferent@gmail.com
#accredited by Multicultural Business Institute | mcb-institute.org

#_______ CHAPTER 2: CONTROL STRUCTURES AND FUNCTIONS | Statistical measures _____#
###MEETING 04: CONDITIONAL STATEMENTS| Challenge: Median values| 26.08.2021 ######

#________________________________________________________________________________#
#################### GOOD PROGRAMMING PRACTICES OF THE MEETING: 
	##1. DESIGN: Before coding a section - write down each step in order
	##2. INDENTATION: Showcase the begining of a section, the body and the end of it through the right indentation. 
			##Anything that subordinates to a line is TABed once from that line.

## FOCUS OF THE MEETING: CONDITIONAL STATEMENTS: IF, IF-ELSE and IFELSE statements
##expressions that perform different computations or actions depending on whether a predefined boolean condition is TRUE or FALSE
	
#________________________________________________________________________________#

gradeA=9 #the grade taken by candidate A in the R course
gradeB=9 #the grade taken by candidate A in the R course

gradeA==gradeB	#gradeA equals gradeB -> returns TRUE in this case
gradeA!=gradeB	#gradeA is different (is not equal to) gradeB -> returns FALSE in this case
gradeA>gradeB	#gradeA is greater than gradeB -> returns FALSE in this case
gradeA>=gradeB	#gradeA is greater or equal to gradeB -> returns TRUE in this case
gradeA%%3		#the reminder of gradeA divided to 3 -> returns 0 in this case (9/3=3, reminder 0)
gradeA%%5		#the reminder of gradeA divided to 5 -> returns 4 in this case (9/5=1, reminder 4)
gradeA%%3==0	#(the reminder of gradeA divided to 3) equals zero -> returns TRUE in this case
gradeA%%3!=0	#(the reminder of gradeA divided to 3) is different from zero -> returns FALSE in this case
gradeA>5 && gradeA<8	#gradeA>5 AND gradeA<8 -> returns FALSE in this case
gradeA>5 || gradeA<8	#gradeA>5 OR gradeA<8 -> returns TRUE in this case 

#EXERCISE 1: Comment the code below:
gradeA=9 #the grade taken by candidate A in the R course
gradeB=9 #the grade taken by candidate A in the R course

if(gradeA==gradeB) 
{
	print("The 2 students have the same grade")
}
#prints "The 2 students have the same grade" in case gradeA and gradeB are the same

if(gradeA==gradeB)
{
	print("The 2 students have the same grade")
} else {
	print("The 2 students have different grades")
}
#prints "The 2 students have the same grade" in case gradeA and gradeB are the same AND
#prints "The 2 students have different grades" in case gradeA and gradeB are different


if (gradeA==gradeB) print("The 2 students have the same grade") else print("The 2 students have different grades") 

ifelse(gradeA==gradeB, "The 2 students have the same grade", "The 2 students have different grades")
#structure: ifelse(condition, if condition satisfied, if condition not satisfied)

#EXERCISE 2: 
grade=c(4, 9, 6, 7, 3) #the grades taken by 5 candidates in the R course
#Candidates pass the exam if their grade is greater or equal to 5.
##Using a conditional statement of your choice, print:
### -> "pass" if the 2nd candidate passed the exam, and 
### -> "failed" if (s)he failed the exam

grade[2] #the grade of the 2nd candidate = 9

if(grade[2]>=5)	#if the grade of the 2nd student is greater or equal to 5
{
	print("pass")	#print "pass"
} else {			#if the grade of the 2nd student is NOT greater or equal to 5 (i.e. is lower than 5)
	print("failed") #print "failed"
}

	#alternatively:
if(grade[2]>=5) print("pass") else print("failed")

	#alternatively
ifelse(grade[2]>=5, "pass", "failed")


#EXERCISE 3: 
grade=c(4, 9, 6, 7, 3) #the grades taken by 5 candidates in the R course -> [IF...ELSE NESTED]
#The grades are further interpreted in terms of level of skills, as follows:
### grades: 1-4 => skills level: "beginner"
### grades: 5-7 => skills level: "intermediate"
### grades: 8-10=> skills level: "advanced"

#Using a conditional statement of your choice, print the skills level of the 4th candidate.

grade[4] #the grade of the 4h candidate = 7

if(grade[4]<=4)	#if the grade of the 4th student is lower or equal to 4
{
	print("beginner")	#print "beginner"
} else {		#if the grade of the 4th student is NOT lower or equal to 4 (i.e. greater than 4)
	if(grade[4]<=7) 	#if the grade of the 4th student is lower or equal to 7 (but greater than 4 as stated before)		
	{
	print("intermediate") #print "intermediate"
	} else {			#if the grade of the 4th student is NOT lower or equal to 7 (but greater than 4 as stated before)(i.e. greater than 7)
	print("advanced")	#print "advanced"
	}
}
	
	#alternatively:
ifelse(grade[4]<=4, "beginner", ifelse(grade[4]<=7, "intermediate", "advanced"))

	#alternatively:
if(grade[4]<=4)	#if the grade of the 4th student is lower or equal to 4
{
	print("beginner")	#print "beginner"
}
if(grade[4]>=5 && grade[4]<=7) 	#if the grade of the 4th student is lower or equal to 7 (but greater than 4 as stated before)		
{
	print("intermediate") #print "intermediate"
}
if(grade[4]>=8 && grade[4]<=10) 	#if the grade of the 4th student is lower or equal to 7 (but greater than 4 as stated before)		
{
	print("advanced")	#print "advanced"
}

#EXERCISE 4: 
grade=c(4, 9, 6, 7, 3) #the grades taken by 5 candidates in the R course
#The grades are further interpreted in terms of level of skills, as follows:
### grades: 1-4 => skills level: "beginner"
### grades: 5-7 => skills level: "intermediate"
### grades: 8-10=> skills level: "advanced"
skills=vector() #creates an empty vector called skills

#Using a conditional statement of your choice and a for loop, write in vector skills the skills level of the 5 candidates.
length(grade) #number of students
#student 1: grade[1]=4<=4 => skills[1]="beginner" [i=1]
#student 2: grade[2]=9>7 => skills[2]="advanced"   [i=2] etc.


for(i in 1:length(grade))
{
	if(grade[i]<=4)	#if the grade of the i-th student is lower or equal to 4
	{
		skills[i]="beginner"	#skills[i]="beginner"
	} else {		#if the grade of the i-th student is NOT lower or equal to 4 (i.e. greater than 4)
		if(grade[i]<=7) 	#if the grade of the i-th student is lower or equal to 7 (but greater than 4 as stated before)		
		{
		skills[i]="intermediate" #skills[i]="intermediate"
		} else {			#if the grade of the i-th student is NOT lower or equal to 7 (but greater than 4 as stated before)(i.e. greater than 7)
		skills[i]="advanced"	#skills[i]="advanced"
		}
	}
}

skills


#EXERCISE POINT_1: The grades of 5 students in statistics and econometrics are presented below:
gradesStatistics=c(3, 6, 9, 7, 4)		#grades in statistics class
gradesEconometrics=c(5, 7, 10, 6, 3)	#grades in econometrics class
#Write a conditional statement that:
##For students that took at least 5 in both classes [grade statistics>=5 AND grade econometrics>=5] computes the averageGrade [arithmetic mean].
##For the rest prints "DID NOT PASS ONE OR BOTH EXAMS".
#Check the statement on student 1 and 2.


#EXERCISE POINT_2: Five students want to eroll in an R programming class. Their grades in statistics and econometrics are presented below:
gradesStatistics=c(3, 6, 9, 7, 4)		#grades in statistics class
gradesEconometrics=c(5, 7, 10, 6, 3)	#grades in econometrics class
#Students are eligible to be admitted to the R programming class if they took at least 5 in one of the classes [grade statistics>=5 OR grade econometrics>=5].

#Using a conditional statement of your choice, print "ACCEPTED" or "REJECTED" for canditate 1.
