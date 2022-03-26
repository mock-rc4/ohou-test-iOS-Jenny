//
//  PhotoMainCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/26.
//

import UIKit

class PhotoMainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(_ data: String) {
        image.image = UIImage(named: data)
    }

}
