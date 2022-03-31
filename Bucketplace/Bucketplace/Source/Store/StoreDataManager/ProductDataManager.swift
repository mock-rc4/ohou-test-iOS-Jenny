//
//  ProductDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import Alamofire

class ProductDataManager {
    
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-ACCESS-TOKEN": LoginKey.shared.jwt
    ]
    
    func getProduct(_ productId: Int, _ delegate: ProductDetailViewController) {
        
        let url = "\(Constant.BASE_URL)/app/stores/products/\(productId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: ProductResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessProduct(response.result)
                } else {
                    delegate.failedToRequestProduct("인기 상품을 불러오는데 실패하였습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
    func getOption(_ productId: Int, _ delegate: OptionViewController) {
        
        let url = "\(Constant.BASE_URL)/app/stores/products/\(productId)/options"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: OptionResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessOption(response.result)
                } else {
                    delegate.failedToRequest("옵션을 불러오는데 실패했습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
    
}
