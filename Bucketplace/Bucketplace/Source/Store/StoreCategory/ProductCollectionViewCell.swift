//
//  ProductCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ data: String) {
        img.image = UIImage(named: data)
    }
}
