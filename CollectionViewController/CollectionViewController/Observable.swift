//
//  Common.swift
//  CollectionViewController
//
//  Created by Douglas Barreto on 2/19/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import Foundation

public class Observable<T> {
	public typealias Observer = T -> Void
	public var observer: Observer?
	
	public func observe(observer: Observer?) {
		self.observer = observer
		observer?(value)
	}
	
	public var value: T {
		didSet {
			observer?(value)
		}
	}
	
	public init(_ v: T) {
		value = v
	}
}