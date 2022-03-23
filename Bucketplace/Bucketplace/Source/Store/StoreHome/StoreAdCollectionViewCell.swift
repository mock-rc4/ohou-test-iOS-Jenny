//
//  StoreAdCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/23.
//

import UIKit

class StoreAdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setData(_ data: String) {
        bannerImg.image = UIImage(named: data)
    }
}
