//
//  DaysCollectionViewCell.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/23/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

public class DaysCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet public weak var weekDayLabel: UILabel?
	@IBOutlet public weak var dayNumberLabel: UILabel?
	
	
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
