//
//  RootRootConfigurator.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RootModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RootViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RootViewController) {

        let router = RootRouter()

        let presenter = RootPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RootInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
