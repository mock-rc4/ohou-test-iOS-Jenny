//
//  SignInResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

struct SignInResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SignInResult?
}

struct SignInResult: Decodable {
    var userId: CLong
    var jwt: String
}
