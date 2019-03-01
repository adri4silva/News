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
    var image: Driver<UIImage> { get }
    var title: Driver<String> { get }
    var author: Driver<String?> { get }
    var date: Driver<String?> { get }
    var content: Driver<String?> { get }
}

protocol ArticleViewModelType {
    var inputs: ArticleViewModelInputs { get }
    var outputs: ArticleViewModelOutputs { get }
}

final class ArticleViewModel {
    var image: Driver<UIImage> = Driver.empty()
    let title: Driver<String>
    let author: Driver<String?>
    let date: Driver<String?>
    let content: Driver<String?>
    
    private lazy var disposeBag = DisposeBag()
    
    init(article: Article) {
        self.title = Driver.just(article.title)
        self.author = Driver.just(article.author)
        self.date = Driver.just(article.publishedAt)
        self.content = Driver.just(article.content)
        self.image = Driver<UIImage>.deferred {
            self.image(for: article.urlToImage)
        }
    }
}

private extension ArticleViewModel {
    func image(for url: String?) -> Driver<UIImage> {
        guard let imageString = url, let imageUrl = URL(string: imageString) else { return Driver.empty() }
        return KingfisherManager.shared.rx.retrieveImage(with: imageUrl).asDriver(onErrorJustReturn: UIImage())
    }
}

extension ArticleViewModel: ArticleViewModelType {
    var inputs: ArticleViewModelInputs { return self }
    var outputs: ArticleViewModelOutputs { return self }
}

extension ArticleViewModel: ArticleViewModelInputs {}
extension ArticleViewModel: ArticleViewModelOutputs {}
