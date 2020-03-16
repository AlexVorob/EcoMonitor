//
//  MapViewController.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 13.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = MapView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 48.567022, longitude: 9.715830, zoom: 6.0)
        //let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //self.rootView?.mapView = mapView

        self.rootView?.mapView?.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 48.567022, longitude: 9.715830)
        marker.appearAnimation = .pop
        marker.title = "Bad DitzenbachGermany"
        marker.snippet = "Germany"
        marker.map = self.rootView?.mapView
        
    }
}
