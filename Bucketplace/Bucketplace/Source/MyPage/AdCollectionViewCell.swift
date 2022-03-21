//
//  AdCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

class AdCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(_ data: String) {
        bannerImg.image = UIImage(named: data)
    }
}
