//
//  NewsApiEndpoint.swift
//  NewsCore
//
//  Created by Adrián Silva on 07/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

internal enum RequestType: String {
    case get
}

internal enum NewsApiEndpoint {
    case topHeadlines(country: String, category: String, date: String, pageSize: String, page: String)
    case everything
    case sources
}

internal extension NewsApiEndpoint {
    func request(with baseURL: URL, adding parameters: [String: String]) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var newParameters = self.parameters
        parameters.forEach { newParameters.updateValue($1, forKey: $0) }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }
}

private extension NewsApiEndpoint {
    var method: RequestType {
        return .get
    }
    
    var path: String {
        switch self {
        case .topHeadlines:
            return "/v2/top-headlines"
        case .everything:
            return ""
        case .sources:
            return ""
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .topHeadlines(let country, let category, let date, let pageSize, let page):
            return [
                "country": country,
                "category": category,
                "date": date,
                "pageSize": pageSize,
                "page": page
            ]
        case .everything:
            return [:]
        case .sources:
            return [:]
        }
    }
}

