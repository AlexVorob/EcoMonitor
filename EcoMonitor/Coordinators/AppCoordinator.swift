//
//  AppCoordinator.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.06.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    // MARK: -
    // MARK: Properties

    private let navigationController: UINavigationController
    
    // MARK: -
    // MARK: Initialization
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: -
    // MARK: Public

    public func start() {
        let event: MapViewModelEventHandler = { [weak self] event in
            switch event {
            case .selectedMarker(let model):
                self?.openDetailedInfoViewController(model: model)
            }
        }
        
        let viewModel = MapViewModel(eventHandler: event)
        let mapViewController = MapViewController(viewModel: viewModel)
        
        self.navigationController.viewControllers = [mapViewController]
    }
    
    // MARK: -
    // MARK: Private

    private func openDetailedInfoViewController(model: AOPModel) {
        let event: DetailedInfoViewModelEventHandler = { [weak self] event in
            switch event {
            case .close:
                self?.navigationController.dismiss(animated: true)
            }
        }
        
        let viewModel = DetailedInfoViewModel(aopModel: model, eventHandler: event)
        let detailedInfoVC = DetailedInfoViewController(viewModel: viewModel)
        self.navigationController.present(detailedInfoVC, animated: true)
    }

}
