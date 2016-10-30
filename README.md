# Assignment 1

Your task is to go to the csci3055u/a1/core.clj and fill in the function bodies.

A makefile has been provided that is all set to execute the functions in the core.clj. You simply need to execute `make <function name>` in terminal at the base of the project directory. Feel free to modify the arguments to test different operations.

The csci3055u-a1.txt contains the current course listings for this semester. You will be using this file a lot for this assignment. 

First three lines of the file are:
```
201609|Foun.of Ditgl Teach & Lrn Tech|AEDT 1120U|12|M|10|13|0|Virtual ONLINE11
201609|Foun.of Ditgl Teach & Lrn Tech|AEDT 1120U|18|M|10|19|0|Virtual ONLINE9
201609|Digital Commun. Technologies|AEDT 1160U|12|M|10|13|0|Virtual ONLINE10
```

As you can see each row represents each time and place that a course is scheduled for. If a course has more than one lecture/lab/tutorial, then it will have multiple rows with each row having a different time and possibly room. The columns data go by:

Semester|Title|Code|Start-Hour|Day|Start-Minute|End-Hour|End-Minute|Room 

The character used to separate the columns is the vertical bar `"\|"`.

## Step 1. Include Your Name

Near the top of the *csci3055u/a1/core.clj* file make sure you put your name and student number in the comments provided:

```clojure
;; Name: 
;; Student Number: 100******
```

## Step 2. Fill in Functions Provided

You are expected to fill in the function bodies of the functions previously defined in *csci3055u/a1/core.clj* that have `;; YOUR CODE GOES HERE` inside the body.

You will need to add additional functions to your code for marks and to make sure your code doesn't smell, please do so in the area indicated near the top of *csci3055u/a1/core.clj*.

## The Functions

I recommend that you do these functions in order. They are ordered in such a way to help guide you through the skills you need to complete the final function `free-rooms` at the end. 

### read-file

This is a warm-up! Simply read the contents of the file associated to the argument 'filename' and print the contents to the console.

#### Sample Execution

```bash
make read-file
read-file -  csci3055u-a1.txt
201609|Foun.of Ditgl Teach & Lrn Tech|AEDT 1120U|12|M|10|13|0|Virtual ONLINE11
201609|Foun.of Ditgl Teach & Lrn Tech|AEDT 1120U|18|M|10|19|0|Virtual ONLINE9
201609|Digital Commun. Technologies|AEDT 1160U|12|M|10|13|0|Virtual ONLINE10
201609|Digital Commun. Technologies|AEDT 1160U|18|M|10|19|0|Virtual ONLINE5
201609|Graphic Desgn, Digtl Tech.|AEDT 2130U|12|W|10|13|0|Virtual ONLINE12
...way more output
```

### distinct-code

Output to the console the unique course codes found in the file 'filename'

#### Sample Execution

```bash
make distinct-code
distinct-code -  csci3055u-a1.txt
#{NURS 0420U EDUC 3210U ENGR 3260U SSCI 4099U NUCL 4510U AEDT 3120U COMM 1420U CHEM 3530U SSCI 2020U PSYC 2060U COMM 2210U INFR 4320U PHY 4020U NUCL 5060G CSCI 4110U MANE 4280U INFR 3495U COMM 3410U BUSI 3930U SSCI 2031U ENGR 3750U HLSC 2825U HLSC 1200U PSYC 1000U BUSI 2603U MATH 3030U MECE 4410U ENGR 3200U INFR 2395U COMM 2530U MCSC 6000G MATH 1000U BUSI 2620U NURS 2701U SSCI 6920G BUSI 3350U MECE 2640U CSCI 1040U INFR 3120U MECE 4210U MATH 1010U HLSC 5322G BIOL 1010U NURS 3400U SOFE 2800U CHEM 4050U PSYC 5510G INFR 4310U BUSI 3040U BUSI 4701U SSCI 1910U...
```

### time-earliest-latest

Read in the file, and output the earliest start time, and the latest end time.

#### Sample Execution

```bash
make time-earliest-latest
Earliest start time is:  810
Latest end time is:  2130
```

### pr-schedule

This time you are going to write to a file. All of these keys are optional. The ones that are set will be used as filters on the data. You need to output the day, start time, end time, code, title and location, with each record on its own line.

#### Sample Execution

With my makefile settings as:
```make
pr-schedule:
	@$(run_clj) pr-schedule $(txt) { :code \"CSCI 3055U\" }
```

Terminal:
```bash
make pr-schedule
pr-schedule -  csci3055u-a1.txt   CSCI 3055U   nil   nil   nil   nil
```

Output schedule.txt
```
T 12:40-14:0 - CSCI 3055U - Programming Languages - University Building A1 UA2240
R 11:10-12:30 - CSCI 3055U - Programming Languages - University Building A1 UA2240
```

### free-room 

For this one, you need to find all the times that rooms are free, filter the data based on the :keys and output results to the console. Example: If I provide the keys :weekday and :time then I want a print out of the weekday, time and room (e.g. R - 8:10 to 11:40 - University Building A1 UA2240) for every segment that matches the :weekday and :time.

#### Sample Execution

With my makefile settings as:
```make
free-room:
	@$(run_clj) free-room $(txt) {  :weekday \"R\" :room  \"University Building A1 UA2240\"  }
```

Terminal:
```bash
make free-room
free-room -  csci3055u-a1.txt   University Building A1 UA2240   R   nil
R 11:0-11:10 - University Building A1 UA2240
R 12:30-14:10 - University Building A1 UA2240
R 17:0-18:40 - University Building A1 UA2240
```


## Some Helpful Resources 

The [Clojure Cheatsheet](http://clojure.org/api/cheatsheet) is a must have resource that you will need open at all times while programming in Clojure.
