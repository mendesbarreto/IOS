//
//  Day.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/24/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import Foundation

public class Day {
	public let name: WeekDays
	public let number:Int
	public let date: NSDate
	
	public init( date:NSDate ) {
		self.name = date.weekday()
		self.number = date.day()
		self.date = date
		//self.description()
	}
	
	public func description() {
		print( "    Name: \(name) Day: \(number) Date: \(date)" )
	}
	
	
}