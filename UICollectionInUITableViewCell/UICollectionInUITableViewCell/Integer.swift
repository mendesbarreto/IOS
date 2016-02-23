//
//  Integer.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import Foundation

// MARK: Random number base 64

/**TODO: Comment the new functions for 64*/
func arc4random <T: IntegerLiteralConvertible> (type: T.Type) -> T {
	var r: T = 0
	arc4random_buf(&r, sizeofValue(T.Type))
	return r
}

// MARK: Int
extension Int : Randomable {
	static public func random() -> Int {
		return arc4random(Int)
	}
}

// MARK: UInt
extension UInt : Randomable {
	static public func random() -> UInt {
		return arc4random(UInt)
	}
}