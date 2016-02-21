//: Playground - noun: a place where people can play
import UIKit
import Foundation


public class PrefixGenerator: GeneratorType {
	public typealias Element = String
	
	let string: String
	var offset: String.Index
	
	public init( string:String ){
		self.string = string
		offset = string.startIndex
	}
	
	
	public func next() -> Element? {
		guard offset < string.endIndex else {
			return nil
		}
		self.offset = offset.successor()
		return string[self.string.startIndex..<offset]
	}
}


public class A {
	public var callback: ( ( String ) -> A )?
	
	public init(){
	
	}
	
}














