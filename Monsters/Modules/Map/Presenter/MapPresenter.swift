//
//  MapMapPresenter.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapPresenter: MapModuleInput, MapViewOutput, MapInteractorOutput {
    
    weak var view: (MapViewInput & UIViewController)!
    var interactor: MapInteractorInput!
    var router: MapRouterInput!
    
    var mapMarkers: [GMSMarker] = []
    
    func viewIsReady() {
        
    }
    
    func moveCameraToCurrentLocation() {
        LocationManager.shared.getLocation(completion: { c in
            guard let coordinate = c else { return }
            
            if self.mapMarkers.count == 0 {
                self.interactor.generateMonsters(coordinate: coordinate, count: 30)
            }
            
            self.view.mapView.camera = GMSCameraPosition(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude,
                zoom: 17)
        })
    }
    
    func putMonstersOnMap(coordinate: CLLocationCoordinate2D, monsters: [Monster]) {
        for monster in monsters {
            let marker = GMSMarker(position: monster.coordinate)
            marker.monster = monster
            marker.iconView = UIImageView(image: monster.imageSmall)
            marker.iconView?.isHidden = GMSGeometryDistance(coordinate, marker.position) > 300
            marker.map = view.mapView
            mapMarkers.append(marker)
        }
    }
    
    func increaseMapButtonClicked() {
        view.mapView.animate(toZoom: view.mapView.camera.zoom+1)
    }
    
    func decreaseMapButtonClicked() {
        view.mapView.animate(toZoom: view.mapView.camera.zoom-1)
    }
    
    func teamButtonClicked() {
        router.openTeam(view)
    }
    
    func monsterClicked(monster: Monster) {
        LocationManager.shared.getLocation(completion: { c in
            guard let coordinate = c else { return }
            let distance = GMSGeometryDistance(coordinate, monster.coordinate)
//            if distance > 100 {
            if false {
                let alert = BlackAlertController(
                    title: "",
                    message: "You are too far from\nthe monster - \(Int(distance)) meters.",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.view.present(alert, animated: true)
            } else {
                let markerIndex = self.mapMarkers.firstIndex(where: { return $0.monster == monster })
                if let markerIndex = markerIndex {
                    self.mapMarkers[markerIndex].map = nil
                    self.mapMarkers.remove(at: markerIndex)
                }
                
                self.router.openCamera(self.view)
            }
        })
    }
    
    func timerNearestMonstersTicked() {
        LocationManager.shared.getLocation(completion: { c in
            guard let coordinate = c else { return }
            for marker in self.mapMarkers {
                marker.iconView?.isHidden = GMSGeometryDistance(coordinate, marker.position) > 300
            }
        })
    }
    
    
    func timerGenerateMonstersTicked(chanceToRemoveMonster: Int) {
        for marker in mapMarkers {
            if Int.random(in: 1...100) <= chanceToRemoveMonster {
                marker.map = nil
                mapMarkers.removeAll { return $0 == marker }
            }
        }
        
        LocationManager.shared.getLocation(completion: { c in
            guard let coordinate = c else { return }
            self.interactor.generateMonsters(coordinate: coordinate, count: 6)
        })
    }
}
