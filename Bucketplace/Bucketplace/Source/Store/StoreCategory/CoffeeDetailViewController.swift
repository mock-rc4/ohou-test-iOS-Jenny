//
//  CoffeeDetailViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import UIKit

class CoffeeDetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buyBtnClick(_ sender: Any) {
        let vc = BuyViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
