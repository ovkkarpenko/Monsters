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
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CameraController") as! CameraViewController
        vc.modalPresentationStyle = .fullScreen
        vc.monster = monster
        
        view.present(vc, animated: true)
    }
}
