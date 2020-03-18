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
        self.mapСenteringZooming()
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
        self.aopModels.models.forEach {
            let marker = MapAOPMarker(model: $0)
            marker.map = self.rootView?.mapView
        }
    }
    
    private func mapСenteringZooming() {
        let centr = CLLocationCoordinate2D(latitude: self.aopModels.models[2].latitude, longitude: self.aopModels.models[2].longitude)
        let camera = GMSCameraPosition(target: centr, zoom: 10)
        
        self.rootView?.mapView?.animate(to: camera)
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
