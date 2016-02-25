//
//  NSDate.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/24/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import Foundation

// MARK Enums

public enum WeekDays: Int {
	case Sunday = 1
	case Monday = 2
	case Tuesday = 3
	case Wednesday = 4
	case Thursday = 5
	case Friday = 6
	case Saturday = 7
}

// MARK Consts
let secondsPerDay:Double = 24 * 60 * 60 ;
let secondsPerWeek:Double = secondsPerDay * 7
let secondsPerMonth:Double = secondsPerWeek * 4

// MARK Extension
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
	
	func isWeekDay( weekDay:WeekDays ) -> Bool {
		return self.weekday() == weekDay
	}
	
	func weekDayName( localeIdentifier localeId:String? = nil ) -> String {
		let dateFormatter = NSDateFormatter()
		let locale: NSLocale
		
		if let localeIdentifier: String = localeId {
			locale = NSLocale(localeIdentifier: localeIdentifier)
		} else {
			if let preferred: String = NSLocale.preferredLanguages().first {
				locale = NSLocale(localeIdentifier: preferred)
			} else {
				locale = NSLocale(localeIdentifier: "pt_br")
			}
		}
		
		dateFormatter.dateFormat = "EEEE"
		dateFormatter.locale = locale
		return dateFormatter.stringFromDate(self)
	}
	
	func weekdayPrefix(length length:Int, localeIdentifier localeId:String? = nil ) -> String {
		let weekDayName = self.weekDayName(localeIdentifier: localeId)
		let usedLength: Int
		let range: Range<String.Index>
		
		if( length > weekDayName.characters.count ) {
			usedLength = weekDayName.characters.count
		} else {
			usedLength = length
		}
		
		range = Range<String.Index>(start: weekDayName.startIndex, end: weekDayName.startIndex.advancedBy(usedLength))
		
		return weekDayName.substringWithRange(range)
	}
	
}

