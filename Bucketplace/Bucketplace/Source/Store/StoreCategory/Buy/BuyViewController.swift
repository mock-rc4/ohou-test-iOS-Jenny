//
//  BuyViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import UIKit

import DropDown

class BuyViewController: UIViewController {

    @IBOutlet weak var optionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.view.isOpaque = false
    }
    
    // 옵션선택
    @IBAction func optionBtnClick(_ sender: Any) {
        let vc = UIStoryboard(name: "Buy", bundle: nil).instantiateViewController(withIdentifier: "OptionViewController")
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
}
