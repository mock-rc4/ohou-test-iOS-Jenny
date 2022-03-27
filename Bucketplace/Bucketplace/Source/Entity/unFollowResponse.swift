//
//  unFollowResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

struct unFollowResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: unFollowResult?
}

struct unFollowResult: Codable {
    let userId, isDeleted: Int
}
