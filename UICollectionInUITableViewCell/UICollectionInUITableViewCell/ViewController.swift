//
//  ViewController.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/21/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

public class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

	@IBOutlet public weak var collectionView: UICollectionView?
	
	public var weeks:[Week]!
	
	public static var v:ViewController!
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		
		weeks = Week.getWeeks(from: NSDate(), weeksBefore: 2, weeksAfter: 2)
		
		
	}


	override public func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return weeks.count
	}
	
	public func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
		
		let cell:DateCollectionViewCell = cell as! DateCollectionViewCell
		
		if let colletion = cell.collection {
			let index = indexPath.row
			let week = weeks[index]
			print("Index: \(index) Week:\(week.days.first?.date)")
			colletion.week = week
			colletion.reloadData()
		}
		
	}

 
	static var i:Int = 0
	public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell:DateCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("DateCollectionViewCell", forIndexPath: indexPath) as! DateCollectionViewCell
		
//		if let colletion = cell.collection {
//			let index = indexPath.row
//			let week = weeks[index]
//			print("Index: \(index) Week:\(week.days.first?.date)")
//			colletion.week = week
//		}
		
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

