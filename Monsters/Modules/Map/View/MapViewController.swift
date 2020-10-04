//
//  MapMapViewController.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MapViewInput {

    let configurator = MapModuleConfigurator()
    var output: MapViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }

    // MARK: MapViewInput
    func setupInitialState() {
    }
}
