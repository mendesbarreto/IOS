//
//  UIColor.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit


// MARK: Random Color
extension UIColor : Randomable{
	static func random() -> UIColor {
		let r = CGFloat.random()
		let g = CGFloat.random()
		let b = CGFloat.random()
		
		// If you wanted a random alpha, just create another
		// random number for that too.
		return UIColor(red: r, green: g, blue: b, alpha: 1.0)
	}
}

// MARK: UIColor From HEXDECIMAL number
extension UIColor {
	
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red color number")
		assert(green >= 0 && green <= 255, "Invalid green color number")
		assert(blue >= 0 && blue <= 255, "Invalid blue color number")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	convenience init(netHex:Int) {
		self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
	}
}
