//
//  KnowHowResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

struct KnowHowResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: KnowHowResult
}

struct KnowHowResult: Codable {
    let feedCount: Int
    let knowhowFeeds: [KnowhowFeed]
}

struct KnowhowFeed: Codable {
    let isNew, feedId: Int
    let thumbnailUrl: String
    let description: String
    let profileImageUrl: String
    let nickname: String
    let viewCount, scrappedCount, cursor, isBookmarked: Int
}
