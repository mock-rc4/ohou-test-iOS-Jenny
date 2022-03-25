//
//  KakaoDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import Alamofire

class KakaoDataManager {
    
    func getKakaoLogin(_ accessToken: String) {
        
        print("🔥 \(accessToken)")
        
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
                print("🔥성공")
                print(response)
            case .failure(let error):
                print("🔥실패")
                print(error)
            }
        }
    }
    
}
