//
//  MapMapInteractorOutput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import CoreLocation

protocol MapInteractorOutput: class {

    func putMonstersOnMap(coordinate: CLLocationCoordinate2D,monsters: [Monster])
}
