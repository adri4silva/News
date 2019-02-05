//
//  AppDelegate.swift
//  News
//
//  Created by Adrián Silva on 04/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appAssembly.setupRootViewController()
        
        return true
    }
}

