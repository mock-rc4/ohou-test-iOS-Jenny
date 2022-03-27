//
//  KeywordsCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import UIKit

class KeywordsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var keywordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // label에 테두리 넣기
        keywordLabel.clipsToBounds = true
        keywordLabel.layer.cornerRadius = 5
    }

    public func setData(_ data: String) {
        keywordLabel.text = "  # \(data)   "
    }
    
}
