//
//  DetailNavigator.swift
//  NewsCore
//
//  Created by Adrián Silva on 14/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import UIKit

protocol DetailNavigatorProtocol {
    func navigateToArticle(with viewModel: ArticleViewModel)
}

final class DetailNavigator: DetailNavigatorProtocol {
    
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController, viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func navigateToArticle(with viewModel: ArticleViewModel) {
        let detailViewController = viewControllerProvider.detailViewController(with: viewModel)
        navigationController.present(detailViewController, animated: true, completion: nil)
    }
}
