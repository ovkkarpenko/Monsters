//
//  SideMenuViewController.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 13.10.2020.
//

import UIKit
import SideMenuSwift

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var generateNewMonstersButton: UIButton!
    @IBOutlet weak var disableDistanceLimitButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let sideMenu = sideMenuController,
           let userRoles = sideMenu.userRoles {
            
            let isAdmin = !userRoles.contains("ADMIN")
            
            generateNewMonstersButton.isHidden = isAdmin
            disableDistanceLimitButton.isHidden = isAdmin
        }
    }
    
    @IBAction func generateNewMonsters(_ sender: Any) {
        sideMenuController?.generateNewMonstersDelegate?.generate()
    }
    
    @IBAction func disableDistanceLimit(_ sender: Any) {
        sideMenuController?.disableDistanceLimitDelegate?.disable()
    }
}
