//
//  ViewController.swift
//  CollectionViewController
//
//  Created by Douglas Barreto on 2/19/16.
//  Copyright © 2016 Douglas. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {

	
	var colors:[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor()]
	
	public let pageControl:UIPageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
	
	public override func viewDidLoad() {
		
		self.pageControl.backgroundColor = UIColor.blueColor()
		
		self.pageControl.numberOfPages = 10
		self.pageControl.currentPage = 0
		self.pageControl.numberOfPages = colors.count
		self.pageControl.currentPage = 0
		self.pageControl.tintColor = UIColor.redColor()
		self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
		self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
		
		self.view.addSubview(self.pageControl)
		
		
	}
	
}

