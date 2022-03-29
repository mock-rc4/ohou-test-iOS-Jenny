//
//  HousewarmingResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

struct HousewarmingResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: HousewarmingResult
}

struct HousewarmingResult: Codable {
    let feedCount: Int
    let homewarmingFeeds: [HomewarmingFeed]
}

struct HomewarmingFeed: Codable {
    let feedId: Int
    let thumbnailUrl: String
    let isBookmarked: Int
    let description: String
    let profileImageUrl: String
    let nickname: String
    let scrappedCount, viewCount, cursor: Int
}
