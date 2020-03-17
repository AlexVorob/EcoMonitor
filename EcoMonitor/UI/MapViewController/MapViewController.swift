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

    // MARK: -
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.rootView?.mapView?.delegate = self
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
        
        let marker = MapAOPMarker(model: AOPModel())
        marker.position = CLLocationCoordinate2D(latitude: 48.567022, longitude: 9.715830)
        marker.appearAnimation = .pop
        marker.title = "Bad DitzenbachGermany"
        marker.snippet = "Germany"
        marker.map = self.rootView?.mapView
        
//        private func showParcelsOnMap() {
//            removeParcelsFromMap()
//            parcelsModel.parcels.forEach {
//                let parcelMarker = ParcelMarker(with: $0, positionType: providerModel.direction)
//                parcelMarker.map = mapView
//                parcelsOnMap.append(parcelMarker)
//            }
//        }
//
//        private func removeParcelsFromMap() {
//            parcelsOnMap.forEach { $0.map = nil }
//            parcelsOnMap.removeAll()
//        }
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
