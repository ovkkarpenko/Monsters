//
//  GMSMarker.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 05.10.2020.
//

import GoogleMaps
import Foundation

extension GMSMarker {
    struct AssociatedKeys {
        static var Monster: UInt8 = 0
    }
    
    var monster: Monster? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.Monster) as? Monster
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.Monster, newValue as Monster?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
