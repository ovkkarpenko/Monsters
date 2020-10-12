//
//  Monster.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 04.10.2020.
//

import UIKit
import Foundation
import CoreLocation
import RealmSwift

struct Monster {
    
    var imageName: String
    var name: String
    var level: Int
    var imageSmall: UIImage
    var imageFull: UIImage
    var coordinate: CLLocationCoordinate2D
    
    static func toModel(monsterRealm: MonsterRealm) -> Monster {
        let imageSmall = UIImage(named: "monsters/\(monsterRealm.imageName)Small") ?? UIImage()
        let imageFull = UIImage(named: "monsters/\(monsterRealm.imageName)Full") ?? UIImage()
        
        return Monster(
            imageName: monsterRealm.imageName,
            name: monsterRealm.name,
            level: monsterRealm.level,
            imageSmall: imageSmall,
            imageFull: imageFull,
            coordinate: monsterRealm.coordinate)
    }
    
    func toRealm() -> MonsterRealm {
        return MonsterRealm(
            imageName: imageName,
            name: name,
            level: level,
            latitude: coordinate.latitude,
            longitude: coordinate.longitude)
    }
}

extension Monster: Equatable {
    
    static func == (left: Monster, right: Monster) -> Bool {
        return left.coordinate.latitude == right.coordinate.latitude
            && left.coordinate.longitude == right.coordinate.longitude
    }
}

class MonsterRealm: Object {
    
    @objc dynamic var imageName: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var level: Int = 0
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
    
    init(imageName: String, name: String, level: Int, latitude: Double, longitude: Double) {
        self.imageName = imageName
        self.name = name
        self.level = level
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init() {
        super.init()
    }
}

class MonsterViewCell: UITableViewCell {
    
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
}
