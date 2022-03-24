//
//  UITabBarController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/24.
//

import UIKit

extension UITabBarController {
    
    // MARK: 탭바 위에 선
    func setupTabBarLine() {
        self.tabBar.barTintColor = .systemBackground
        self.tabBar.layer.borderWidth = 0.3
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
