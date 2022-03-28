//
//  TodayDealDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import Alamofire

class TodayDealDataManager {
    
    func getTodayDeal(_ delegate: TodayDealViewController) {
        
        let url = "\(Constant.BASE_URL)/app/stores/today-deals-products"
        
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
        .responseDecodable(of: TodayDealResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessTodayDeal(response)
                } else {
                    delegate.failedToRequest("오늘의딜 불러오는데 실패하였습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
