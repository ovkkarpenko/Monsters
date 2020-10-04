//
//  RootRootPresenter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RootPresenter: RootModuleInput, RootViewOutput, RootInteractorOutput {
    
    weak var view: (RootViewInput & UIViewController)!
    var interactor: RootInteractorInput!
    var router: RootRouterInput!
    
    func viewIsReady() {
        interactor.requestGeoAccess()
    }
    
    func allowed() {
        router.openMap(view)
    }
    
    func needPermition(_ alert: UIAlertController) {
        view.present(alert, animated: true)
    }
}
