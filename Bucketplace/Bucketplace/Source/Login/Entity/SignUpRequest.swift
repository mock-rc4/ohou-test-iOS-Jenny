//
//  SignUpRequest.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

struct SignUpRequest: Encodable {
    var email: String
    var password: String
    var nickname: String
}
