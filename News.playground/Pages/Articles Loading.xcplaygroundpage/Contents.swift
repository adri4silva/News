@testable import NewsCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//public func articleRequest(country: String = "us",
//                           category: String = "",
//                           date: String = "",
//                           pageSize: String = "5",
//                           page: String = "1") -> Request {
//
//    return ArticlesRequest(country: country,
//                           category: category,
//                           date: date,
//                           pageSize: pageSize,
//                           page: page)
//}
//
//let request = articleRequest()
//let client = NewsClient()
//
//client.send(request: request).subscribe(onNext: { print($0.articles) })
