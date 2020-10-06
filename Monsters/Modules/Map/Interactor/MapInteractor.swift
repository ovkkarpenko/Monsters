//
//  MapMapInteractor.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreLocation

class MapInteractor: MapInteractorInput {
    
    weak var output: MapInteractorOutput!
    
    func generateMonsters(coordinate: CLLocationCoordinate2D, count: Int) {
        var monsters: [Monster] = []
        
        for i in 0..<count {
            let imageName = "\(0)"
            guard let imageSmall = UIImage(named: "Monsters/\(imageName)Small"),
                  let imageFull = UIImage(named: "Monsters/\(imageName)Full") else { continue }
            
            let monster = Monster(
                imageName: "\(imageName)",
                name: "Monster\(i)",
                level: Int.random(in: 1...40),
                imageSmall: imageSmall,
                imageFull: imageFull,
                coordinate: randomDistance(coordinate))
            
            monsters.append(monster)
        }
        
        output.putMonstersOnMap(monsters: monsters)
    }
    
    private func randomDistance(_ c: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let maxDistance = 0.08
        let minDistance = 0.01
        let latitude = Double.random(in: minDistance...maxDistance)
        let longitude = Double.random(in: minDistance...maxDistance)
        
        return CLLocationCoordinate2D(
            latitude: Int.random(in: 0...100) % 2 == 0 ? c.latitude + latitude : c.latitude - latitude,
            longitude: Int.random(in: 0...100) % 2 == 0 ? c.longitude + longitude : c.longitude - longitude)
    }
}
