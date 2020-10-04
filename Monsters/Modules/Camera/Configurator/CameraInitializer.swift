//
//  CameraCameraInitializer.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class CameraModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var cameraViewController: CameraViewController!

    override func awakeFromNib() {

        let configurator = CameraModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: cameraViewController)
    }

}
