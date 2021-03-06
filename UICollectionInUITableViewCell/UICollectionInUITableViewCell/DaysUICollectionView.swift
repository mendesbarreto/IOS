//
//  DaysUICollectionView.swift
//  UICollectionInUITableViewCell
//
//  Created by Douglas Barreto on 2/23/16.
//  Copyright © 2016 CoderKingdom. All rights reserved.
//

import UIKit

public class DaysUICollectionView: UICollectionView , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

	public var week:Week?
	
	//public let signal:Signal<Day> = Signal<Day>()
	
	public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: frame, collectionViewLayout: layout)
		self.registerCell()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		registerCell()
	}
	
	let SMEPGiPadViewControllerCellWidth:Int = 48;
	
	
//	public func collectionView(collectionView: UICollectionView,
//		layout collectionViewLayout: UICollectionViewLayout,
//		sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//			let kWhateverHeightYouWant:CGFloat = 100
//			return CGSizeMake(collectionView.bounds.size.width, kWhateverHeightYouWant)
//	}
	
//	public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//		let numberOfCells = 7
//		
//		
//		let edgeInsets:Int = (Int(self.frame.size.width) - (numberOfCells * SMEPGiPadViewControllerCellWidth)) / (numberOfCells + 1)
//		
//		
//		return UIEdgeInsetsMake(0, 40, 0, 40)
//	}
	
	public func registerCell() {
		self.delegate = self
		self.dataSource = self
		
		let nib = UINib(nibName: "DayCollectionViewCell", bundle:nil)
		self.registerNib(nib, forCellWithReuseIdentifier: "DayCollectionViewCell")
		
		self.backgroundColor = UIColor.whiteColor()
	}
	
	public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 7
	}
	
	public func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
		
		let dayCell: DayCollectionViewCell = cell as! DayCollectionViewCell
		
		if let week = self.week {
			let weekDay = NSDate().weekday()
			let day:Day = week.days[indexPath.row]
			//print( day.description() )
			dayCell.dayNumberLabel?.text = String(day.number)
			dayCell.weekDayLabel?.text = String(day.namePrefix)
			
			if day.date.isWeekDay(weekDay) {
				dayCell.selected = true
				self.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.None)
			}
		}
		
	}
	
	public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		print(week?.days[indexPath.row].date)
	}
	public func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
		
	}
	
	
	public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell:DayCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("DayCollectionViewCell", forIndexPath: indexPath) as! DayCollectionViewCell
		
		
		//cell.backgroundColor = UIColor.random()
		return cell
	}
	
	public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		
		let cellWidth:CGFloat = collectionView.bounds.size.width / 7;
		return CGSize(width: cellWidth, height: 64)
	}
	
}
