//
//  RecentCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var starAverage: UILabel!
    @IBOutlet weak var reviewCnt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setData(_ data: ViewProductList) {
        img.image = UIImage(named: data.brand)
        brand.text = data.brand
        title.text = data.name
        discount.text = "\(data.discountRate)%"
        price.text = String(data.price).insertComma
        starAverage.text = "\(data.ratedAverage)"
        reviewCnt.text = "리뷰 \(data.reviewCount)"
    }
    
}
