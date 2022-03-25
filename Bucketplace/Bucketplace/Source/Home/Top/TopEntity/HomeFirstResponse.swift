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
    let feedId: CLong
    let thumbnailUrl: String
    let description, title: String
    let isBookmarked, isHomewarming, isKnowhow: Int
}
