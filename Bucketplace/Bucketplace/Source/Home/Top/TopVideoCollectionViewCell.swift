//
//  TopVideoCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class TopVideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ data: TopVideoResult) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        num.text = "\(data.rowNum)"
        name.text = data.nickname
    }
}
