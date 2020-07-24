//
//  ValidApiKeyRequest.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation

// MARK: - SmallRequest
struct ValidApiKeyRequest: Codable {
    let kind, etag: String?
    let pageInfo: PageInfo?
}

