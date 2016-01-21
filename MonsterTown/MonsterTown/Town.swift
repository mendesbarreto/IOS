//
//  Town.swift
//  MonsterTown
//
//  Created by Douglas Barreto on 1/21/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation

struct Town{
    var population = 5422;
    var numberOfStoplights = 4;
    
    func printTownDescription(){
        print("Popultion: \(population); number of stoplights: \(numberOfStoplights)");
    }
    
    mutating func changePopulation(amount:Int){
        population += amount;
    }
}