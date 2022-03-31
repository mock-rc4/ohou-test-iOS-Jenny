//
//  MyPageViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import UIKit

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightItems()
    }
    
    private func setupRightItems() {
        let settingBtn = makeBtn("nv_setting")
        let shareBtn = makeBtn("nv_share")
        let cartBtn = makeBtn("nv_cart")
        // 공백 만들기
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 12
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartBtn), spacer, UIBarButtonItem(customView: shareBtn), spacer, UIBarButtonItem(customView: settingBtn)]
    }
}
