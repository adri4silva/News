//
//  AppAssembly.swift
//  News
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
import NewsCore

final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private lazy var rootViewController = UINavigationController()
    private lazy var coreAssembly = CoreAssembly(navigationController: rootViewController)
    
    func setupRootViewController() {
        let todayViewController = coreAssembly.todayAssembly.viewController()
        rootViewController.pushViewController(todayViewController, animated: false)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
