//
//  RepositoryAssembly.swift
//  NewsCore
//
//  Created by Adrián Silva on 14/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public final class RepositoryAssembly {
    
    private let webServiceAssembly: WebServiceAssembly
    
    private(set) lazy var repository = Repository(webService: webServiceAssembly.webService)
    
    init(webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
}
