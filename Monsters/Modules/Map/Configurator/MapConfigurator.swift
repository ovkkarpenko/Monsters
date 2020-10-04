//
//  MapMapConfigurator.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class MapModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MapViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MapViewController) {

        let router = MapRouter()

        let presenter = MapPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MapInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
