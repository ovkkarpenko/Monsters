//
//  RootRootInteractor.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RootInteractor: RootInteractorInput {
    
    weak var output: RootInteractorOutput!
    
    let accessAlert = BlackAlertController(
        title: "",
        message: "To show nearby monsters.\nThe application needs the access to your geolocation.",
        preferredStyle: .alert)
    let settingsAlert = BlackAlertController(
        title: "",
        message: "We do not know where you are on the map, let us determine your location, this is done in the device settings.",
        preferredStyle: .alert)
    
    init() {
        self.accessAlert.addAction(UIAlertAction(title: "Allow", style: .default, handler: { _ in
            LocationManager.shared.requestAccess(completion: { isSuccess in
                if isSuccess {
                    self.output.allowed()
                } else {
                    self.output.needPermition(self.settingsAlert)
                }
            })
        }))
        self.settingsAlert.addAction(UIAlertAction(title: "Go to settings", style: .default, handler: { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:])
        }))
    }
    
    func requestGeoAccess() {
        if LocationManager.shared.isEnabled {
            output.allowed()
        } else {
            let alert = LocationManager.shared.canRequestAccess ? accessAlert : settingsAlert
            output.needPermition(alert)
        }
    }
}
