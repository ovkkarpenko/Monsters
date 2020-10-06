//
//  CameraCameraInteractorOutput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import ARKit
import Foundation

protocol CameraInteractorOutput: class {

    func putNodeOnCamera(header: SCNNode, monster: SCNNode)
}
