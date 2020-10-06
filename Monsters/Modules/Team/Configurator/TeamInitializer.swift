//
//  TeamTeamInitializer.swift
//  Monsters
//
//  Created by Alex on 06/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class TeamModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var teamViewController: TeamViewController!

    override func awakeFromNib() {

        let configurator = TeamModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: teamViewController)
    }

}
