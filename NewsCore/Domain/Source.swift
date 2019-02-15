//
//  Source.swift
//  NewsCore
//
//  Created by Adrián Silva on 05/02/2019.
//  Copyright © 2019 Adrián Silva. All rights reserved.
//

import Foundation

public struct Source: Codable {
    let id: String?
    let name: String
}

extension Source: Equatable {}
