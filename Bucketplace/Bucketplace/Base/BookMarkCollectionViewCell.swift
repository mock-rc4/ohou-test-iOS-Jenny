//
//  BookMarkCollectionViewCell.swift
//  Bucketplace
//
//  Created by κΉμμΈ on 2022/03/30.
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
        print("π μ€ν¬λ©νμ΅λλ€.")
    }
    
    func didSuccessDeleteBookMark(_ result: DeleteBookMarkResponse) {
        print("π μ€ν¬λ© μ­μ νμ΅λλ€.")
    }
    
    func failedToRequest(_ message: String) {
        print(message)
    }
    
}
