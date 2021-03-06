//
//  AppDelegate.swift
//  EcoMonitor
//
//  Created by Alex Vorobiev on 13.03.2020.
//  Copyright © 2020 EcoMonitor. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        window.rootViewController = MapViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        GMSServices.provideAPIKey("AIzaSyAVUXSoO8NDEI3F5pH_LNV-AlipTcks1Rg")

        return true
    }
}

