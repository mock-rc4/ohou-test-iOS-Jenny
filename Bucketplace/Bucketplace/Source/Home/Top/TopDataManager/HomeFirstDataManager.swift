//
//  HomeFirstDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import Alamofire

class HomeFirstDataManager {
    
    func getHomeFirst(_ delegate: TopViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/hots/1"
        
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
        .responseDecodable(of: HomeFirstResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessFirst(response)
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
