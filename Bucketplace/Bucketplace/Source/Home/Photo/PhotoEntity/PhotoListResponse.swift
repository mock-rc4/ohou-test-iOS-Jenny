//
//  PhotoListResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

struct PhotoListResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [PhotoListResult]
}

struct PhotoListResult: Decodable {
    let baseInformation: BaseInformation
    let photos: [Photo]
}

struct BaseInformation: Decodable {
    let feedId, likeCount, scrappedCount, isFollowed: Int
    let userDescription: String?
    let shareCount, commentCount: Int
    let recentCommentUserProfileImageUrl, recentCommentUserNickname, recentCommentContent: String?
    let thumbnailUrl: String
    let description: String
    let videoTime: Int?
    let isBookmarked, cursor, isMediaFeed: Int
}

struct Photo: Decodable {
    let imageUrl: String
}
