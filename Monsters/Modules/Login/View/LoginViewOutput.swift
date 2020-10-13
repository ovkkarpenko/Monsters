//
//  LoginLoginViewOutput.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

protocol LoginViewOutput {

    /**
        @author Alex
        Notify presenter that view is ready
    */

    func viewIsReady()
    func okButtonClicked(user: User)
}
