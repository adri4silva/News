//
//  TodayCellViewModel.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import RxSwift
import RxCocoa
import Kingfisher
import RxKingfisher

protocol TodayCellViewModelOutputs {
    var title: BehaviorRelay<String> { get }
    var image: BehaviorRelay<UIImage> { get }
    var author: BehaviorRelay<String?> { get }
}

protocol TodayCellViewModelType {
    var outputs: TodayCellViewModelOutputs { get }
}

final class TodayCellViewModel {
    
    let title: BehaviorRelay<String> = BehaviorRelay(value: "")
    let image: BehaviorRelay<UIImage> = BehaviorRelay(value: UIImage())
    let author: BehaviorRelay<String?> = BehaviorRelay(value: "")
    
    private let disposeBag = DisposeBag()

    init(article: Article) {
        title.accept(article.title)
        author.accept(article.author)
        
        let imageUrl = URL(string: article.urlToImage!)!
        KingfisherManager.shared.rx.retrieveImage(with: imageUrl)
            .asObservable()
            .bind(to: image)
            .disposed(by: disposeBag)
    }
}

extension TodayCellViewModel: TodayCellViewModelType {
    var outputs: TodayCellViewModelOutputs { return self }
}

extension TodayCellViewModel: TodayCellViewModelOutputs {}
