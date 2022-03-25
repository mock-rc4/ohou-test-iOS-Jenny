//
//  HomeSecondDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import Alamofire

class HomeSecondDataManager {
    
    func getHomeSecond(_ delegate: TopViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/hots/2"
        
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
        .responseDecodable(of: HomeSecondResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessSecond(response)
                } else {
                    print("here")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}

