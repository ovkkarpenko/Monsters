//
//  CameraCameraPresenter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

class CameraPresenter: CameraModuleInput, CameraViewOutput, CameraInteractorOutput {

    weak var view: CameraViewInput!
    var interactor: CameraInteractorInput!
    var router: CameraRouterInput!

    func viewIsReady() {

    }
}
