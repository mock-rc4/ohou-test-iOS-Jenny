//
//  OrderDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import Alamofire

class OrderDataManager {
    
    func postOrder(_ delegate: OptionSelectViewController) {
        
        let url = "\(Constant.BASE_URL)/app/stores/products/9/order"
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-ACCESS-TOKEN": LoginKey.shared.jwt
        ]
        
        let body: [String: Any] = [
            "optionId": Buy.shared.optionId,
            "productCount": Buy.shared.count,
            "price": Buy.shared.price
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: OrderResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessOrder(response.result)
                } else {
                    delegate.failedToRequest("구매하기에 실패하였습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
