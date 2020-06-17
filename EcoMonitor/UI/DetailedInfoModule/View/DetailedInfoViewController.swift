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
    
    private var viewModel: DetailedInfoViewModelType
    
    // MARK: -
    // MARK: - Init and deinit

    init(viewModel: DetailedInfoViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateView()
    }
    
    // MARK: -
    // MARK: Private
    
    private func updateView() {
        self.viewModel.updateView = { [weak self] viewData in
            self?.rootView?.viewData = viewData
        }
    }
    
    // MARK: -
    // MARK: - @IBActions

    @IBAction func closeButttonTapped(_ sender: UIButton) {
        self.viewModel.close()
    }
}
