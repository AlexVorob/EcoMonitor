//
//  JSONAOPModel.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 18.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import Foundation

struct JSONAOPModel: Decodable {
    
    let latitude: Double
    let longitude: Double
    let adress: String
    let nitrogenDioxide: Double
    let nitrogenOxide: Double
    let sulfuricAnhydride: Double
    let carbonMonoxide: Double
    let ammonia: Double
    let hydrogenSulfide: Double
    let dust: Double
}
