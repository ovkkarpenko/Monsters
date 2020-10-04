//
//  RootRootRouter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RootRouter: RootRouterInput {
    
    func openMap(_ view: UIViewController) {
        view.performSegue(withIdentifier: "OpenMapSegue", sender: nil)
    }
}
