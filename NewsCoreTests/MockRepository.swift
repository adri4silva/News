//
//  MockRepository.swift
//  NewsCoreTests
//
//  Created by Adrián Silva on 18/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
@testable import NewsCore
@testable import RxSwift

final class MockRepository: RepositoryProtocol {
    var fetchedArticleAtIndex = false
    var fetchedArticleWithIdentifier = false
    var fetchedTopHeadlines = false
    
    func article(at index: Int) -> Observable<Article> {
        fetchedArticleAtIndex = true
        return Observable.empty()
    }
    
    func article(with identifier: String) -> Observable<Article> {
        fetchedArticleWithIdentifier = true
        return Observable.empty()
    }
    
    func topHeadlines(country: String, category: String, date: String, pageSize: String, page: String) -> Observable<TopHeadlines> {
        fetchedTopHeadlines = true
        return Observable.empty()
    }
    
    
}
