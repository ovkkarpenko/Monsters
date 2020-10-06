//
//  TeamTeamPresenter.swift
//  Monsters
//
//  Created by Alex on 06/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

class TeamPresenter: TeamModuleInput, TeamViewOutput, TeamInteractorOutput {

    weak var view: TeamViewInput!
    var interactor: TeamInteractorInput!
    var router: TeamRouterInput!

    func viewIsReady() {
        
    }
}
