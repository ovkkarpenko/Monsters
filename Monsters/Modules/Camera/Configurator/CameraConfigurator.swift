//
//  CameraCameraConfigurator.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class CameraModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CameraViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CameraViewController) {

        let router = CameraRouter()

        let presenter = CameraPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CameraInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
