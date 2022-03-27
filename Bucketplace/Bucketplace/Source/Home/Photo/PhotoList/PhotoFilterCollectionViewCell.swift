//
//  PhotoFilterCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/26.
//

import UIKit

class PhotoFilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filterImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(_ data: String) {
        filterImg.image = UIImage(named: data)
    }

}
