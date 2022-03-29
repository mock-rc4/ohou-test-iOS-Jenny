//
//  KnowHowCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class KnowHowCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func bookmarkBtnClick(_ sender: Any) {
        print("📎 bookmark")
    }
}
