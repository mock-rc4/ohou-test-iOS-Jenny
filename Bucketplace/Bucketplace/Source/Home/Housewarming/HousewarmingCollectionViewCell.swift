//
//  HousewarmingCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class HousewarmingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setData(_ data: HomewarmingFeed) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        title.text = data.description
        Functions.shared.urlToImg(data.profileImageUrl, profileImg)
        name.text = data.nickname
        Info.text = "\(data.scrappedCount)명 스크랩 | \(data.viewCount)명 조회"
    }
}
