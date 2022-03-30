//
//  ScrapBookResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

// MARK: 스크랩북
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

// MARK: 모두
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

// MARK: 사진
struct PhotoScrapResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [PhotoScrapResult]
}

struct PhotoScrapResult: Codable {
    let feedId, isPhoto, isMediaFeed, videoTime: Int
    let thumbnailUrl: String
    let cursor: Int
}

// MARK: 집들이
struct HousewarmingScrapResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [HousewarmingScrapResult]
}

struct HousewarmingScrapResult: Codable {
    let feedId, isHomewarming: Int
    let thumbnailUrl: String
    let title: String
    let userId: Int
    let profileImageUrl: String
    let userNickname: String
    let isProfessional, cursor: Int
}

// MARK: 노하우
struct KnowhowScrapResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [KnowhowScrapResult]
}

struct KnowhowScrapResult: Codable {
    let feedId, isKnowhow: Int
    let thumbnailUrl: String
    let title, themeName: String
    let cursor: Int
}
