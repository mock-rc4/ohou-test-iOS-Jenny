//
//  FeedId.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

class FeedId {
    static let shared = FeedId()
    
    var feedId: Int
    
    private init() {
        feedId = 0
    }
}

class UserId {
    static let shared = UserId()
    
    var userId: Int
    
    private init() {
        userId = 0
    }
}

class ProductId {
    static let shared = ProductId()
    
    var productId: Int
    
    private init() {
        productId = 0
    }
}
