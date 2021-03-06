//
//  KakaoDataManager.swift
//  Bucketplace
//
//  Created by κΉμμΈ on 2022/03/22.
//

import Alamofire

class KakaoDataManager {
    
    func getKakaoLogin(_ accessToken: String) {
        
        print("π₯ \(accessToken)")
        
        let url = "\(Constant.BASE_URL)/app/users/kakao-login"
        
        let header: HTTPHeaders = [
            "Access-Token": (accessToken)
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .responseJSON { response in
            switch response.result {
            case .success(let response):
                print("π₯μ±κ³΅")
                print(response)
            case .failure(let error):
                print("π₯μ€ν¨")
                print(error)
            }
        }
    }
    
}
