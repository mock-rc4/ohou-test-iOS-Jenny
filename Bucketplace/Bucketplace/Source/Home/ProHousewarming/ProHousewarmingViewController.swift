//
//  ProHousewarmingViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class ProHousewarmingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "ProHousewarmingCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

}


extension ProHousewarmingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! ProHousewarmingCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2, height: 300)
    }
}

