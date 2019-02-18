//
//  TodayListViewModelTests.swift
//  NewsCoreTests
//
//  Created by Adrián Silva on 18/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import XCTest
@testable import NewsCore
@testable import RxBlocking

class TodayListViewModelTests: XCTestCase {
    
    var viewModel: TodayListViewModelType!
    var mockTodayRepository: MockTodayRepository!
    var mockRepository: MockRepository!
    var todayRepository: TodayRepositoryProtocol!
    var repository: RepositoryProtocol!

    override func setUp() {
        mockTodayRepository = MockTodayRepository()
        mockRepository = MockRepository()
        repository = Repository(webService: WebService(configuration: .standard))
    }

    func testTodayViewModel_behaviourTodayRepository() {
        viewModel = TodayListViewModel(todayRepository: mockTodayRepository)

        XCTAssert(mockTodayRepository.viewModelsFetched)
    }
    
    func testTodayViewModel_behaviourRepository() {
        todayRepository = TodayRepository(repository: mockRepository)
        viewModel = TodayListViewModel(todayRepository: todayRepository)

        XCTAssert(mockRepository.fetchedTopHeadlines)
    }
    
    func testTodayViewModel_fetchTenArticles() throws {
        todayRepository = TodayRepository(repository: repository)
        viewModel = TodayListViewModel(todayRepository: todayRepository)
        
        XCTAssertEqual(try viewModel.outputs.articles.toBlocking().first()?.count, 10)
    }
}
