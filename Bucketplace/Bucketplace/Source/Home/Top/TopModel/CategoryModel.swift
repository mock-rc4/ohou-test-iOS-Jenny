//
//  CategoryModel.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/23.
//

class CategoryModel {
    
    public var CategoryStorage: [Category] = []
    
    init() {
        CategoryStorage = [Category(img: "c1", category: "가구"), Category(img: "c2", category: "패브릭"), Category(img: "c3", category: "조명"), Category(img: "c4", category: "가전"), Category(img: "c5", category: "주방용품"), Category(img: "c6", category: "데코/식물"), Category(img: "c7", category: "수납/정리"), Category(img: "c8", category: "생활용품"), Category(img: "c9", category: "서랍/수납장"), Category(img: "c10", category: "생필품"), Category(img: "c11", category: "공구/DIY"), Category(img: "c12", category: "인테리어시공"), Category(img: "c13", category: "반려동물"), Category(img: "c14", category: "캠핑용품"), Category(img: "c15", category: "실내운동"), Category(img: "c16", category: "렌탈")
        ]
    }
    
    public var count: Int {
        return CategoryStorage.count
    }
    
    public func itemAt(_ row: Int) -> Category {
        return self.CategoryStorage[row]
    }
}
