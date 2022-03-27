//
//  PhotoFilterModel.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/26.
//

class PhotoFilterModel {
    
    public var PhotoFilterStorage:[String] = []
    
    init() {
        PhotoFilterStorage = ["ph-filter","f1","f2","f3","f4"]
    }
    
    public var count: Int {
        return PhotoFilterStorage.count
    }
    
    public func itemAt(_ row: Int) -> String {
        return self.PhotoFilterStorage[row]
    }
    
}
