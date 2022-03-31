//
//  ScrapBookDataManager.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import Alamofire

class ScrapBookDataManager {
    
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-ACCESS-TOKEN": LoginKey.shared.jwt
    ]
    
    func getScrapBook(_ userId: Int, _ delegate: ProfileViewController) {
        print("✨ \(userId)")
        let url = "\(Constant.BASE_URL)/app/bookmarks/scrapbooks/main/top/\(userId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: ScrapBookResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessScrapBook(response.result)
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
    
    func getAllScrap(_ scrapbookId: Int, _ delegate: AllScrapViewController) {

        let url = "\(Constant.BASE_URL)/app/feeds/scrapped/all/\(scrapbookId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: AllScrapResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessAllScrap(response.result)
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
    
    func getPhotoScrap(_ scrapbookId: Int, _ delegate: PhotoScrapViewController) {

        let url = "\(Constant.BASE_URL)/app/feeds/scrapped/media-feeds/\(scrapbookId)"
        print("⭐️ \(scrapbookId)")
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: PhotoScrapResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessPhotoScrap(response.result)
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
    
    func getHousewarmingScrap(_ scrapbookId: Int, _ delegate: HousewarmingScrapViewController) {

        let url = "\(Constant.BASE_URL)/app/feeds/scrapped/homewarmings/\(scrapbookId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: HousewarmingScrapResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessHousewarmingScrap(response.result)
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
    
    func getKnowhowScrap(_ scrapbookId: Int, _ delegate: KnowhowScrapViewController) {

        let url = "\(Constant.BASE_URL)/app/feeds/scrapped/knowhows/\(scrapbookId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: header)
        .validate()
        .responseDecodable(of: KnowhowScrapResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    delegate.didSuccessKnowhowScrap(response.result)
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
