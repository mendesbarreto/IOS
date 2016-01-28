//
//  BWDiplayTextProtocol.swift
//  Bike 2 Work
//
//  Created by Douglas Barreto on 1/27/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

import Foundation
import UIKit


protocol BWDisplayTextProtocol {
    var attributedText: NSMutableAttributedString{get};
    var stringText: String{get};
    func updateText() ->NSMutableAttributedString;
}