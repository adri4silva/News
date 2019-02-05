//
//  TodayListViewModel.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

protocol TodayListViewModelInputs {

}

protocol TodayListViewModelOutputs {
    var articles: Observable<[TodayCellViewModel]> { get }
}

protocol TodayListViewModelType {
    var inputs: TodayListViewModelInputs { get }
    var outputs: TodayListViewModelOutputs { get }
}

final class TodayListViewModel {

    let articles: Observable<[TodayCellViewModel]>
    
    init(client: NewsClient, request: Request) {
        articles = client.send(request: request).map { headlines -> [TodayCellViewModel] in
            let articles = headlines.articles
            return articles.map {
                TodayCellViewModel(article: $0)
            }
        }
    }
}

extension TodayListViewModel: TodayListViewModelType {
    var inputs: TodayListViewModelInputs { return self }
    var outputs: TodayListViewModelOutputs { return self }
}

extension TodayListViewModel: TodayListViewModelInputs {}
extension TodayListViewModel: TodayListViewModelOutputs {}
