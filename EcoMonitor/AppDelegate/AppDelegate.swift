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
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyAVUXSoO8NDEI3F5pH_LNV-AlipTcks1Rg")
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        self.appCoordinator = AppCoordinator(navigationController)
        self.appCoordinator?.start()
        
        return true
    }
}

