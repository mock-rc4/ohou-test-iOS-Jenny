//
//  TodayDealCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import UIKit

class TodayDealCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var star: UILabel!
    @IBOutlet weak var review: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}
