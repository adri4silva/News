//
//  DetailViewModel.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa
import RxKingfisher

protocol ArticleViewModelInputs {

}

protocol ArticleViewModelOutputs {
    var image: BehaviorRelay<UIImage> { get }
    var title: Observable<String> { get }
    var author: Observable<String?> { get }
    var date: Observable<String?> { get }
    var content: Observable<String?> { get }
}

protocol ArticleViewModelType {
    var inputs: ArticleViewModelInputs { get }
    var outputs: ArticleViewModelOutputs { get }
}

final class ArticleViewModel {
    let image: BehaviorRelay<UIImage> = BehaviorRelay(value: UIImage())
    let title: Observable<String>
    let author: Observable<String?>
    let date: Observable<String?>
    let content: Observable<String?>
    
    private lazy var disposeBag = DisposeBag()
    
    init(article: Article) {
        self.title = Observable.just(article.title)
        self.author = Observable.just(article.author)
        self.date = Observable.just(article.publishedAt)
        self.content = Observable.just(article.content)
        
        image(for: article.urlToImage)
            .bind(to: image)
            .disposed(by: disposeBag)
    }
}

private extension ArticleViewModel {
    func image(for url: String?) -> Observable<UIImage> {
        guard let imageString = url, let imageUrl = URL(string: imageString) else { return Observable.empty() }
        return KingfisherManager.shared.rx.retrieveImage(with: imageUrl).asObservable()
    }
}

extension ArticleViewModel: ArticleViewModelType {
    var inputs: ArticleViewModelInputs { return self }
    var outputs: ArticleViewModelOutputs { return self }
}

extension ArticleViewModel: ArticleViewModelInputs {}
extension ArticleViewModel: ArticleViewModelOutputs {}
