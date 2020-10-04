//
//  RootRootInitializer.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RootModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var rootViewController: RootViewController!

    override func awakeFromNib() {

        let configurator = RootModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: rootViewController)
    }

}
