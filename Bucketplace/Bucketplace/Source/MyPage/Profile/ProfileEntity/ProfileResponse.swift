//
//  ProfileResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

struct ProfileResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProfileResult
}

struct ProfileResult: Decodable {
    let id: CLong
    let profileImageUrl: String
    let email, nickname: String
    let description: String?
    let follower, followee, likeFeed, scrapBookFeeds: Int
}

struct PhotoNumResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
