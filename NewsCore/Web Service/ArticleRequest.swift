//
//  ArticleRequest.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public class ArticlesRequest: Request {
    public var method: RequestType = .get
    
    public var path: String = "/v2/top-headlines"
    
    public var parameters = [String : String]()
    
    internal init(country: String,
                category: String,
                date: String,
                pageSize: String,
                page: String)
    {
        parameters["country"] = country
        parameters["category"] = category
        parameters["apiKey"] = "e02ce6a6363142d192ce7d9c30446211"
        parameters["pageSize"] = pageSize
        parameters["page"] = page
    }
}
