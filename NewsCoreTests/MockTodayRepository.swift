//
//  MockTodayRepository.swift
//  NewsCoreTests
//
//  Created by Adrián Silva on 18/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
@testable import NewsCore
@testable import RxSwift

final class MockTodayRepository: TodayRepositoryProtocol {
    var viewModelsFetched: Bool = false
    
    func todayCellViewModels(country: String, category: String, date: String, pageSize: String, page: String) -> Observable<[ArticleViewModel]> {
        viewModelsFetched = true
        return Observable.empty()
    }
}
