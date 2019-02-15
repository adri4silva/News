//
//  Repository.swift
//  NewsCore
//
//  Created by Adrián Silva on 07/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum ArticleError: Error {
    case invalidIdentifier
    case invalidIndex
}

protocol RepositoryProtocol {
    func article(at index: Int) -> Observable<Article>
    func article(with identifier: String) -> Observable<Article>
    func topHeadlines(country: String,
                      category: String,
                      date: String,
                      pageSize: String,
                      page: String) -> Observable<TopHeadlines>
}

final internal class Repository: RepositoryProtocol {
    private lazy var articles: [String: Article] = [:]
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func article(with identifier: String) -> Observable<Article> {
        return Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            if let article = self.articles[identifier] {
                observer.onNext(article)
                observer.onCompleted()
            } else {
                observer.onError(ArticleError.invalidIdentifier)
            }
            
            return Disposables.create()
        }
    }
    
    func article(at index: Int) -> Observable<Article> {
        return Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            guard !self.articles.isEmpty else {
                observer.onError(ArticleError.invalidIdentifier)
                return Disposables.create()
            }
            let article = self.articles.map { $0.1 }[index]
            observer.onNext(article)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func topHeadlines(country: String, category: String, date: String, pageSize: String, page: String) -> Observable<TopHeadlines> {
        
        let topHeadlines = webService
            .load(TopHeadlines.self, from: .topHeadlines(country: country, category: category, date: date, pageSize: pageSize, page: page))
        
        return topHeadlines.map { headlines -> TopHeadlines in
            headlines.articles.forEach { article in
                self.articles.updateValue(article, forKey: article.identifier)
            }
            return headlines
        }
    }
}
