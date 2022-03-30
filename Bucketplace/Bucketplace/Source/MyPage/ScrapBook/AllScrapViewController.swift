//
//  AllScrapViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class AllScrapViewController: UIViewController {
    
    lazy var allScrapDataManager = ScrapBookDataManager()
    var allScrapModel: [AllScrapResult]!
    let CELL = "AllScrapCollectionViewCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllScrapAPI()
    }
}

extension AllScrapViewController {
    func getAllScrapAPI(){
        self.showIndicator()
        self.allScrapDataManager.getAllScrap(ScrapBookId.shared.scrapbookId, self)
    }
    func didSuccessAllScrap(_ result: [AllScrapResult]) {
        allScrapModel = result
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
        self.dismissIndicator()
    }
}

extension AllScrapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allScrapModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! AllScrapCollectionViewCell
        cell.setData(allScrapModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 20, height: self.collectionView.frame.width/2 - 20)
    }
    
}
