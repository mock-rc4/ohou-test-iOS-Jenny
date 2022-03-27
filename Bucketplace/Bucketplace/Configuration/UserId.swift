//
//  UserId.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

class UserId {
    static let shared = UserId()
    
    var userId: Int
    
    private init() {
        userId = 0
    }
}
