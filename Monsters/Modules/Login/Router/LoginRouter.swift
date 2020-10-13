//
//  LoginLoginRouter.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterInput {

    func openMap(_ view: UIViewController, userRoles: [String]) {
        view.performSegueWithIdentifier(identifier: "OpenMapSegue", sender: nil) { segue in
            let vc = segue.destination as! MapViewController
            vc.userRoles = userRoles
        }
    }
}
