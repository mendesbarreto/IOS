//
//  DateButtonViewModel.swift
//  CollectionViewController
//
//  Created by Douglas Barreto on 2/19/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import Foundation

public struct DateButtonViewModel {
	public let dateLabel: Observable<String>
	public let prefixDayLabel: Observable<String>
	public let hoursLabel: Observable<String>
	
	public init(_ dateButton: DateButtonModel) {
		dateLabel = Observable(dateButton.day)
		prefixDayLabel = Observable(dateButton.prefixDay)
		hoursLabel = Observable(dateButton.hours)
	}
}