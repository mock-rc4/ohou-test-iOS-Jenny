//
//  HousewarmingScrapViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class HousewarmingScrapViewController: UIViewController {
    
    lazy var housewarmingScrapDataManager = ScrapBookDataManager()
    var housewarmingScrapModel: [HousewarmingScrapResult]!
    let CELL = "HousewarmingScrapCollectionViewCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHousewarmingScrapAPI()
    }
}

extension HousewarmingScrapViewController {
    func getHousewarmingScrapAPI(){
        self.showIndicator()
        self.housewarmingScrapDataManager.getHousewarmingScrap(ScrapBookId.shared.scrapbookId, self)
    }
    func didSuccessHousewarmingScrap(_ result: [HousewarmingScrapResult]) {
        housewarmingScrapModel = result
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
        self.dismissIndicator()
    }
}

extension HousewarmingScrapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return housewarmingScrapModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! HousewarmingScrapCollectionViewCell
        cell.setData(housewarmingScrapModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 20, height: 250)
    }
    
}
