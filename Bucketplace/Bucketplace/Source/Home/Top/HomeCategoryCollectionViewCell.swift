//
//  HomeCategoryCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(_ data: Category) {
        img.image = UIImage(named: data.img)
        name.text = data.category
    }

}
