//
//  PopularDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import Alamofire

class PopularDataManager {
    
    func getPopular(_ delegate: StoreHomeViewController) {
        
        let url = "\(Constant.BASE_URL)/app/stores/popular-products"
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-ACCESS-TOKEN": LoginKey.shared.jwt
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: PopularResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessPopular(response.result)
                } else {
                    delegate.failedToRequestPopular("인기 상품을 불러오는데 실패하였습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
