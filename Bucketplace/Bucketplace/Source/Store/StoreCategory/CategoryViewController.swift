//
//  CategoryViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "CoffeeCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "커피메이커/머신"
        setupCollectionView()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! CoffeeCollectionViewCell
        return cell
    }
}


extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 2
        let width = collectionView.frame.size.width - 10
        return CGSize(width: width/(numberOfCells), height: 370)
    }
}
