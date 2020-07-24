//
//  Video.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 17.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation

// MARK: - Search
struct SearchData: Codable {
    let kind, etag, nextPageToken, regionCode: String?
    let pageInfo: PageInfo?
    let items: [Item]?
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int?
}
