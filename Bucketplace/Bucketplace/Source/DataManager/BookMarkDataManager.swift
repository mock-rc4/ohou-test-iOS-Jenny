//
//  BookMarkDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import Alamofire

class BookMarkDataManager {
    
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWQiOjUsImlhdCI6MTY0ODE5NjU4MywiZXhwIjoxNjQ5NjY3ODEyfQ.ygg04yayv5JtdEgz88TDMMuVcbuLI3eha6F8cZNmkmc"
    ]
    
    
    func postBookMark(_ feedId: Int,_ delegate: BookMarkCollectionViewCell) {
        
        let url = "\(Constant.BASE_URL)/app/bookmarks/feed"
        
        let body: [String: Any] = [
            "feedId": feedId
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: BookMarkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessBookMark(response)
                } else {
                    switch response.code {
                    case 2001,2002:
                        delegate.failedToRequest("로그인이 필요합니다.")
                    default:
                        delegate.failedToRequest("팔로우에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error.localizedDescription)")
            }
        }
    }
    
    func deleteBookMark(_ feedId: Int,_ delegate: BookMarkCollectionViewCell) {
        
        let url = "\(Constant.BASE_URL)/app/bookmarks/feed"
        
        let body: [String: Any] = [
            "feedId": feedId
        ]
        
        AF.request(url,
                   method: .delete,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: DeleteBookMarkResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessDeleteBookMark(response)
                } else {
                    switch response.code {
                    case 2001,2002:
                        delegate.failedToRequest("로그인이 필요합니다.")
                    default:
                        delegate.failedToRequest("팔로우에 실패하였습니다.")
                    }
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}


