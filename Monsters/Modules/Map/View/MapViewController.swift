
//
//  MapMapViewController.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, MapViewInput {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var output: MapViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let configurator = MapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }
    
    @IBAction func increaseMap(_ sender: Any) {
        output.increaseMapButtonClicked()
    }
    
    @IBAction func decreaseMap(_ sender: Any) {
        output.decreaseMapButtonClicked()
    }
    
    @IBAction func currentLocation(_ sender: Any) {
        output.moveCameraToCurrentLocation()
    }
    
    @IBAction func team(_ sender: Any) {
        output.teamButtonClicked()
    }
    
    // MARK: MapViewInput
    func setupInitialState() {
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        output.moveCameraToCurrentLocation()
    }
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let monster = marker.monster {
            output.monsterClicked(monster: monster)
            return true
        }
        return false
    }
}
