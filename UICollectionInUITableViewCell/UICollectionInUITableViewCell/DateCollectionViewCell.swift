//
//  DateCollectionViewCell.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

public class DateCollectionViewCell: UICollectionViewCell {

	public var view: UIView!
	@IBOutlet public weak var collection:DaysUICollectionView?
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		//self.initWithNib()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	public func initWithNib() {
		view = self.loadFromNib()
		//self.addSubview(view)
		//view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
	}
	
	
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
    }

}
