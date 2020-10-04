//
//  RootRootInteractorOutput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import Foundation

protocol RootInteractorOutput: class {
    
    func allowed()
    func needPermition(_ alert: UIAlertController)
}
