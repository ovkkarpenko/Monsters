//
//  RealmStorage.swift
//  Monsters
//
//  Created by Oleksandr Karpenko on 06.10.2020.
//

import RealmSwift
import Foundation

struct RealmStorage {
    private let realm = try! Realm()
    
    static let shared = RealmStorage()
    
    func add(_ model: Object) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func remove(_ model: Object) {
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func getMonsters() -> [MonsterRealm] {
        return Array(realm.objects(MonsterRealm.self))
    }
}
