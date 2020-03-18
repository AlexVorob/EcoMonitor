//
//  JsonParser.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 18.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import Foundation

protocol JsonParsable {
   static func readJSONFromFile(fileName: String, model: AOPModels)
}

class Parser: JsonParsable {
    
    static func readJSONFromFile(fileName: String, model: AOPModels) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard let decode = try? JSONDecoder().decode([JSONAOPModel].self, from: data) else { return }
            model.models = decode.compactMap { AOPModel(decode: $0) }
        }
    }
}