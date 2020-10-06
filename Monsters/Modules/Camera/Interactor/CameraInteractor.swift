//
//  CameraCameraInteractor.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import ARKit

class CameraInteractor: CameraInteractorInput {
    
    weak var output: CameraInteractorOutput!
    
    func createMonster(monster: Monster) {
        let alert = createAlert(title: monster.name)
        let headerNode = SCNNode(geometry: SCNPlane(width: 0.8, height: 0.2))
        headerNode.geometry?.materials = [alert]

        let monsterNode = SCNNode(geometry: SCNPlane(width: 0.7, height: 1))
        monsterNode.geometry?.materials.first?.diffuse.contents = monster.imageFull
        monsterNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        monsterNode.physicsBody?.isAffectedByGravity = false
        
        output.putNodeOnCamera(header: headerNode, monster: monsterNode)
    }
    
    private func createAlert(title: String) -> SCNMaterial {
        let sk = SKScene(size: CGSize(width: 3000, height: 1000))
        sk.backgroundColor = UIColor.clear
        
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 3000, height: 1000), cornerRadius: 200)
        rectangle.fillColor = UIColor.black
        rectangle.alpha = 0.8
        
        let lbl = SKLabelNode(text: title)
        
        lbl.fontSize = 250
        lbl.numberOfLines = 0
        lbl.fontColor = UIColor.white
        lbl.fontName = "System"
        lbl.position = CGPoint(x:1500,y:500)
        lbl.preferredMaxLayoutWidth = 2900
        lbl.horizontalAlignmentMode = .center
        lbl.verticalAlignmentMode = .center
        lbl.yScale = -1.0
            
        sk.addChild(rectangle)
        sk.addChild(lbl)
        
        let material = SCNMaterial()
        material.isDoubleSided = true
        material.diffuse.contents = sk
        return material
    }
}
