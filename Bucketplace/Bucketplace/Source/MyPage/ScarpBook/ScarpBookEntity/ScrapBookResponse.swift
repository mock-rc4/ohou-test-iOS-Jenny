//
//  ScrapBookResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

// MARK: 최상단 정보
struct ScrapBookResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ScrapBookResult
}

struct ScrapBookResult: Codable {
    let scrapbookId: Int
    let scrapbookName: String
    let description: String?
    let userId: Int
    let profileImageUrl: String
    let userNickname: String
    let allCount, mediaCount, homewarmingCount, knowhowCount: Int
}

// MARK: 스크랩북 - 모두
struct AllScrapResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [AllScrapResult]
}


struct AllScrapResult: Codable {
    let feedId, isPhoto, isMediaFeed, isHomewarming: Int
    let isKnowhow, videoTime: Int
    let thumbnailUrl: String
    let cursor: Int
}
