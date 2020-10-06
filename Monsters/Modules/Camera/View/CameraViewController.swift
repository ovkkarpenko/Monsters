//
//  CameraCameraViewController.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class CameraViewController: UIViewController, CameraViewInput {

    @IBOutlet weak var sceneView: ARSCNView!
    
    var monster: Monster?
    var output: CameraViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let configurator = CameraModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    @IBAction func tryCatchMonster(_ sender: Any) {
        if let monster = monster {
            output.tryCatchMonsterButtonClicked(monster: monster)
        }
    }
    
    // MARK: CameraViewInput
    func setupInitialState() {
        sceneView.delegate = self
        sceneView.scene.physicsWorld.contactDelegate = self
    }
}

extension CameraViewController: ARSCNViewDelegate, SCNPhysicsContactDelegate {
    
    
}
