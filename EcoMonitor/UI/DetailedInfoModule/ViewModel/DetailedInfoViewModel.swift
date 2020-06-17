//
//  DetailedInfoViewModel.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.06.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import Foundation

enum DetailedInfoViewModelEvent {
    
    case close
}

protocol DetailedInfoViewModelType {
    
    var updateView: ((ViewData) -> ())? { get set }
    func close()
}

typealias DetailedInfoViewModelEventHandler = (DetailedInfoViewModelEvent) -> ()

class DetailedInfoViewModel: DetailedInfoViewModelType {
    
    // MARK: -
    // MARK: Properties

    public var updateView: ((ViewData) -> ())?
    private let aopModel: AOPModel
    private var eventHandler: DetailedInfoViewModelEventHandler?
    
    // MARK: -
    // MARK: Initialization

    init(aopModel: AOPModel, eventHandler: @escaping DetailedInfoViewModelEventHandler) {
        self.eventHandler = eventHandler
        self.aopModel = aopModel
      
        print("X  .model")
        self.updateView?(.model(aopModel))
    }
    
    func close() {
        self.eventHandler?(.close)
    }
}
