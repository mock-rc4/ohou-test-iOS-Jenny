//
//  PhotoDetailViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    lazy var photoDetailDataManager = PhotoDetailDataManager()
    @IBOutlet weak var homeType: UILabel!
    @IBOutlet weak var thumailImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "KeywordsCollectionViewCell"
    var keywordsCount: Int!
    var keywords: [Keyword]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoDetailAPI()
    }
}

// MARK: 사진 상세 페이지 API 조회
extension PhotoDetailViewController {
    private func getPhotoDetailAPI() {
        self.showIndicator()
        self.photoDetailDataManager.getPhotoDetail(FeedId.shared.feedId, self)
    }
    func didSuccessPhotoDetail(_ result: PhotoDetailResponse) {
        let photoDetailInfo = result.result.medias[0].media
        Functions.shared.urlToImg(photoDetailInfo.thumbnailUrl, thumailImg)
        let type = photoDetailInfo.mediaSpaceTypeId
        homeType.text = Functions.shared.homeType(type)
        descriptionLabel.text = photoDetailInfo.description
        
        self.keywordsCount = result.result.medias[0].keywords.count
        self.keywords = result.result.medias[0].keywords
        self.dismissIndicator()
        setupCollectionView()
    }
    
    func failedToRequest(_ message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}

// MARK: 키워드 collectionView 생성
extension PhotoDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.keywordsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! KeywordsCollectionViewCell
        print("⭐️\(self.keywords[indexPath.row].name)⭐️")
        cell.setData(self.keywords[indexPath.row].name)
        return cell
    }
}

extension PhotoDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = self.keywords[indexPath.row].name.count
        if size > 3 { size *= 23 }
        else { size *= 32 }
        return CGSize(width: size , height: 30)
    }
}
