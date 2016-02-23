//
//  ViewController.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

public class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

	
	public let colors:Array<UIColor> = [UIColor.blueColor(), UIColor.redColor(),UIColor.yellowColor()]
	public var collectionView: UICollectionView!
	
	public static var v:ViewController!
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		
	}


	override public func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
 
	static var i:Int = 0
	public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("DateCollectionViewCell", forIndexPath: indexPath)
		
		cell.backgroundColor = UIColor.random()
		return cell
	}
	
	public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: 64)
	}
	
	public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		//self.collectionView.p
	}
	
}

