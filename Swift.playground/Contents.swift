//: Playground - noun: a place where people can play

import Cocoa


private func insertOptionsLinkAtrributesToRange( inout attriutedString attStr:NSMutableAttributedString, range:NSRange, option:String ){
    
    let foregroundAttr = [ NSForegroundColorAttributeName: "UIColor.greenColor()" ];
    let underLineAttr = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleDouble.rawValue ];
    let linkAttr = [ NSLinkAttributeName: NSURL(string: "\(option)")!];
    
    attStr.addAttributes(foregroundAttr, range: range);
    attStr.addAttributes(underLineAttr, range: range);
    attStr.addAttributes(linkAttr, range: range);
    //print(attStr);
}


private func replaceVariablenName( name:String , valueToAdd:String, inout attString:NSMutableAttributedString){
    
    let tempStr = attString.string as NSString;
    var rangeStr = tempStr.rangeOfString(name);
    
    attString.replaceCharactersInRange(rangeStr, withString: valueToAdd);
    rangeStr = NSMakeRange(rangeStr.location, valueToAdd.characters.count);
    insertOptionsLinkAtrributesToRange(attriutedString: &attString, range: rangeStr, option: valueToAdd);
    //print(attString);
}

var attString:NSMutableAttributedString = NSMutableAttributedString(string: "Douglas Mendes Barreto");
let tempStr = attString.string as NSString;
let rangeStr = tempStr.rangeOfString("Mendes");
attString.replaceCharactersInRange(rangeStr, withString: "Mendes Barreto")

let text = "Douglas Mendes Barreto";
var att = NSMutableAttributedString(string: text);

print(rangeStr);

var range = NSMakeRange(rangeStr.location, 30);

print(range);



replaceVariablenName("Mendes", valueToAdd: "Mayara", attString: &att);













