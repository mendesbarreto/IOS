//
//  Randomable.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import Foundation


protocol Randomable {
	typealias ElementType
	static func random() -> ElementType
}