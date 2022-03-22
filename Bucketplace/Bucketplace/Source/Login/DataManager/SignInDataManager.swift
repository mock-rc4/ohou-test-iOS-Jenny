//
//  SignInDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import Alamofire

class SignInDataManager {
    
    func postSignUp(_ info: SignInRequest, delegate: SignInViewController) {
        
        let url = "\(Constant.BASE_URL)/app/users/logIn"
        
        let body: [String: Any] = [
            "email": info.email,
            "password": info.password
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: SignInResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessSignUp()
                } else {
                    switch response.code {
                    case 2016: delegate.failedToRequest(message: "잘못된 이메일 형식입니다.")
                    case 4011, 4012:
                        delegate.failedToRequest(message: "비밀번호가 틀립니다.")
                    default: delegate.failedToRequest(message: "로그인에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
