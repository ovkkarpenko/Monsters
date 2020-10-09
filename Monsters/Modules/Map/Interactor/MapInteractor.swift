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
        var imageIndex = 0
        var monsters: [Monster] = []
        
        for i in 0..<count {
            guard let imageSmall = UIImage(named: "monsters/\(imageIndex)Small"),
                  let imageFull = UIImage(named: "monsters/\(imageIndex)Full") else { continue }
            
            let monster = Monster(
                imageName: "\(imageIndex)",
                name: "Monster\(i)",
                level: Int.random(in: 1...40),
                imageSmall: imageSmall,
                imageFull: imageFull,
                coordinate: randomDistance(coordinate))
            
            imageIndex = imageIndex == 4 ? 0 : imageIndex+1
            monsters.append(monster)
        }
        
        output.putMonstersOnMap(coordinate: coordinate, monsters: monsters)
    }
    
    private func randomDistance(_ c: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
//        let maxDistance = 0.01
//        let minDistance = 0.0001
        let maxDistance = 0.002
        let minDistance = 0.0001
        let latitude = Double.random(in: minDistance...maxDistance)
        let longitude = Double.random(in: minDistance...maxDistance)
        
        return CLLocationCoordinate2D(
            latitude: Int.random(in: 0...100) % 2 == 0 ? c.latitude + latitude : c.latitude - latitude,
            longitude: Int.random(in: 0...100) % 2 == 0 ? c.longitude + longitude : c.longitude - longitude)
    }
}
