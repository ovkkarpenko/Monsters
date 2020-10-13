//
//  MapMapRouter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class MapRouter: MapRouterInput {

    func openTeam(_ view: UIViewController) {
        view.performSegue(withIdentifier: "OpenTeamSegue", sender: nil)
    }
    
    func openCamera(_ view: UIViewController, monster: Monster) {
        view.performSegueWithIdentifier(identifier: "OpenCameraSegue", sender: nil) { segue in
            let vc = segue.destination as! CameraViewController
            vc.monster = monster
        }
    }
}
