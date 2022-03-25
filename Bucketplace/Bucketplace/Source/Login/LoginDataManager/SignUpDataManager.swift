//
//  SignUpDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import Alamofire

class SignUpDataManager {
    
    func postSignUp(_ info: SignUpRequest, delegate: SignUpViewController) {
        
        let url = "\(Constant.BASE_URL)/app/users"
        
        let body: [String: Any] = [
            "email": info.email,
            "password": info.password,
            "nickname": info.nickname,
            "provider": "local"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: SignUpResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessSignUp()
                } else {
                    switch response.code {
                    case 2016: delegate.failedToRequest(message: "잘못된 이메일 형식입니다.")
                    case 2017: delegate.failedToRequest(message: "중복된 이메일이 존재합니다.")
                    case 2018: delegate.failedToRequest(message: "중복된 닉네임이 존재합니다.")
                    default: delegate.failedToRequest(message: "회원가입에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
