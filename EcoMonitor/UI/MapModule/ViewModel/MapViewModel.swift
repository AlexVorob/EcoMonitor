//
//  MapViewModel.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 16.06.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

enum MapViewModelEvent {
    
    case selectedMarker(AOPModel)
}

protocol MapViewModelType {
    
    func tapOnMarker(model: AOPModel)
    func fetchData(completion: @escaping Execute)
}

typealias Execute = (AOPModels) -> ()
typealias MapViewModelEventHandler = (MapViewModelEvent) -> ()

final class MapViewModel: MapViewModelType {
   
    // MARK: -
    // MARK: Properties

    private(set) var aopModels = AOPModels()
    private var eventHandler: MapViewModelEventHandler?
    
    // MARK: -
    // MARK: Initialization

    init(eventHandler: @escaping MapViewModelEventHandler) {
        self.eventHandler = eventHandler
    }
    
    // MARK: -
    // MARK: Public
    
    public func fetchData(completion: @escaping Execute) {
        self.loadData()
        completion(self.aopModels)
    }
    
    public func tapOnMarker(model: AOPModel) {
        self.eventHandler?(.selectedMarker(model))
    }
    
    // MARK: -
    // MARK: Private

    private func loadData() {
        Parser.readJSONFromFile(fileName: "AOPStations") { model in
            self.aopModels.models = model
        }
    }
}
