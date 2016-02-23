//
//  ButtomView.swift
//  DatebuttonsScrolls
//
//  Created by Douglas Barreto on 2/20/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

public class DateSliderMenuView: UICollectionView {
	
//	public var view: UIView?
//	
//	public var collectionView:UICollectionView!
//	
	
	override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: frame, collectionViewLayout: layout)
		initWithNib()
	}

	required public init?(coder aDecoder: NSCoder) {
	    super.init(coder: aDecoder)
		initWithNib()
	}
	
	public func initWithNib() {
		//view = self.loadFromNib()
		self.userInteractionEnabled = true
		let nib = UINib(nibName: "DateCollectionViewCell", bundle:nil)
		self.registerNib(nib, forCellWithReuseIdentifier: "DateCollectionViewCell")
		self.backgroundColor = UIColor.whiteColor()
		self.pagingEnabled = true
	}
	
	
}