//
//  TabManIndex.swift
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
