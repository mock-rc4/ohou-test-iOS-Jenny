//
//  BookMarkCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

protocol BookMarkDelegate {
    func presentView()
}

class BookMarkCollectionViewCell: UICollectionViewCell {
    
    var delegate: BookMarkDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func didSuccessBookMark(_ result: BookMarkResponse) {
        delegate?.presentView()
        print("📎 스크랩했습니다.")
    }
    
    func didSuccessDeleteBookMark(_ result: DeleteBookMarkResponse) {
        print("📎 스크랩 삭제했습니다.")
    }
    
    func failedToRequest(_ message: String) {
        print(message)
    }
    
}
