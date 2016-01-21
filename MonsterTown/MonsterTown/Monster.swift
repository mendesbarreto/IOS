//
//  Monster.swift
//  MonsterTown
//
//  Created by Douglas Barreto on 1/21/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

class Monster
{
    var town:Town?;
    var name = "Monster";
    
    static func makeSpo()
    {
        
    }
    class func makeSpookeNoise() -> String{
        return "Brains....";
    }
    
    func terrorizeTown(){
        if town != nil{
            print("\(name) is terrorizing  a town!");
        }
        else{
            print("\(name) hasn't found a town to terrorize yet...");
        }
    }
}