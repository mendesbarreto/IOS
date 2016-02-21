//
//  ButtomView.swift
//  DatebuttonsScrolls
//
//  Created by Douglas Barreto on 2/20/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

public class ButtonView: UIView {
	
	public var view: UIView?
	
	@IBOutlet public weak var button:UIButton?
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		initWithNib()
	}
	
	public func initWithNib() {
		view = self.loadFromNib()
		addSubview(view!)
		print(button)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initWithNib()
	}
	
	
}