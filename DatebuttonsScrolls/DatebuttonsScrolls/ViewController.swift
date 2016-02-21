//
//  ViewController.swift
//  DatebuttonsScrolls
//
//  Created by Douglas Barreto on 2/19/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let view:DateButtonView? = DateButtonView.instantiateFromNib()
		let view2:ButtonView = ButtonView()
		
		self.view.addSubview(view!)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

