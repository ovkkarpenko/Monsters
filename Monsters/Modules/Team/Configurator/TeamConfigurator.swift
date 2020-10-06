//
//  TeamTeamConfigurator.swift
//  Monsters
//
//  Created by Alex on 06/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class TeamModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TeamViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TeamViewController) {

        let router = TeamRouter()

        let presenter = TeamPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TeamInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.setupInitialState()
    }

}
