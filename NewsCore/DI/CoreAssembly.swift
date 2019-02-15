//
//  CoreAssembly.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public final class CoreAssembly {
    public private(set) lazy var todayAssembly = TodayAssembly(repositoryAssembly: repositoryAssembly, detailAssembly: detailAssembly)
    
    private lazy var repositoryAssembly = RepositoryAssembly(webServiceAssembly: webServiceAssembly)
    
    private lazy var webServiceAssembly = WebServiceAssembly()
    
    private lazy var detailAssembly = DetailAssembly(navigationController: navigationController)
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
