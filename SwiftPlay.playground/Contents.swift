//: Playground - noun: a place where people can play
import UIKit
import Foundation
import CoreData

public class Store : NSObject{
	let storesToDisk: Bool = true
}
public class BookmarkStore: Store {
	let name:String;
	let itemCount: Int;
	
	public init(storeName  name:String , storeItemCount:Int = 0) {
		
		self.name = name
		self.itemCount = storeItemCount
	}
	
}

protocol StructDecoder {
	static var EntityName: String { get }
	func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject
}

extension StructDecoder {
	func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject {
		let entityName = self.dynamicType.EntityName
		
		guard let desc = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context) else {
			throw SerializationError.UnknownEntity(name: entityName)
		}
		
		let	managedObj = NSManagedObject(entity: desc, insertIntoManagedObjectContext: context)
		
		let mirror = Mirror(reflecting: self)
		
		guard mirror.displayStyle == .Struct else { throw SerializationError.StructRequired }
		
		for case let (label?, anyValue) in mirror.children {
			if let value = anyValue as? AnyObject {
				managedObj.setValue(value, forKey: label)
			} else {
				throw SerializationError.UnsupportedSubType(label: label)
			}
		}
		
		return managedObj
	}
}

public struct Bookmark : StructDecoder{
	let title: String
	let url: NSURL
	let pagerank: Int
	let createDate: NSDate
	static var EntityName: String = ""
}

enum SerializationError: ErrorType {
	// We only support structs
	case StructRequired
	// The entity does not exist in the Core Data Model
	case UnknownEntity(name: String)
	// The provided type cannot be stored in core data
	case UnsupportedSubType(label: String?)
}

let Classs = NSClassFromString("Store")

var instance = Classs.self














