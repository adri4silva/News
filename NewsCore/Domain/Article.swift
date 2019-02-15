//
//  Article.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public struct Article: Codable {
    let identifier: String = UUID().uuidString.lowercased()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

extension Article: Equatable {
    public static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.source == rhs.source && lhs.author == rhs.author && lhs.title == rhs.title && lhs.description == rhs.description && lhs.url == rhs.url
    }
}
