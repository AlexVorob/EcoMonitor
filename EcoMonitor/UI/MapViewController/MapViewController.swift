//
//  MapViewController.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 13.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, RootViewRepresentable, GMSMapViewDelegate {
    
    typealias RootView = MapView
    
    // MARK: -
    // MARK: - Properties
    
    let navigationVC = UINavigationController()
    var aopModels = AOPModels()

    // MARK: -
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.rootView?.mapView?.delegate = self
        self.rootView?.mapView?.settings.myLocationButton = true
        self.loadData()
        self.drawMarkers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: -
    // MARK: - Private

    private func drawMarkers() {
        let camera = GMSCameraPosition.camera(withLatitude: 48.567022, longitude: 9.715830, zoom: 6.0)
        
        self.rootView?.mapView?.camera = camera
        
        self.aopModels.models.forEach {
            let marker = MapAOPMarker(model: $0)
            marker.map = self.rootView?.mapView
        }
        let a = CLLocationCoordinate2D(latitude: self.aopModels.models[0].latitude, longitude: self.aopModels.models[0].longitude)
        let b = CLLocationCoordinate2D(latitude: self.aopModels.models[2].latitude, longitude: self.aopModels.models[2].longitude)
        
        let bounds = GMSCoordinateBounds(coordinate: a, coordinate: b)
        self.rootView?.mapView?.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 150))
        self.rootView?.mapView?.animate(toZoom: 10)
    }
    
    private func loadData() {
        Parser.readJSONFromFile(fileName: "AOPStations", model: self.aopModels)
    }
    
    // MARK: -
    // MARK: - <GMSMapViewDelegate>

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let aopMarker = marker as? MapAOPMarker {
           
            let controller = DetailedInfoViewController(model: aopMarker.aopModel)
            self.present(controller, animated: true)
        }
        
        return false
    }
}
