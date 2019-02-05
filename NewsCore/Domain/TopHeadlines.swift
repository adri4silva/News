//
//  TopHeadlines.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public struct TopHeadlines: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
