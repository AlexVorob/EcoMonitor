//
//  MapAOPMarker.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import Foundation
import GoogleMaps

class MapAOPMarker: GMSMarker {
    
    var aopModel = AOPModel()
    
    init(model: AOPModel) {
        super.init()
        
        self.aopModel = model
        self.position = CLLocationCoordinate2D(latitude: model.latitude, longitude: model.longitude)
    }
}
