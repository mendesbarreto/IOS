//
//  CGFloat.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

extension CGFloat {
	static func random() ->  CGFloat{
		return CGFloat(arc4random()) / CGFloat(UInt32.max)
	}
}