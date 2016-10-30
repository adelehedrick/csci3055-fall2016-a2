package csci3055u.a2.core

import scala.xml.XML
import scala.io.Source

class Assignment {

	/**
	* This is a warm-up! Simply read the contents of the file associated to the argument 
	* 'filename' and print the contents to the console.
	*/
	def readFile(file_name: String) {
		println("readFile - "+file_name)

		// YOUR CODE GOES HERE
		

	} // end readFile


	/**
	* Output to the console the unique course codes found in the file 'filename'
	*/
	def distinctCode(file_name: String) {
		println("distinctCode - "+file_name)

		// YOUR CODE GOES HERE

	} //end distinctCode


	/**
	* Read in the file, and output the earliest start time, and the latest end time.
	*/
	def timeEarliestLatest(file_name: String) {
		println("timeEarliestLatest - "+file_name)

		// YOUR CODE GOES HERE

	} //end timeEarliestLatest


	/**
	* This time you are going to write to a file. All of these keys are optional. 
	* The ones that are set will be used as filters on the data. You need to output 
	* the day, start time, end time, code, title and location, with each record on 
	* its own line.
	*/
	def printSchedule(file_name: String, args: Map[String, String]) {
		println("printSchedule - " + file_name + " - " + args.toString)

		// YOUR CODE GOES HERE

	} //end printSchedule


	/**
	* For this one, you need to find all the times that rooms are free, filter the 
	* data based on the :keys and output results to the console. Example: If I 
	* provide the keys :weekday and :time then I want a print out of the weekday, 
	* time and room (e.g. R - 8:10 to 11:40 - University Building A1 UA2240) for 
	* every segment that matches the :weekday and :time.
	*/
	def freeRoom(file_name: String, args: Map[String, String]) {
		println("freeRoom - " + file_name + " - " + args.toString)

		// YOUR CODE GOES HERE

	} //end freeRoom

}


object Main {
	def main(args: Array[String]): Unit = {

		val a = new Assignment
		val fun_name = args(0)
		val file_name = args(1)
  	
		if (args.length > 2) {
			val params_xml = XML.loadFile(args(2))
			val params: Map[String, String] = (params_xml \ "param").map { x => ((x \ "@name").text -> x.text) }.toMap

			//boo can't get reflection to work with the Map parameter
			if (fun_name == "printSchedule")
				a.printSchedule(file_name, params)
			else
				a.freeRoom(file_name, params)
		} else {
			val method = a.getClass.getMethod(fun_name, file_name.getClass)
			method.invoke(a, file_name)
		}
	
	}
}