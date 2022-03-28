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

    public func setData(_ data: TodayDealList) {
        img.image = UIImage(named: data.brand)
        content.text = data.name
        company.text = data.brand
        price.text = String(data.price).insertComma
        discount.text =  "\(data.discountRate)%"
        star.text = "\(data.ratedAverage)"
        review.text = "리뷰 \(data.reviewCount)"
    }
    
}
