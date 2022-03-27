//
//  FeedUserDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import Alamofire

class FeedUserDataManager {
    
    func getFeedUser(_ feedId: Int, _ delegate: PhotoDetailViewController) {
        
        let url = "\(Constant.BASE_URL)/app/users/feeds/\(feedId)"
        
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
        .responseDecodable(of: FeedUserResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessFeedUser(response)
                } else {
                    switch response.code {
                    case 2001, 2002:
                        delegate.failedToRequestFeedUser("로그인이 필요합니다.")
                    default: delegate.failedToRequestFeedUser("연결에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
