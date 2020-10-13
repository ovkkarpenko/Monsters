//
//  MapMapViewOutput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import CoreLocation

protocol MapViewOutput {

    /**
        @author Alex
        Notify presenter that view is ready
    */

    var disableDistanceLimit: Bool { get set }
    
    func viewIsReady()
    func generateNewMonsters()
    func moveCameraToCurrentLocation()
    func increaseMapButtonClicked()
    func decreaseMapButtonClicked()
    func teamButtonClicked()
    func monsterClicked(monster: Monster)
    func timerNearestMonstersTicked()
    func timerGenerateMonstersTicked(chanceToRemoveMonster: Int)
}
