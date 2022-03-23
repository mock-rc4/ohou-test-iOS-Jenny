//
//  CategoryModel.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/23.
//

class CategoryModel {
    
    public var CategoryStorage: [Category] = []
    
    init() {
        CategoryStorage = [Category(img: "c1", category: "가구", detail: "소파, 침대, 의자")]
    }
    
    public var count: Int {
        return CategoryStorage.count
    }
    
    public func itemAt(_ row: Int) -> Category {
        return self.CategoryStorage[row]
    }
}
