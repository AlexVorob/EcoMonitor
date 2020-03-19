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
    var adress: String
    var NO2: Double
    var NO: Double
    var SO2: Double
    var CO: Double
    var NH3: Double
    var H2S: Double
    var dust: Double
    
    init(decode: JSONAOPModel) {
        self.adress = decode.adress
        self.latitude = decode.latitude
        self.longitude = decode.longitude
        self.NO2 = decode.nitrogenDioxide
        self.NO = decode.nitrogenOxide
        self.SO2 = decode.sulfuricAnhydride
        self.CO = decode.carbonMonoxide
        self.NH3 = decode.ammonia
        self.H2S = decode.hydrogenSulfide
        self.dust = decode.dust
    }
    
    init() {
        self.adress = String()
        self.latitude = Double()
        self.longitude = Double()
        self.NO2 = Double()
        self.NO = Double()
        self.SO2 = Double()
        self.CO = Double()
        self.NH3 = Double()
        self.H2S = Double()
        self.dust = Double()
    }
}

