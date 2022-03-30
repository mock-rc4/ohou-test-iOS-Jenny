//
//  HousewarmingCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class HousewarmingCollectionViewCell: BookMarkCollectionViewCell {
    
    lazy var bookMarkDataManager = BookMarkDataManager()

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Info: UILabel!
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

    public func setData(_ data: HomewarmingFeed) {
        bookmarkBtn.tag = data.feedId
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        title.text = data.description
        Functions.shared.urlToImg(data.profileImageUrl, profileImg)
        name.text = data.nickname
        Info.text = "\(data.scrappedCount)명 스크랩 | \(data.viewCount)명 조회"
        if (data.isBookmarked == 1) {
            imgFlag = true
            bookmarkBtn.setBackgroundImage(UIImage(named: "bookmark2"), for: .normal)
        }
    }
}
