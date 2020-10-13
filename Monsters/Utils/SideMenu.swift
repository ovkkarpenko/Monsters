//
//  SideMenu.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 13.10.2020.
//

import SideMenuSwift
import Foundation

struct AssociatedKeys {
    
    static var userRoles: UInt8 = 0
    static var generateNewMonstersDelegate: UInt8 = 0
    static var disableDistanceLimitDelegate: UInt8 = 0
}

protocol GenerateNewMonstersDelegate {
    func generate()
}

protocol DisableDistanceLimitDelegate {
    func disable()
}

extension SideMenuController {
    
    var userRoles: [String]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.userRoles) as? [String]
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.userRoles, newValue as [String]?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var generateNewMonstersDelegate: GenerateNewMonstersDelegate? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.generateNewMonstersDelegate) as? GenerateNewMonstersDelegate
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.generateNewMonstersDelegate, newValue as GenerateNewMonstersDelegate?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var disableDistanceLimitDelegate: DisableDistanceLimitDelegate? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disableDistanceLimitDelegate) as? DisableDistanceLimitDelegate
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.disableDistanceLimitDelegate, newValue as DisableDistanceLimitDelegate?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
