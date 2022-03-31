//
//  CategoryViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "ProductCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "커피메이커/머신"
        setupCollectionView()
        setupRightItems()
    }
    
    private func setupRightItems() {
        let backImg = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorImage = backImg
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImg
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        // back 버튼과 leftitem 같이 넣기 위함
        self.navigationItem.leftItemsSupplementBackButton = true
        let homeBtn = makeBtn("nv_home")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homeBtn)
        let searchBtn = makeBtn("nv_search")
        let cartBtn = makeBtn("nv_cart")
        // 공백 만들기
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 12
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartBtn), spacer, UIBarButtonItem(customView: searchBtn)]
    }

}

// MARK: 커피관련 상품 리스트
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! ProductCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presentNVC(ProductDetailViewController())
    }
}


extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 2
        let width = collectionView.frame.size.width - 10
        return CGSize(width: width/(numberOfCells), height: 370)
    }
}
