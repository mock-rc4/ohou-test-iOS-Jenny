//
//  ProHousewarmingResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

struct ProResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProResult
}

struct ProResult: Codable {
    let feedCount: Int
    let homewarmingFeeds: [ProHomewarmingFeed]
}

struct ProHomewarmingFeed: Codable {
    let feedId: Int
    let thumbnailUrl: String
    let isBookmarked: Int
    let description: String
    let profileImageUrl: String
    let nickname: String
    let scrappedCount, viewCount, cursor: Int
}
