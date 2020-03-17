//
//  DetailedInfoViewController.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

class DetailedInfoViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = DetailedInfoView

    // MARK: -
    // MARK: - Properties
    
    private let aopModel: AOPModel

    // MARK: -
    // MARK: - Init and deinit

    init(model: AOPModel) {
        self.aopModel = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
