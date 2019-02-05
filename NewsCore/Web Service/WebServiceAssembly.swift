//
//  WebServiceAssembly.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public final class WebServiceAssembly {
    
    public func articleRequest(country: String = "us",
                               category: String = "",
                               date: String = "",
                               pageSize: String = "5",
                               page: String = "1") -> Request {
        
        return ArticlesRequest(country: country,
                               category: category,
                               date: date,
                               pageSize: pageSize,
                               page: page)
    }
    
    public func newsClient() -> NewsClient {
        return NewsClient()
    }
}
