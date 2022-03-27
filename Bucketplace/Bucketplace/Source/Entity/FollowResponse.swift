//
//  FollowResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

struct FollowResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FollowResult?
}

struct FollowResult: Codable {
    let userId, isFollowed: Int
}
