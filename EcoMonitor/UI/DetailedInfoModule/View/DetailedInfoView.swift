//
//  DetailedInfoView.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 17.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

class DetailedInfoView: UIView {

    @IBOutlet var addressLabel: UILabel?
    @IBOutlet var NO2Label: UILabel?
    @IBOutlet var NOLabel: UILabel?
    @IBOutlet var SO2Label: UILabel?
    @IBOutlet var COLabel: UILabel?
    @IBOutlet var NH3Label: UILabel?
    @IBOutlet var H2SLabel: UILabel?
    @IBOutlet var dustLabel: UILabel?
    
    func fill(with model: AOPModel) {
        self.addressLabel?.text = model.adress
        self.NO2Label?.text = model.NO2.description
        self.NOLabel?.text = model.NO.description
        self.SO2Label?.text = model.SO2.description
        self.COLabel?.text = model.CO.description
        self.NH3Label?.text = model.NH3.description
        self.H2SLabel?.text = model.H2S.description
        self.dustLabel?.text = model.dust.description
    }
}
