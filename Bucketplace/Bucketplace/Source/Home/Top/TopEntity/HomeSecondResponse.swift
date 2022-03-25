//
//  HomeSecondResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

struct HomeSecondResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [HomeSecondResult]
}

struct HomeSecondResult: Decodable {
    let feedId: CLong
    let thumbnailUrl: String
    let description, title: String
    let isBookmarked, isHomewarming, isKnowhow: Int
}

