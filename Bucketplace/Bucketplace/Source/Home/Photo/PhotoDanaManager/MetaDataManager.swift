//
//  MetaDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import Alamofire

class MetaDataManager {
    
    func getMeta(_ feedId: Int, _ delegate: PhotoDetailViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/media-feeds/\(feedId)/meta"
        
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
        .responseDecodable(of: MetaResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessMeta(response.result)
                } else {
                    switch response.code {
                    case 2001, 2002:
                        delegate.failedToRequestMeta("로그인이 필요합니다.")
                    case 2100, 3100, 3200:
                        delegate.failedToRequestMeta("피드 연결에 오류가 있습니다.")
                    default: delegate.failedToRequestMeta("연결에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
