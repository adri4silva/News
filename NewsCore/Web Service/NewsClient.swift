//
//  NewsClient.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
import RxSwift

public final class NewsClient {
    private let apiUrl: URL = URL(string: "https://newsapi.org")!
    
    public func send(request apiRequest: Request) -> Observable<TopHeadlines> {
        return Observable<TopHeadlines>.create { observer in
            let request = apiRequest.request(with: self.apiUrl)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else { return }
                do {
                    let model = try JSONDecoder().decode(TopHeadlines.self, from: data)
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
