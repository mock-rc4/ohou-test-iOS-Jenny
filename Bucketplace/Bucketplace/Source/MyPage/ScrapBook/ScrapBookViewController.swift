//
//  ScrapBookViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class ScrapBookViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDisplay()
        setupRightItems()
    }
    
    private func setupRightItems() {
        let shareBtn = makeBtn("nv_share")
        // 공백 만들기
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareBtn)
    }

}

extension ScrapBookViewController {
    private func setupDisplay() {
        name.text = ScrapBook.shared.info.scrapbookName
        Functions.shared.urlToImg(ScrapBook.shared.info.profileImageUrl, profileImg)
        nickname.text = ScrapBook.shared.info.userNickname
    }
}
