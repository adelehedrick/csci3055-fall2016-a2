cp = .:csci3055u.a2.core
run_scala = scala csci3055u.a2.core.Main
txt =  csci3055u-a1.txt
ps_params = print_schedule_params.xml
fr_params = free_room_params.xml


csci3055u/a2/core/Main.class: csci3055u/a2/core/package.scala
	scalac csci3055u/a2/core/package.scala

csci3055u/a2/core/Assignment.class: csci3055u/a2/core/package.scala
	scalac csci3055u/a2/core/package.scala

read-file: csci3055u/a2/core/Assignment.class csci3055u/a2/core/Main.class
	$(run_scala) readFile $(txt)


distinct-code: csci3055u/a2/core/Assignment.class
	$(run_scala) distinctCode $(txt)


time-earliest-latest: csci3055u/a2/core/Assignment.class
	$(run_scala) timeEarliestLatest $(txt)


# example parameters inside of print_schedule_params.xml
#<?xml version="1.0"?>
#<params>
#	<param name="code">CSCI 3055U</param>
#	<param name="title">Programming Languages</param> 
#	<param name="room">University Building A1 UA2240</param> 
#	<param name="weekday">R</param> 
#	<param name="time">11:10</param>
#</params>
print-schedule: csci3055u/a2/core/Assignment.class
	$(run_scala) printSchedule $(txt) $(ps_params)


# example parameters
#	<param name=\"room\">University Building A1 UA2240<\/param> 
#	<param name=\"weekday\">R<\/param> 
#	<param name=\"time\">11:10<\/param>
free-room: csci3055u/a2/core/Assignment.class
	$(run_scala) freeRoom $(txt) $(fr_params)


clean:
	rm csci3055u/a2/core/*.class