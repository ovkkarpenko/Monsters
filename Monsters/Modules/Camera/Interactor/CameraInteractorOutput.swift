//
//  CameraCameraInteractorOutput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import ARKit
import Foundation
import UIKit

protocol CameraInteractorOutput: class {

    func putMonsterOnCamera(header: SCNNode, monster: SCNNode)
    func displayResult(title: String, alert: UIAlertController)
}
