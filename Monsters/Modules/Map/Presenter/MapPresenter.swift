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
        LocationManager.shared.getLocation(completion: { c in
            self.interactor.generateMonsters(coordinate: c!, count: 20)
            
            self.view.mapView.camera = GMSCameraPosition(
                latitude: c!.latitude,
                longitude: c!.longitude,
                zoom: 13)
        })
    }
    
    func putMonstersOnMap(monsters: [Monster]) {
        for monster in monsters {
            let marker = GMSMarker(position: monster.coordinate)
            marker.icon = monster.image
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
}
