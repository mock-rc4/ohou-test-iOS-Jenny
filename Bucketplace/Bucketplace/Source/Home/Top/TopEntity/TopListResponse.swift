//
//  TopList.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

// MARK: 인기 동영상
struct TopVideoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [TopVideoResult]
}

struct TopVideoResult: Codable {
    let rowNum, feedId: Int
    let thumbnailUrl: String
    let nickname: String
    let isBookmarked: Int
}

// MARK: 인기 사진
struct TopPhotoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [TopPhotoResult]
}

struct TopPhotoResult: Codable {
    let rowNum, feedId: Int
    let thumbnailUrl: String
    let nickname: String
    let isBookmarked: Int
}
