//
//  TabBarController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/19.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 처음 화면에만 나오게
    override func viewDidAppear(_ animated: Bool) {
        // 스토리보드 분리하면 꼭 이름 명시하고 present 가능 !
        if Constant.firstFlag == true {
            let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginNavigationController") as! LoginNavigationController
            vc.modalPresentationStyle = .overFullScreen // full screen은 왜 안됨 ?
            self.present(vc,animated: true, completion: nil)
        }
    }
}

