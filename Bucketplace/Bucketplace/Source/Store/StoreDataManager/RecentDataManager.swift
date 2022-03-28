//
//  RecentDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import Alamofire

class RecentDataManager {
    
    func getRecnet(_ delegate: StoreHomeViewController) {
        
        let url = "\(Constant.BASE_URL)/app/stores/view-products"
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjcsImlhdCI6MTY0ODExMDQ5NSwiZXhwIjoxNjQ5NTgxNzI0fQ.cWVyvkCPP1LR8sp5X0YBDd8avr7B8OP1rbGm-H9Hj_4"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: RecentResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessRecent(response.result)
                } else {
                    switch response.code {
                    case 2001:
                        delegate.failedToRequest("로그인이 필요합니다.")
                    default:
                        delegate.failedToRequest("최근 본 상품을 불러오는데 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
