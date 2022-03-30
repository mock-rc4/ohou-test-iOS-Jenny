//
//  BookMarkCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class BookMarkCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func didSuccessBookMark(_ result: BookMarkResponse) {
        print("📎 스크랩했습니다.")
    }
    
    func didSuccessDeleteBookMark(_ result: DeleteBookMarkResponse) {
        print("📎 스크랩 삭제했습니다.")
    }
    
    func failedToRequest(_ message: String) {
        print(message)
    }
    
}
