//
//  MapMapInitializer.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class MapModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mapViewController: MapViewController!

    override func awakeFromNib() {

        let configurator = MapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mapViewController)
    }

}
