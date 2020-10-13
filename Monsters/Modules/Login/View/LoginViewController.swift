//
//  LoginLoginViewController.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {
    
    @IBOutlet weak var loginTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var output: LoginViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func ok(_ sender: Any) {
        guard let login = loginTextfield.text,
              let password = passwordTextfield.text else { return }
        
        output.okButtonClicked(user: User(login: login, password: password))
    }
    
    // MARK: LoginViewInput
    func setupInitialState() {
        
    }
}
