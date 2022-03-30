//
//  Index.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/24.
//

class TabManIndex {
    static let shared = TabManIndex()
    
    // tabman 옮기기 위함
    var index: Int
    
    private init() {
        index = 0
    }
}

class ScrapIndex {
    static let shared = ScrapIndex()
    
    var index: [Int]
    
    private init() {
        index = [0,0,0,0]
    }
    
}

class ScrapBook {
    static var shared = ScrapBook()
    
    var info: ScrapBookResult
    
    private init() {
        info = ScrapBookResult(scrapbookId: 0, scrapbookName: "", description: "", userId: 0, profileImageUrl: "", userNickname: "", allCount: 0, mediaCount: 0, homewarmingCount: 0, knowhowCount: 0)
    }
    
}
