//
//  ProHousewarmingCollectionViewCell.swift
//  Bucketplace
//
//  Created by κΉμμΈ on 2022/03/29.
//

import UIKit

class ProHousewarmingCollectionViewCell: BookMarkCollectionViewCell {
    
    lazy var bookMarkDataManager = BookMarkDataManager()
    
    @IBOutlet weak var bookmarkBtn: UIButton!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var pro: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    
    var imgFlag: Bool = false
    
    @IBAction func bookmarkBtnClick(_ btn: UIButton) {
        print("π \(btn.tag)")
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
    
    func setData(_ data: ProHomewarmingFeed) {
        bookmarkBtn.tag = data.feedId
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        title.text = data.description
        Functions.shared.urlToImg(data.profileImageUrl, profileImg)
        name.text = data.nickname
        info.text = "μ€ν¬λ© \(data.scrappedCount) Β· μ‘°νμ \(data.viewCount)"
        if (data.isBookmarked == 1) {
            imgFlag = true
            bookmarkBtn.setBackgroundImage(UIImage(named: "bookmark2"), for: .normal)
        }
    }

}
