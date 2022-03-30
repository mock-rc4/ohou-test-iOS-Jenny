//
//  KnowhowScrapCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class KnowhowScrapCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var theme: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ data: KnowhowScrapResult) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        title.text = data.title
        theme.text = data.themeName
    }
    
}
