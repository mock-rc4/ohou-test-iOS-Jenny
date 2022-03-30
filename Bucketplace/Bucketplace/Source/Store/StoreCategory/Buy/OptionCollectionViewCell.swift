//
//  OptionCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ option: String, _ data: Int) {
        color.text = option
        price.text = String(data).insertComma + "원"
    }

}
