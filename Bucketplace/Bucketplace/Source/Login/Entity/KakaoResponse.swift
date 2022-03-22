//
//  KakaoResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import Foundation

struct KakaoResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Results?
}

struct Results: Decodable {
    var userId: CLong
    var jwt: String
}
