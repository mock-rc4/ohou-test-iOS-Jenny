//
//  BuyViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import UIKit

class BuyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1)
        self.view.isOpaque = false
    }

    // 장바구니
    @IBAction func cartBtnClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // 구매하기
    @IBAction func buyBtnClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
