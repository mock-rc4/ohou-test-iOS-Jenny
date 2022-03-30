//
//  OrderResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

struct OrderResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: OrderResult
}

struct OrderResult: Codable {
    let orderId: Int
}

