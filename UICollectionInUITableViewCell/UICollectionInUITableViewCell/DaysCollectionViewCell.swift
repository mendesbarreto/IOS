//
//  DaysCollectionViewCell.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/23/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

@IBDesignable public class DaysCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet public weak var weekDayLabel: UILabel?
	@IBOutlet public weak var hoursLabel: UILabel?
	@IBOutlet public weak var dayNumberLabel: UILabel?
	
	@IBOutlet public weak var backgroundShpe: UIView?
	
	@IBInspectable public var seletedShapeColor: UIColor = UIColor.redColor()
	@IBInspectable public var unselectedShapeColor: UIColor = UIColor.redColor()
	
	@IBInspectable public var unselectedTextColor: UIColor = UIColor.redColor()
	@IBInspectable public var selectedTextColor: UIColor = UIColor.grayColor()
	
	override public var selected: Bool {
		get{
			return super.selected
		}
		set{
			super.selected = newValue
			
			if newValue {
				self.selectCell()
			} else {
				self.deselectCell()
			}
		}
	}
	
    override public func awakeFromNib() {
        super.awakeFromNib()
		selected = false;
        // Initialization code
    }

	public func selectCell() {
		print("cell selected")
		self.weekDayLabel?.textColor = selectedTextColor
		self.hoursLabel?.textColor = selectedTextColor
		self.dayNumberLabel?.textColor = UIColor.whiteColor()
		self.backgroundShpe?.backgroundColor = seletedShapeColor
	}
	
	public func deselectCell() {
		print("cell deselected")
		self.weekDayLabel?.textColor = unselectedTextColor
		self.hoursLabel?.textColor = unselectedTextColor
		self.dayNumberLabel?.textColor = unselectedTextColor
		self.backgroundShpe?.backgroundColor = unselectedShapeColor
	}
	
}
