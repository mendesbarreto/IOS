//: Playground - noun: a place where people can play

import Cocoa

struct Person
{
    var firstName = "Douglas";
    var lastName = "Mendes";
    
    
    mutating func changeName(fn:String, ln:String)
    {
        firstName = fn;
        lastName = ln;
    }
}

var p = Person();
let changer = Person.changeName;

changer(&p)("Mayara",ln:"Mendes");
