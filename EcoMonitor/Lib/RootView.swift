//
//  RootView.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 13.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit

protocol RootViewRepresentable {
    
    associatedtype RootView: UIView
}

extension RootViewRepresentable where Self: UIViewController {
    
    var rootView: RootView? {
        
        return self.viewIfLoaded as? RootView
    }
}

//public func cast<Value, Result>(_ value: Value) -> Result? {
//    return value as? Result
//}
