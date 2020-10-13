//
//  LoginLoginPresenter.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {
    
    weak var view: (LoginViewInput & UIViewController)!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    
    func viewIsReady() {
        
    }
    
    func okButtonClicked(user: User) {
        interactor.authorization(user: user)
    }
    
    func authorizationSuccessful(roles: [String]) {
        router.openMap(view, userRoles: roles)
    }
    
    func authorizationFailed() {
        let alert = BlackAlertController(
            title: "User error",
            message: "You entered an incorrect username/password.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.view.present(alert, animated: true)
    }
}
