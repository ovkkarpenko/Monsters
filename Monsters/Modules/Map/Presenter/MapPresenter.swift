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
    
    func viewIsReady() {
        
    }
    
    func moveCameraToCurrentLocation() {
        LocationManager.shared.getLocation(completion: { coordinate in
            guard let coordinate = coordinate else { return }
            
            self.interactor.generateMonsters(coordinate: coordinate, count: 20)
            self.view.mapView.camera = GMSCameraPosition(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude,
                zoom: 13)
        })
    }
    
    func putMonstersOnMap(monsters: [Monster]) {
        for monster in monsters {
            let marker = GMSMarker(position: monster.coordinate)
            marker.monster = monster
            marker.icon = monster.imageSmall
            marker.map = view.mapView
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
        LocationManager.shared.getLocation(completion: { coordinate in
            guard let coordinate = coordinate else { return }
            
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
                self.router.openCamera(self.view, monster: monster)
            }
        })
    }
}
