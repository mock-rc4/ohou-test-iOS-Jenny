//
//  ProductResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

// MARK: 상품 디테일
struct ProductResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProductResult
}

struct ProductResult: Codable {
    let detailProductInfoResList: DetailProductInfoResList
}

struct DetailProductInfoResList: Codable {
    let productId: Int
    let category, imgUrl, brand, name: String
    let reviewCount, isDeal, leftTime, price: Int
    let discountRate, point, deliveryAmount: Int
    let description: String
    let ratedAverage: Int
    let ratedCountList: RatedCountList
    let questionCount: Int
}

struct RatedCountList: Codable {
    let fiveScoreCount, fourScoreCount, threeScoreCount, twoScoreCount: Int
    let oneScoreCount: Int
}

// MARK: 상품 옵션
struct OptionResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: OptionResult
}

struct OptionResult: Codable {
    let colorOptions: [ColorOption]
}

struct ColorOption: Codable {
    let optionId: Int
    let color: String
}
