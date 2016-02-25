//
//  Week.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/24/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import Foundation
public class Week {
	public let days: [Day]
	
	public init( days: [Day] ){
		self.days = days
	}
	
	public class func getWeeks( from date: NSDate, weeksBefore:Int , weeksAfter: Int ) -> [Week] {
		
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
	
}