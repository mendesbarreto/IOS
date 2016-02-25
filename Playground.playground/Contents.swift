//: Playground - noun: a place where people can play

import UIKit

public enum WeekDays: Int {
	case Sunday = 1
	case Monday = 2
	case Tuesday = 3
	case Wednesday = 4
	case Thursday = 5
	case Friday = 6
	case Saturday = 7
}

let secondsPerDay:Double = 24 * 60 * 60 ;
let secondsPerWeek:Double = secondsPerDay * 7
let secondsPerMonth:Double = secondsPerWeek * 4

extension NSDate {
	
	func nextDay() -> NSDate {
		return self.dateByAddingTimeInterval(secondsPerDay)
	}
	
	func lastDay() -> NSDate {
		return self.dateByAddingTimeInterval(-secondsPerDay)
	}
	
	func lastWeek() -> NSDate {
		return self.dateByAddingTimeInterval(-secondsPerWeek)
	}
	
	func nextWeek() -> NSDate {
		return self.dateByAddingTimeInterval(secondsPerWeek)
	}
	
	func forwardWeek( weeks:Int ) -> NSDate {
		return self.forward(days: weeks * 7)
	}
	
	func backwardWeek( weeks:Int ) -> NSDate {
		return self.backward(days: weeks * 7)
	}
	
	func forward( days days:Int ) -> NSDate {
		return self.dateByAddingTimeInterval( NSTimeInterval( secondsPerDay * Double(days) ) )
	}
	
	func backward( days days:Int ) -> NSDate {
		return self.dateByAddingTimeInterval( NSTimeInterval( -( secondsPerDay * Double(days) ) ) )
	}
	
	func beginOfMonth() -> NSDate {
		let componet = self.createDateComponents()
		componet.day -= componet.day - 1
		return componet.date!
	}
	
	func endOfWeek() -> NSDate {
		return self.forward(days: WeekDays.Saturday.rawValue - self.weekday().rawValue)
		
	}
	
	func beginOfWeek() -> NSDate {
		return self.forward(days:  WeekDays.Sunday.rawValue - self.weekday().rawValue)
	}
	
	func gotoMonday() ->NSDate {
		return self.forward(days:  WeekDays.Monday.rawValue - self.weekday().rawValue)
	}
	
	func weekday() -> WeekDays {
		let weekDay = self.createDateComponents(components: NSCalendarUnit.Weekday ).weekday
		return WeekDays(rawValue: weekDay)!
	}
	
	func day() -> Int {
		return self.createDateComponents(components: NSCalendarUnit.Day ).day
	}
	
	func month() -> Int {
		return self.createDateComponents(components: NSCalendarUnit.Month ).month
	}
	
	func year() -> Int {
		return self.createDateComponents(components: NSCalendarUnit.Year ).year
	}
	
	func createDateComponents(components  components: NSCalendarUnit? = nil, calendar:NSCalendar? = nil ) -> NSDateComponents {
		
		let ca: NSCalendar
		
		if let calTemp = calendar {
			ca = calTemp
		} else {
			ca = NSCalendar.currentCalendar()
		}
		
		if let co = components {
			return ca.components(co, fromDate:  self)
		}
		return ca.components([
			NSCalendarUnit.Weekday,
			NSCalendarUnit.Day,
			NSCalendarUnit.Calendar,
			NSCalendarUnit.Month,
			NSCalendarUnit.Year,
			NSCalendarUnit.WeekOfYear,
			NSCalendarUnit.Hour,
			NSCalendarUnit.Minute,
			NSCalendarUnit.Second,
			NSCalendarUnit.Nanosecond], fromDate: self)
	}
	
}

extension NSDateComponents {
	
	func zeroTime() {
		self.hour -= self.hour
		self.minute -= self.minute
		self.second -= self.second
		self.nanosecond -= self.nanosecond
	}
	
	func nextDay() {
		self.day += 1
		updateWeekDay()
	}
	
	func lastDay() {
		self.day -= 1
		updateWeekDay()
	}
	
	func lastWeek() {
		self.backward(days: 7)
		updateWeekDay()
	}
	
	func nextWeek() {
		self.forward(days: 7)
		updateWeekDay()
	}
	
	func forwardWeek( weeks:Int ) {
		self.forward(days: weeks * 7)
	}
	
	func backwardWeek( weeks:Int ) {
		self.backward(days: weeks * 7)
	}
	
	func forward( days days:Int ) {
		self.day += days
		updateWeekDay()
	}
	
	func backward( days days:Int ) {
		self.day -= days
		updateWeekDay()
	}
	
	func beginOfMonth() {
		self.day -= self.day - 1
		updateWeekDay()
	}
	
	func endOfWeek() {
		
		self.forward(days: WeekDays.Saturday.rawValue - self.weekday)
		updateWeekDay()

	}
	
	func gotoMonday() {
		print(  WeekDays.Monday.rawValue - self.weekday )
		self.forward(days:  WeekDays.Monday.rawValue - self.weekday)
		updateWeekDay()
	}
	
	func beginOfWeek() {
		print(  WeekDays.Sunday.rawValue - self.weekday )
		self.forward(days:  WeekDays.Sunday.rawValue - self.weekday)
		updateWeekDay()
	}
	
	func updateWeekDay() {
		if let date = self.date {
			self.weekday = NSCalendar.currentCalendar().components(NSCalendarUnit.Weekday, fromDate: date).weekday
		}
	}
}

public class Day {
	public let name: WeekDays
	public let number:Int
	public let date: NSDate
	
	public init( date:NSDate ) {
		self.name = date.weekday()
		self.number = date.day()
		self.date = date
		
		print( "    Name: \(name) Day: \(number) Date: \(date)" )
	}
	
}

public class Week {
	public let days: [Day]
	
	public init( days: [Day] ){
		self.days = days
	}
	
}



func getWeeks( from date: NSDate, weeksBefore:Int , weeksAfter: Int ) -> [Week] {
	
	let weeksToCount = weeksAfter + weeksBefore
	var day:NSDate
	var weeks = [Week]()
	
	let monday = date.gotoMonday()
	day = monday.backwardWeek(weeksBefore)
	
	for _ in 0...weeksToCount {
		var days = [Day]()
		print("Weed: \(day) ")
		for _ in 1...7 {
			days.append( Day(date: day) )
			day = day.nextDay()
		}
		weeks.append(Week(days: days))
		print("----------------------")
	}
	
	return weeks
}

let date = NSDate()
getWeeks(from: date, weeksBefore: 2, weeksAfter: 2)

