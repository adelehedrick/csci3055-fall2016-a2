cp = .:csci3055u.a2.core
run_scala = scala csci3055u.a2.core.Main
txt =  csci3055u-a2.txt
ps_params = print_schedule_params.xml
fr_params = free_room_params.xml

#################################################
#                                               #
#   DO NOT MODIFY THE MAKEFILE!!!               #
#                                               #
#################################################


csci3055u/a2/core/Main.class: csci3055u/a2/core/package.scala
	@scalac csci3055u/a2/core/package.scala

csci3055u/a2/core/Assignment.class: csci3055u/a2/core/package.scala
	@scalac csci3055u/a2/core/package.scala

readFile: csci3055u/a2/core/Assignment.class csci3055u/a2/core/Main.class
	@$(run_scala) readFile $(txt)


distinctCode: csci3055u/a2/core/Assignment.class
	@$(run_scala) distinctCode $(txt)


timeEarliestLatest: csci3055u/a2/core/Assignment.class
	@$(run_scala) timeEarliestLatest $(txt)


# example parameters inside of print_schedule_params.xml
#<?xml version="1.0"?>
#<params>
#	<param name="code">CSCI 3055U</param>
#	<param name="title">Programming Languages</param> 
#	<param name="room">University Building A1 UA2240</param> 
#	<param name="weekday">R</param> 
#	<param name="time">11:10</param>
#</params>
printSchedule: csci3055u/a2/core/Assignment.class
	@$(run_scala) printSchedule $(txt) $(ps_params)


# example parameters inside of free_room_params.xml
#<?xml version="1.0"?>
#<params>
#	<param name="room">University Building A1 UA2240</param> 
#	<param name="weekday">R</param> 
#	<param name="time">11:10</param>
#</params>
freeRoom: csci3055u/a2/core/Assignment.class
	@$(run_scala) freeRoom $(txt) $(fr_params)


clean:
	@rm csci3055u/a2/core/*.class