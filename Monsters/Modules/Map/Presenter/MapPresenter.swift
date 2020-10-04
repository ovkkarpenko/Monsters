//
//  MapMapPresenter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

class MapPresenter: MapModuleInput, MapViewOutput, MapInteractorOutput {

    weak var view: MapViewInput!
    var interactor: MapInteractorInput!
    var router: MapRouterInput!

    func viewIsReady() {

    }
}
