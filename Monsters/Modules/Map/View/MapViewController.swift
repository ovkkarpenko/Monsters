
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
    
    var monster: Monster?
    var output: MapViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let configurator = MapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenCameraSegue" {
            let vc = segue.destination as! CameraViewController
            vc.monster = monster
        }
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
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            self.output.timerNearestMonstersTicked()
        }
        
        Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { _ in
            self.output.timerGenerateMonstersTicked(chanceToRemoveMonster: 20)
        }
    }
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let monster = marker.monster,
              let iconView = marker.iconView else { return true }
        
        if iconView.isHidden { return true }
        self.monster = monster
        output.monsterClicked(monster: monster)
        
        return true
    }
}
