//
//  LoginLoginInitializer.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var loginViewController: LoginViewController!

    override func awakeFromNib() {

        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}
