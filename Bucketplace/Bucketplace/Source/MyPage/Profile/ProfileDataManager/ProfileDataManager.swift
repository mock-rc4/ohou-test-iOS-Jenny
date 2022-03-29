//
//  ProfileDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import Alamofire

class ProfileDataManager {
    
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjUsImlhdCI6MTY0ODE5NjU4MywiZXhwIjoxNjQ5NjY3ODEyfQ.ygg04yayv5JtdEgz88TDMMuVcbuLI3eha6F8cZNmkmc"
    ]
    
    func getProfile(_ delegate: ProfileViewController) {
        
        let url = "\(Constant.BASE_URL)/app/users/me"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: ProfileResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessProfile(response)
                } else {
                    switch response.code {
                    case 2001, 2002:
                        delegate.failedToProfile ("로그인이 필요합니다.")
                    default: delegate.failedToProfile("연결에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
    
    func getPhotoNum(_ userId: Int, _ delegate: ProfileViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/medias/count/\(userId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: PhotoNumResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessPhotoNum(response)
                } else {
                    delegate.failedToProfile("연결에 실패하였습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
