//
//  TodayDealResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

struct TodayDealResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: TodayDealResult
}

struct TodayDealResult: Codable {
    let todayDealList: [TodayDealList]
}

struct TodayDealList: Codable {
    let productId: Int
    let brand, name: String
    let isDeal, leftTime, price, discountRate: Int
    let ratedAverage, reviewCount, deliveryAmount: Int
}

