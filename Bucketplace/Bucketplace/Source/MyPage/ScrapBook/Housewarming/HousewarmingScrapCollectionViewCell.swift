//
//  HousewarmingScrapCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class HousewarmingScrapCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var isPro: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ data: HousewarmingScrapResult) {
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        Functions.shared.urlToImg(data.profileImageUrl, profileImg)
        if data.isProfessional == 1 {
            isPro.text = "전문가 집들이"
        }
        title.text = data.title
        nickname.text = data.userNickname
    }
    
}
