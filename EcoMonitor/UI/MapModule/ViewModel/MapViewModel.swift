//
//  MapViewModel.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 16.06.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

protocol MapViewModelType {
    
    func tapOnMarker(model: AOPModel)
    func fetchData(completion: @escaping () -> ())
}

final class MapViewModel: MapViewModelType {
   
    var aopModels = AOPModels()
    
    public func fetchData(completion: @escaping () -> ()) {
        self.loadData()
        completion()
    }
    
    public func tapOnMarker(model: AOPModel) {
        // открываем детали
        let detailedInfoVC = DetailedInfoViewController(model: model)
        self.present(detailedInfoVC, animated: true)
    }
    
    private func loadData() {
        Parser.readJSONFromFile(fileName: "AOPStations") { model in
            self.aopModels.models = model
        }
    }
}
