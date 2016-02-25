//
//  NSDateComponent.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/24/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import Foundation

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