//
//  PhotoCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/26.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var photoDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(_ data: BaseInformation) {
        Functions.shared.urlToImg(data.thumbnailUrl, photoImg)
        photoDescription.text = data.description
    }

}
