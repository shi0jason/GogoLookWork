//
//  ResponseBody.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/1.
//  Copyright © 2021 Jason. All rights reserved.
//

struct ResponseBody: Codable {
    let requestHash: String?
    let requestCached: Bool?
    let requestCacheExpiry: Int?
    let top: [TopObject]?
    
    enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case top
    }
}
