//
//  PhotoCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/26.
//

import UIKit

class PhotoCollectionViewCell: BookMarkCollectionViewCell {
    
    lazy var bookMarkDataManager = BookMarkDataManager()

    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var photoDescription: UILabel!
    @IBOutlet weak var bookmarkBtn: UIButton!
    
    var feedId: Int!
    var imgFlag: Bool = false
    
    @IBAction func bookmarkBtnClick(_ btn: UIButton) {
        print("📎 \(btn.tag)")
        if imgFlag {
            self.bookMarkDataManager.deleteBookMark(btn.tag, self)
            btn.setBackgroundImage(UIImage(named: "bookmarkw"), for: .normal)
            print(imgFlag)
            imgFlag = false
        } else {
            self.bookMarkDataManager.postBookMark(btn.tag, self)
            bookmarkBtn.setBackgroundImage(UIImage(named: "bookmark2"), for: .normal)
            print(imgFlag)
            imgFlag = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(_ data: BaseInformation) {
        bookmarkBtn.tag = data.feedId
        Functions.shared.urlToImg(data.thumbnailUrl, photoImg)
        photoDescription.text = data.description
        if (data.isBookmarked == 1) {
            imgFlag = true
            bookmarkBtn.setBackgroundImage(UIImage(named: "bookmark2"), for: .normal)
        }
    }

}
