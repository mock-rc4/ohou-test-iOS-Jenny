//
//  PhotoDetailDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import Alamofire

class PhotoDetailDataManager {
    
    func getPhotoDetail(_ feedId: Int, _ delegate: PhotoDetailViewController) {
        
        let url = "\(Constant.BASE_URL)/app/feeds/media-feeds/\(feedId)"
        
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
        .responseDecodable(of: PhotoDetailResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessPhotoDetail(response)
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
