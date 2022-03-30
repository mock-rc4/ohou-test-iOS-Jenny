//
//  KnowhowScrapViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class KnowhowScrapViewController: UIViewController {
    
    lazy var knowhowScrapDataManager = ScrapBookDataManager()
    var knowhowScrapModel: [KnowhowScrapResult]!
    let CELL = "KnowhowScrapCollectionViewCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getKnowhowScrapAPI()
    }
}

extension KnowhowScrapViewController {
    func getKnowhowScrapAPI(){
        self.showIndicator()
        self.knowhowScrapDataManager.getKnowhowScrap(ScrapBookId.shared.scrapbookId, self)
    }
    func didSuccessKnowhowScrap(_ result: [KnowhowScrapResult]) {
        knowhowScrapModel = result
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
        self.dismissIndicator()
    }
}

extension KnowhowScrapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return knowhowScrapModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! KnowhowScrapCollectionViewCell
        cell.setData(knowhowScrapModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 130)
    }
    
}
