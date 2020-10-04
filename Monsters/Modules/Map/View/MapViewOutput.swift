//
//  MapMapViewOutput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

protocol MapViewOutput {

    /**
        @author Alex
        Notify presenter that view is ready
    */

    func viewIsReady()
    func moveCameraToCurrentLocation()
    func increaseMapButtonClicked()
    func decreaseMapButtonClicked()
    func teamButtonClicked()
}
