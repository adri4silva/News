//
//  NewsClient.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation
import RxSwift

internal final class WebService {
    private let session = URLSession(configuration: .default)
    private let baseUrl = URL(string: "https://newsapi.org")!
    private let decoder = JSONDecoder()
    private let configuration: WebServiceConfiguration
    
    init(configuration: WebServiceConfiguration) {
        self.configuration = configuration
    }
    
    func load<T: Decodable>(_ type: T.Type, from endpoint: NewsApiEndpoint) -> Observable<T> {
        let decoder = self.decoder
        let request = endpoint.request(with: baseUrl, adding: configuration.parameters)
        
        return session.rx.data(request: request)
            .map { try decoder.decode(T.self, from: $0) }
    }
}

private extension Reactive where Base: URLSession {
    func send(request: URLRequest) -> Observable<Data> {
        return Observable<Data>.create { observer in
            let task = self.base.dataTask(with: request) { data, response, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        fatalError("Unsupported protocol")
                    }
                    
                    if 200 ..< 300 ~= httpResponse.statusCode {
                        if let data = data {
                            observer.onNext(data)
                        }
                        observer.onCompleted()
                    }
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }

}
