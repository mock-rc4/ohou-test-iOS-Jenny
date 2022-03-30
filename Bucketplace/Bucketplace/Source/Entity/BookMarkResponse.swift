//
//  BookMarkResponse.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

// MARK: 북마크
struct BookMarkResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: BookMarkResult
}

struct BookMarkResult: Codable {
    let scrapbookId, result: Int
}

// MARK: 북마크 해제
struct DeleteBookMarkResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: DeleteBookMarkResult?
}

struct DeleteBookMarkResult: Codable {
    let feedId, isDeleted: Int
}
