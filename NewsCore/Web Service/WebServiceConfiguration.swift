//
//  WebServiceConfiguration.swift
//  NewsCore
//
//  Created by Adrián Silva on 07/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

internal struct WebServiceConfiguration {
    static let standard = WebServiceConfiguration(apiKey: "e02ce6a6363142d192ce7d9c30446211")
    let apiKey: String
    
    var parameters: [String: String] {
        return ["apiKey": apiKey]
    }
}
