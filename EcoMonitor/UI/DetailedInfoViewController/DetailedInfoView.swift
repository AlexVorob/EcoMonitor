//
//  DetailedInfoView.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

class DetailedInfoView: UIView {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var nitrogenDioxideLabel: UILabel?
    @IBOutlet var addressLabel: UILabel?
    
    
    func fill(with model: AOPModel) {
        self.addressLabel?.text = model.adress
        self.titleLabel?.text = model.description
        self.nitrogenDioxideLabel?.text = model.nitrogenDioxide.description
    }
}
