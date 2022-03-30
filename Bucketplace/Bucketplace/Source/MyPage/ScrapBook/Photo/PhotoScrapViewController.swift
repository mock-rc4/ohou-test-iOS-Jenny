//
//  PhotoScrapViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class PhotoScrapViewController: UIViewController {
    
    lazy var photoScrapDataManager = ScrapBookDataManager()
    var photoScrapModel: [PhotoScrapResult]!
    let CELL = "PhotoScrapCollectionViewCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoScrapAPI()
    }
}

extension PhotoScrapViewController {
    func getPhotoScrapAPI(){
        self.showIndicator()
        self.photoScrapDataManager.getPhotoScrap(ScrapBookId.shared.scrapbookId, self)
    }
    func didSuccessPhotoScrap(_ result: [PhotoScrapResult]) {
        photoScrapModel = result
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
        self.dismissIndicator()
    }
}

extension PhotoScrapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoScrapModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! PhotoScrapCollectionViewCell
        cell.setData(photoScrapModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 20, height: self.collectionView.frame.width/2 - 20)
    }
    
}
