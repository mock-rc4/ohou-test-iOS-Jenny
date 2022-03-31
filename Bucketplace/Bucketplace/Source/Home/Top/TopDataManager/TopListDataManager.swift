//
//  TopListDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import Alamofire

class TopListDataManager {
    
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-ACCESS-TOKEN": LoginKey.shared.jwt
    ]
    
    
    func getVideo(_ delegate: TopViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/hots/video"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: TopVideoResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessTopVideo(response.result)
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
    
    func getPhoto(_ delegate: TopViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/hots/photo"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: TopPhotoResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessTopPhoto(response.result)
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
