//
//  ArticlesTests.swift
//  NewsCoreTests
//
//  Created by Adrián Silva on 06/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import XCTest
@testable import NewsCore

class ArticlesTests: XCTestCase {
    
    var nbaArticle: Article!

    override func setUp() {
        let source = Source(id: nil, name: "Blazersedge.com")
        nbaArticle = Article(source: source,
                             author: "Dave Deckard",
                             title: "NBA Trade Deadline 2019 News and Rumors - Blazer's Edge",
                             description: "All your trades and hot rumors on the eve of the NBA Trade Deadline",
                             url: "https://www.blazersedge.com/2019/2/5/18213383/nba-trade-deadline-2019-news-rumors-lakers-pistons",
                             urlToImage: "https://cdn.vox-cdn.com/thumbor/EDPW_KgMBvNuZkDaCy1iHt8iHKk=/0x200:2908x1723/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/13740601/1127672047.jpg.jpg",
                             publishedAt: "2019-02-06T06:17:30Z",
                             content: "The 2019 NBA Trade Deadline hits Thursday. Deals and rumors will fly fast on the day before the big event. This thread will cover all of the preliminary action that doesnt call for its own post. We kick off with the Los Angeles Lakers swinging a deal, but not… [+329 chars]")
    }

    override func tearDown() {
        
    }

    func testArticle_whenDecoding_notNil() throws {
        // Given
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "article", withExtension: "json") else {
            XCTFail("Missing file: article.json")
            return
        }
        
        // When
        let json = try Data(contentsOf: url)
        let article: Article = try JSONDecoder().decode(Article.self, from: json)
        
        // Then
        XCTAssertNotNil(article)
    }
    
    func testArticle_whenDecoding_equalsToNbaArticle() throws {
        // Given
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "article", withExtension: "json") else {
            XCTFail("Missing file: article.json")
            return
        }
        
        // When
        let json = try Data(contentsOf: url)
        let article: Article = try JSONDecoder().decode(Article.self, from: json)
        
        // Then
        XCTAssertEqual(article, nbaArticle)
        XCTAssertEqual(nbaArticle, article)
    }
}
