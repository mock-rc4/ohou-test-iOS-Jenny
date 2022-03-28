//
//  PopularResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

struct PopularResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PopularResult
}

struct PopularResult: Codable {
    let popularProductList: [PopularProductList]
}

struct PopularProductList: Codable {
    let productId: Int
    let brand, name: String
    let isDeal, leftTime, price, discountRate: Int
    let ratedAverage: Double
    let reviewCount, deliveryAmount: Int
}
