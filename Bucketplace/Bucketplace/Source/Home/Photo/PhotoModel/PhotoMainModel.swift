//
//  PhotoMainModel.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/26.
//

class PhotoMainModel {
    
    public var PhotoMainStorage:[String] = []
    
    init() {
        PhotoMainStorage = ["ph-1", "ph-2", "ph-3", "ph-4", "ph-5", "ph-6"]
    }
    
    public var count: Int {
        return PhotoMainStorage.count
    }
    
    public func itemAt(_ row: Int) -> String {
        return self.PhotoMainStorage[row]
    }
    
}
