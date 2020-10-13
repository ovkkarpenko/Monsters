//
//  LoginLoginInteractor.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput!
    
    var users: [User] = [
        User(login: "user", password: "user", roles: ["USER"]),
        User(login: "admin", password: "admin", roles: ["USER", "ADMIN"])
    ]
    
    func authorization(user: User) {
        let findUser = users.first(where: { return $0.login == user.login && $0.password == user.password })
        
        if let findUser = findUser,
           let roles = findUser.roles {
            output.authorizationSuccessful(roles: roles)
        } else {
            output.authorizationFailed()
        }
    }
    
}
