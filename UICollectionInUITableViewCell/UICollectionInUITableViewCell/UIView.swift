//
//  UIView.swift
//  DatebuttonsScrolls
//
//  Created by Douglas Barreto on 2/20/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

// MARK: Exceptions
enum UIViewLoadNibFileError: ErrorType {
	case NibNameCouldNotBeNull
	case NibNotFound
	case BundleNoFoundForClass(string:String)
	case UIViewsNotExistsInBundle
}




//- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute parent:(UIView *) uiComponent
//{
//	return [NSLayoutConstraint constraintWithItem:uiComponent
//		attribute:attribute
//		relatedBy:NSLayoutRelationEqual
//		toItem:item
//		attribute:attribute
//		multiplier:1.0
//		constant:0.0];
//	}
//	




//	/*@! @brief This method attachs the FDCShotUIView uiComponent*/
//	- (void)constraintTo:(UIView *) uiComponent {
//		
//		self.translatesAutoresizingMaskIntoConstraints = NO;
//		[uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeTop parent:uiComponent]];
//		[uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeLeft parent:uiComponent]];
//		[uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeBottom parent:uiComponent]];
//		[



// MARK: Protocols
protocol UIViewLoadable {
	
	static func instantiateFromNib<T : UIView>() -> T?
	static func instantiateFromNib<T : UIView>(name nibName: String?) throws -> T
	static func getViewByTypeFrom<T: UIView>(listViews nibViews: Array<AnyObject> ) -> T?
	
	func defaultNibName() -> String
	func loadFromNib(name nibName:String?) -> UIView?
}

// MARK: Extensions
extension UIView :UIViewLoadable {
	
	public func loadFromNib(name nibName:String? = nil) -> UIView? {
		
		//TODO: Perform validations
		//let aClass :AnyClass = self.dynamicType
		let name: String = nibName != nil ? nibName! : self.defaultNibName()
		let bundle = NSBundle.mainBundle()
		let nib = UINib(nibName: name, bundle: bundle)
		let nibViews = nib.instantiateWithOwner(self, options: nil)
		
		if let view = nibViews.first as? UIView {
			return view
		}
		
		return nil
	}
	
	//Returns the class name
	public func defaultNibName() -> String {
		return String(self.dynamicType)
	}

	public static func instantiateFromNib<T : UIView>() -> T? {

		do {
			let view: T = try instantiateFromNib(name: T.getClassName())
			return view
		} catch UIViewLoadNibFileError.NibNameCouldNotBeNull {
			print("Could not load nib file the name was empyt")
		}catch UIViewLoadNibFileError.NibNotFound {
			print("Nib not found")
		}catch {
			print("Could not load nib file")
		}
		
		return nil
	}
	
	public static func instantiateFromNib<T : UIView>(name
		nibName: String?) throws -> T
	{
		let name: String = nibName != nil ? nibName! : T.getClassName()
		
		//Validating NibName
		guard name.characters.count > 0 else {
			throw UIViewLoadNibFileError.NibNameCouldNotBeNull
		}
		
		//Validating Class Bundle
		guard let bundle: NSBundle = NSBundle(forClass: T.self) else {
			throw UIViewLoadNibFileError.BundleNoFoundForClass(string: T.getClassName())
		}
		
		//Validating Nib
		guard let nib: UINib = UINib(nibName: name, bundle: bundle) else {
			throw UIViewLoadNibFileError.NibNotFound
		}
		
		//Instanciate all UIViews
		let nibViews = nib.instantiateWithOwner(nil, options: nil)
		
		//Verifing if has views insed the list
		guard nibViews.count > 0 else {
			throw UIViewLoadNibFileError.UIViewsNotExistsInBundle
		}
		
		guard let view: T = getViewByTypeFrom(listViews: nibViews) else {
			throw UIViewLoadNibFileError.NibNotFound
		}
		
		return view
	}
	
	//Verifing if has some view with the type requested
	public static func getViewByTypeFrom<T: UIView>(listViews nibViews: Array<AnyObject> ) -> T? {
		var tempView: T? = nil
		
		for v in nibViews {
			if let tog:T = v as? T {
				tempView = tog
			}
		}
		return tempView
	}

}
