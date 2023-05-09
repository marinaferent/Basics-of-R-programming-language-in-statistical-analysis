#DEBUG SAMY CODE: 
grade=c(4, 9, 6, 7, 3) #the grades taken by 5 candidates in the R course
#The grades are further interpreted in terms of level of skills, as follows:
### grades: 1-4 => skills level: "beginner"
### grades: 5-7 => skills level: "intermediate"
### grades: 8-10=> skills level: "advanced"
skills=vector()

for (i in 1:length(grade))
{
  if (grade[i]<=4)
  {
    skills[i]="Beginner"
  } else {
    if (grade[i]>=5 && grade[i]<=7)
    {
      skills[i]="Intermediate"
    }
  } else {
    skills[i]="Advanced"
  }
}

#debug process starts here:
##I renounce at the for loop and instead I run it myself
##so: I start by declaring i=1
i=1
##I run each if until I find the bug
if (grade[i]<=4)
{
  skills[i]="Beginner"
}  
##no bug here, so next time I go until the end of the next if
##i is still 1
i
if (grade[i]<=4)
{
  skills[i]="Beginner"
} else {
  if (grade[i]>=5 && grade[i]<=7)
  {
    skills[i]="Intermediate"
  }
}
##no bug until here either so next time I take one more {} section of my code:
if (grade[i]<=4)
{
  skills[i]="Beginner"
} else {
  if (grade[i]>=5 && grade[i]<=7)
  {
    skills[i]="Intermediate"
  }
} else {
  skills[i]="Advanced"
}
## I get the error: Error: unexpected 'else' in:
##"  }
##} else" => this is my first error

##the issue is with the last else -> in terms of subordination:
#LEVEL 1: if1(grade: 1-4) => beginner
          #LEVEL 1.1. ELSE1 <=> grade>4: LEVEL 1.1.1. if2(grade 5-7) => intermediate
                                                    #LEVEL 1.1.1.1 ELSE2 <=> grade>7
                                                    #=>ELSE2 is inside ELSE1 and suburdinates to if2
                                                    #=>I end the if2 statement (close the "}" for if2)
                                                    #=>I close the "}" for ELSE2 and only THEN 
          #=>I close the "}" for ELSE1

#in SAMY code I had:
#LEVEL 1: if1(grade: 1-4) => beginner
          #LEVEL 1.1. ELSE1 <=> grade>4: LEVEL 1.1.1. if2(grade 5-7) => intermediate
          #LEVEL 1.1. ELSE2 <=> grade>7
          #=>ELSE2 subordinates to if1 (it is not inside ELSE1, but at the same level)
          #=>I end the if2 statement (close the "}" for if2)
          #=>I closed the "}" for ELSE1 (too early)
          #=>I closed the "}" for ELSE2  

#in fact, in this case I could have spotted from the beginning that I have an earlier error:
for (i in 1:length(grade))
{
  if (grade[i]<=4)
  {
    skills[i]="Beginner"
  } else {
    if (grade[i]>=5 && grade[i]<=7)
    {
      skills[i]="Intermediate"
    }
  } else {
    skills[i]="Advanced"
  }
}
#once I solve the "unexpected 'else'"error, no other error:

for (i in 1:length(grade))
{
  if (grade[i]<=4)
  {
    skills[i]="Beginner"
  } else {
    if (grade[i]>=5 && grade[i]<=7)
    {
      skills[i]="Intermediate"
    }else {
    skills[i]="Advanced"
    }
  }
}

