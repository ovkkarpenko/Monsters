//
//  LoginLoginInteractorOutput.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: class {

    func authorizationSuccessful(roles: [String])
    func authorizationFailed()
}
