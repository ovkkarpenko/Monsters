//
//  MapMapViewInput.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import GoogleMaps

protocol MapViewInput: class {

    /**
        @author Alex
        Setup initial state of the view
    */

    var mapView: GMSMapView! { get set }
    
    func setupInitialState()
}
