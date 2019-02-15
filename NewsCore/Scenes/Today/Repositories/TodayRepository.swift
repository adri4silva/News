//
//  TodayRepository.swift
//  NewsCore
//
//  Created by Adrián Silva on 06/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TodayRepositoryProtocol {
    func todayCellViewModels(country: String,
                             category: String,
                             date: String,
                             pageSize: String,
                             page: String) -> Observable<[ArticleViewModel]>
}

final class TodayRepository: TodayRepositoryProtocol {
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func todayCellViewModels(country: String,
                             category: String,
                             date: String,
                             pageSize: String,
                             page: String) -> Observable<[ArticleViewModel]> {
        
        return repository.topHeadlines(country: country, category: category, date: date, pageSize: pageSize, page: page)
            .map { headlines -> [ArticleViewModel] in
                let articles = headlines.articles
                return articles.map {
                    ArticleViewModel(article: $0)
                }
        }
    }
}
