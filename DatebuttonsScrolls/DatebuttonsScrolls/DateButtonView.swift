//
//  DateButtonView.swift
//  DatebuttonsScrolls
//
//  Created by Douglas Barreto on 2/19/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

@IBDesignable public class DateButtonView: UIView {
	
	//public var view: UIView!
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		//view = loadViewFromNib()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		//view = loadViewFromNib()
	}
//	
//	public func loadViewFromNib() -> UIView {
//		let bundle = NSBundle(forClass: self.dynamicType)
//		let nib = UINib(nibName: nibName(), bundle: bundle)
//		let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
//		
//		//view.frame = bounds
//		//view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//		addSubview(view);
//		
//		return view
//	}
//	
//	// MARK: - Private
//	private func nibName() -> String {
//		return String(self.dynamicType)
//	}
//	
	private func setupView(){
		
		self.setNeedsDisplay()
		
	}
}
