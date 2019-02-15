//
//  TodayAssembly.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public final class TodayAssembly {
    
    private let repositoryAssembly: RepositoryAssembly
    private let detailAssembly: DetailAssembly
    
    public init(repositoryAssembly: RepositoryAssembly, detailAssembly: DetailAssembly) {
        self.repositoryAssembly = repositoryAssembly
        self.detailAssembly = detailAssembly
    }
    
    public func viewController() -> UIViewController {
        return TodayListViewController(viewModel: viewModel(), detailNavigator: detailNavigator())
    }
    
    internal func viewModel() -> TodayListViewModelType {
        return TodayListViewModel(todayRepository: repository())
    }
    
    internal func repository() -> TodayRepositoryProtocol {
        return TodayRepository(repository: repositoryAssembly.repository)
    }
    
    internal func detailNavigator() -> DetailNavigatorProtocol {
        return detailAssembly.detailNavigator
    }
}
