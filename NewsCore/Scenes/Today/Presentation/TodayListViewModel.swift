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
    var articles: Driver<[ArticleViewModel]> { get }
    var isLoading: Observable<Bool> { get }
}

protocol TodayListViewModelType {
    var inputs: TodayListViewModelInputs { get }
    var outputs: TodayListViewModelOutputs { get }
}

final class TodayListViewModel {

    let articles: Driver<[ArticleViewModel]>
    let isLoading: Observable<Bool>
    
    init(todayRepository: TodayRepositoryProtocol) {
        self.articles = todayRepository.todayCellViewModels(country: "us",
                                                            category: "",
                                                            date: "",
                                                            pageSize: "10",
                                                            page: "1").asDriver(onErrorJustReturn: [])
        self.isLoading = articles.asObservable().map { $0.isEmpty }
    }
}

extension TodayListViewModel: TodayListViewModelType {
    var inputs: TodayListViewModelInputs { return self }
    var outputs: TodayListViewModelOutputs { return self }
}

extension TodayListViewModel: TodayListViewModelInputs {}
extension TodayListViewModel: TodayListViewModelOutputs {}
