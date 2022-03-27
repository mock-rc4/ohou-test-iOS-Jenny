//
//  FollowDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import Alamofire

class FollowDataManager {
    
    func postFollow(_ info: FollowRequest,_ delegate: FollowViewController) {
        
        let url = "\(Constant.BASE_URL)/app/follows/users"
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjUsImlhdCI6MTY0ODE5NjU4MywiZXhwIjoxNjQ5NjY3ODEyfQ.ygg04yayv5JtdEgz88TDMMuVcbuLI3eha6F8cZNmkmc"
        ]
        
        let body: [String: Any] = [
            "userId": info.userId
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: FollowResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessFollow(response)
                } else {
                    switch response.code {
                    case 3010: delegate.failedToRequestFollow("유저가 존재하지 않습니다.")
                    case 3310: delegate.failedToRequestFollow("이미 팔로우한 관계입니다")
                    default: delegate.failedToRequestFollow("팔로우에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
    
    func unFollow(_ info: FollowRequest,_ delegate: FollowViewController) {
        
        let url = "\(Constant.BASE_URL)/app/follows/users"
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjUsImlhdCI6MTY0ODE5NjU4MywiZXhwIjoxNjQ5NjY3ODEyfQ.ygg04yayv5JtdEgz88TDMMuVcbuLI3eha6F8cZNmkmc"
        ]
        
        let body: [String: Any] = [
            "userId": info.userId
        ]
        
        AF.request(url,
                   method: .delete,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: unFollowResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessUnFollow(response)
                } else {
                    switch response.code {
                    case 3010: delegate.failedToRequestFollow("유저가 존재하지 않습니다.")
                    case 3310: delegate.failedToRequestFollow("팔로우되지 않은 관계입니다")
                    default: delegate.failedToRequestFollow("팔로우에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}

