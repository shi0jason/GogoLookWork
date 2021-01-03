//
//  TopObject.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/1.
//  Copyright © 2021 Jason. All rights reserved.
//

struct TopObject: Codable {

    let id: Int
    let rank: Int?
    let title: String?
    let url: String?
    let imageUrl: String?
    let type: String?
    let episodes: Int?
    let startDate: String?
    let endDate: String?
    let members: Int?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case rank
        case title
        case url
        case imageUrl = "image_url"
        case type
        case episodes
        case startDate = "start_date"
        case endDate = "end_date"
        case members
        case score
    }
}

extension TopObject: Equatable {}
