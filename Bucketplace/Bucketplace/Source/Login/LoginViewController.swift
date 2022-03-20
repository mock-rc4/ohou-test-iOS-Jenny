//
//  LoginViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/20.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goMainBtnClick(_ sender: Any) {
        presentVC(HomeViewController())
    }
    
}
