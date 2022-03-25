//
//  HomeFirstResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

struct HomeFirstResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [HomeFirstResult]
}

struct HomeFirstResult: Decodable {
    let feedID: CLong?  // 추후보완
    let thumbnailUrl: String
    let description, title: String
    let isBookmarked, isHomewarming, isKnowhow: Int
}
