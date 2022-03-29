//
//  HousewarmingDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import Alamofire

class HousewarmingDataManager {
    
    func getHousewarming(_ delegate: HousewarmingViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/homewarmings/"
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjUsImlhdCI6MTY0ODE5NjU4MywiZXhwIjoxNjQ5NjY3ODEyfQ.ygg04yayv5JtdEgz88TDMMuVcbuLI3eha6F8cZNmkmc"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: HousewarmingResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessHousewarming(response.result)
                } else {
                    switch response.code {
                    case 2001, 2002:
                        delegate.failedToRequest("로그인이 필요합니다.")
                    default: delegate.failedToRequest("연결에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}