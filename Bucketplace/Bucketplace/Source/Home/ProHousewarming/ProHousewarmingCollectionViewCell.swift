//
//  ProHousewarmingCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class ProHousewarmingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var pro: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ data: ProHomewarmingFeed) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        title.text = data.description
        Functions.shared.urlToImg(data.profileImageUrl, profileImg)
        name.text = data.nickname
        info.text = "스크랩 \(data.scrappedCount) · 조회수 \(data.viewCount)"
    }

}
