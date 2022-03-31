//
//  UINavigationController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/20.
//

import UIKit

import SnapKit

extension UINavigationController {
    
    // MARK: 네비게이션바 숨기기
    func navigationBarHidden() {
        self.hidesBarsOnSwipe = true
    }
    
    //    // MARK: 네비게이션 바 검색창
    //    func searchNavigationBar() -> UITextView {
    //
    //        let searchText: UITextView = {
    //            let textView = UITextView()
    //            textView.textColor = .lightGray
    //            textView.font = .systemFont(ofSize: 14)
    //            return textView
    //        }()
    //
    //        let navigationBarWidth = self.navigationBar.frame.width
    //        searchText.snp.makeConstraints() {
    //            $0.height.equalTo(40)
    //            $0.width.equalTo(navigationBarWidth - 80)
    //        }
    //        self.navigationItem.titleView = searchText
    //
    //        return searchText
    //    }
    
}
