//
//  Error.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 22.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation

// MARK: - Error
struct RequestError: Codable {
    let error: ErrorDescription?
}

// MARK: - ErrorError
struct ErrorDescription: Codable {
    let code: Int?
    let message: String?
}

