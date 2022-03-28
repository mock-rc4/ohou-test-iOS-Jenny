//
//  RecentResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

struct RecentResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: RecentResult
}

struct RecentResult: Codable {
    let viewProductList: [ViewProductList]
}

struct ViewProductList: Codable {
    let productId: Int
    let brand, name: String
    let isDeal, leftTime, price, discountRate: Int
    let ratedAverage: Double
    let reviewCount, deliveryAmount: Int
}
