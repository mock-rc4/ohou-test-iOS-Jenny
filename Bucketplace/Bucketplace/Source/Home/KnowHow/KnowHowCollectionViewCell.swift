//
//  KnowHowCollectionViewCell.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class KnowHowCollectionViewCell: BookMarkCollectionViewCell {

    lazy var bookMarkDataManager = BookMarkDataManager()
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var bookmarkBtn: UIButton!
    
    var feedId: Int!
    var imgFlag: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func bookmarkBtnClick(_ btn: UIButton) {
        print("📎 \(btn.tag)")
        if imgFlag {
            self.bookMarkDataManager.deleteBookMark(btn.tag, self)
            btn.setBackgroundImage(UIImage(named: "bookmark"), for: .normal)
            print(imgFlag)
            imgFlag = false
        } else {
            self.bookMarkDataManager.postBookMark(btn.tag, self)
            bookmarkBtn.setBackgroundImage(UIImage(named: "bookmark2"), for: .normal)
            print(imgFlag)
            imgFlag = true
        }
    }
    
    func setData(_ data: KnowhowFeed) {
        bookmarkBtn.tag = data.feedId
        Functions.shared.urlToImg(data.thumbnailUrl, img)
        title.text = data.description
        name.text = data.nickname
        info.text = "조회수 \(data.viewCount) · 스크랩 \(data.scrappedCount)"
        if (data.isBookmarked == 1) {
            imgFlag = true
            bookmarkBtn.setBackgroundImage(UIImage(named: "bookmark2"), for: .normal)
        }
    }
    
}
