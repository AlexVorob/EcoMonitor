//
//  AOPModel.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import Foundation
import GoogleMaps

class AOPModel {
    
    var latitude: Double
    var longitude: Double
    var description: String
    var adress: String
    var nitrogenDioxide: Double
    var nitrogenOxide: Double
    var sulfuricAnhydride: Double
    var carbonMonoxide: Double
    var hydrogenSulfide: Double
    var dust: Double
    
    init(decode: JSONAOPModel) {
        self.adress = decode.adress
        self.latitude = decode.latitude
        self.longitude = decode.longitude
        self.description = decode.description
        self.nitrogenDioxide = decode.nitrogenDioxide
        self.nitrogenOxide = decode.nitrogenOxide
        self.sulfuricAnhydride = decode.sulfuricAnhydride
        self.carbonMonoxide = decode.carbonMonoxide
        self.hydrogenSulfide = decode.hydrogenSulfide
        self.dust = decode.dust
    }
    
    init() {
        self.adress = String()
        self.latitude = Double()
        self.longitude = Double()
        self.description = String()
        self.nitrogenDioxide = Double()
        self.nitrogenOxide = Double()
        self.sulfuricAnhydride = Double()
        self.carbonMonoxide = Double()
        self.hydrogenSulfide = Double()
        self.dust = Double()
    }
}

