//
//  PhotoScrapCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class PhotoScrapCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var videoTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ data: PhotoScrapResult) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        if (data.videoTime != 0) {
            videoTime.text = "  00:\(data.videoTime)  "
        }
    }
    
}
