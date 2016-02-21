//
//  DateButton.swift
//  CollectionViewController
//
//  Created by Douglas Barreto on 2/19/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

@IBDesignable public class DateButtonView: UIView {
	public var view:UIView!
	
	@IBOutlet public weak var dayLabel: UILabel!
	@IBOutlet public weak var prefixDayLabel: UILabel!
	@IBOutlet public weak var hoursLabel: UILabel!
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		view = loadViewFromNib()
	}
	
	public func loadViewFromNib() -> UIView
	{
		let bundle = NSBundle(forClass: self.dynamicType)
		let nib = UINib(nibName: self.nibName(), bundle: bundle)
		let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
		view.frame = self.bounds
		view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		self.addSubview(view)
		
		return view
	}
	
	private func nibName() -> String {
		return String(self.dynamicType)
	}
	
	// MARK: - ViewModel
	
	public var viewModel:DateButtonViewModel? {
		didSet{
			viewModel?.dateLabel.observe {
				[unowned self] in
				self.dayLabel.text = $0
			}
			
			viewModel?.prefixDayLabel.observe {
				[unowned self] in
				self.prefixDayLabel.text = $0
			}
			
			viewModel?.hoursLabel.observe {
				[unowned self] in
				self.hoursLabel.text = $0
			}
		}
	}
	
	public func loadViewModel(viewModel: DateButtonViewModel) {
		self.viewModel = viewModel
	}
	
	// MARK: - IBInspectable
	
	@IBInspectable public var prefixDay: String? {
		get {
			return prefixDayLabel.text
		}
		set {
			prefixDayLabel.text = newValue
		}
	}
	
	@IBInspectable public var day: String? {
		get{
			return dayLabel.text
		}
		set {
			dayLabel.text = newValue
		}
	}
	
	@IBInspectable public var hours: String? {
		get{
			return hoursLabel.text
		}
		set {
			hoursLabel.text = newValue
		}
	}
	
	
}