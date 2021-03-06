//
//  CameraCameraPresenter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import ARKit
import UIKit

class CameraPresenter: CameraModuleInput, CameraViewOutput, CameraInteractorOutput {
    
    weak var view: (CameraViewInput & UIViewController)!
    var interactor: CameraInteractorInput!
    var router: CameraRouterInput!
    
    let helper = Helper.shared
    
    func viewIsReady() {
        if let monster = view.monster {
            interactor.createMonster(monster: monster)
        }
    }
    
    func putMonsterOnCamera(header: SCNNode, monster: SCNNode) {
        let x = helper.randomFLoat(min: 0, max: 3)
        let y = helper.randomFLoat(min: -3, max: 0)
        let z: Float = -5.0
        
        header.position = SCNVector3(x, y+0.6, z)
        monster.position = SCNVector3(x, y, z)
        
        view.sceneView.scene.rootNode.addChildNode(header)
        view.sceneView.scene.rootNode.addChildNode(monster)
    }
    
    func tryCatchMonsterButtonClicked(monster: Monster) {
        let title = view.catchButton.title(for: .normal)
        if title == "Back to map" {
            router.closeCamera(view: view)
        } else {
            interactor.catchMonster(monster: monster)
        }
    }
    
    func displayResult(title: String, alert: UIAlertController) {
        view.catchButton.setTitle(title, for: .normal)
        view.present(alert, animated: true)
    }
}
