//
//  CategoryCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDisplay()
    }
    
    private func setupDisplay() {
        view.layer.cornerRadius = 5
    }

    public func setData(_ data: Category) {
        img.image = UIImage(named: data.img)
        category.text = data.category
        detail.text = data.detail
    }
    
}
