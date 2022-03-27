//
//  FeedUserResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

struct FeedUserResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FeedUserResult
}

struct FeedUserResult: Codable {
    let userId: Int
    let profileImageUrl: String
    let nickname: String
    let isFollowed: Int
    let uploadedAt: String
}
