//
//  SignUpResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

struct SignUpResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Users?
}

struct Users: Decodable {
    var userId: CLong
}
