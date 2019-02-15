//
//  DetailAssembly.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public final class DetailAssembly {
    
    private let navigationController: UINavigationController
    
    private(set) lazy var detailNavigator = DetailNavigator(navigationController: navigationController, viewControllerProvider: self)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension DetailAssembly: DetailViewControllerProvider {
    func detailViewController(with viewModel: ArticleViewModel) -> UIViewController {
        return DetailViewController(viewModel: viewModel)
    }
}
