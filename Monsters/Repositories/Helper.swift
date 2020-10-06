//
//  Helper.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 06.10.2020.
//

import Foundation

class Helper {
    
    static let shared = Helper()
    
    func randomFLoat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF * (max - min) + min)
    }
}
