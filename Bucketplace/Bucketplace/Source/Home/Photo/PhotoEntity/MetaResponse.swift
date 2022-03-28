//
//  MetaResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

struct MetaResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MetaResult
}

struct MetaResult: Codable {
    let feedId: Int
    let acreage, home, style: String?
}
