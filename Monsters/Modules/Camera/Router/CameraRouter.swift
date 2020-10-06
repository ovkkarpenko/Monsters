//
//  CameraCameraRouter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class CameraRouter: CameraRouterInput {

    func closeCamera(view: UIViewController) {
        view.dismiss(animated: true)
    }
}
