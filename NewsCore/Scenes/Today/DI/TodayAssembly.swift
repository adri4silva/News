//
//  TodayAssembly.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public final class TodayAssembly {
    
    private let webServiceAssembly: WebServiceAssembly
    
    public init(webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
    
    public func viewController() -> UIViewController {
        return TodayListViewController(viewModel: viewModel())
    }
    
    internal func viewModel() -> TodayListViewModelType {
        return TodayListViewModel(client: webServiceAssembly.newsClient(), request: webServiceAssembly.articleRequest())
    }
}
