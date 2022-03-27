//
//  PhotoDetailResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

struct PhotoDetailResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PhotoDetailResult
}

struct PhotoDetailResult: Codable {
    let feedId: Int
    let medias: [MediaElement]
}

struct MediaElement: Codable {
    let media: MediaMedia
    let keywords: [Keyword]
}

struct Keyword: Codable {
    let id: Int
    let name: String
    let referredCount: Int
    let createdAt, updatedAt: String
}

struct MediaMedia: Codable {
    let id, feedId: Int
    let thumbnailUrl: String
    let time: Int
    let description: String
    let url: String
    let mediaSpaceTypeId, isPhoto, isVideo: Int
    let createdAt, updatedAt: String
    let isBookmarked: Int
}
