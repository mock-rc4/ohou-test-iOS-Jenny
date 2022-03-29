//
//  PhotoViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

class PhotoViewController: UIViewController {
    
    lazy var photoListDataManager = PhotoListDataManager()
    var photoListModel: [PhotoListResult]!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let PHOTO_CELL = "PhotoCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoListAPI()
    }
    
}

// MARK: 사진 목록 API 조회
extension PhotoViewController {
    private func getPhotoListAPI() {
        self.showIndicator()
        self.photoListDataManager.getPhotoList(self)
    }
    func didSuccessPhotoList(_ result: [PhotoListResult]) {
        photoListModel = result
        setupCollectionView()
        self.dismissIndicator()
    }
    
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
    }
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PHOTO_CELL, bundle: nil), forCellWithReuseIdentifier: PHOTO_CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoListModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PHOTO_CELL, for: indexPath) as! PhotoCollectionViewCell
        cell.setData(photoListModel[indexPath.row].baseInformation)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FeedId.shared.feedId = photoListModel[indexPath.row].baseInformation.feedId
        self.presentNVC(PhotoDetailViewController())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 20, height: 350)
    }
}
