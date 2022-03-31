//
//  HomeViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/20.
//

import UIKit

import SnapKit

class HomeViewController: UIViewController {
    
    let searchText: UITextField = {
        let textView = UITextField()
        textView.placeholder = " 오늘의집 통합검색"
        textView.font = .systemFont(ofSize: 17)
        textView.textColor = .lightGray
        textView.backgroundColor = .systemGray6
        textView.cornerRadius = 10
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupRightItems()
        setupSearch()
    }

    private func setupControllers() {
        Placeholder.shared.placeholder = " 오늘의집 통합검색"
        self.tabBarController?.setupTabBarLine()
        let navigationBarWidth = self.navigationController?.navigationBar.frame.width ?? 0
        searchText.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.width.equalTo(navigationBarWidth - 110)
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchText)
    }
    
    private func setupRightItems() {
        let bookmarkBtn = makeBtn("nv_bookmark")
        let cartBtn = makeBtn("nv_cart")
        // 공백 만들기
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 12
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartBtn), spacer, UIBarButtonItem(customView: bookmarkBtn)]
    }
    
    private func setupSearch() {
        searchText.addleftimage(image: UIImage(systemName: "magnifyingglass")!)
    }
    
}
