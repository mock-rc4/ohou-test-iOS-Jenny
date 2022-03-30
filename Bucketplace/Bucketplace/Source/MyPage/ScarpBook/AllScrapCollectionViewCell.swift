//
//  AllScrapCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class AllScrapCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var videoTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ data: AllScrapResult) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        category.text = Functions.shared.homeType(data.isPhoto, data.isMediaFeed, data.isHomewarming, data.isKnowhow)
        if (data.videoTime != 0) {
            videoTime.text = "  00:\(data.videoTime)  "
        }
    }
    
}
