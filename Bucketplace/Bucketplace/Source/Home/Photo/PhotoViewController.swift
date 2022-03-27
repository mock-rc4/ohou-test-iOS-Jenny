//
//  PhotoViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

class PhotoViewController: UIViewController {
    
    lazy var photoListDataManager = PhotoListDataManager()
    var photoListInfo: PhotoListResponse!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let MAIN_CELL = "PhotoMainCollectionViewCell"
    let FILTER_CELL = "PhotoFilterCollectionViewCell"
    let PHOTO_CELL = "PhotoCollectionViewCell"
    
    var photoMainModel = PhotoMainModel()
    var photoFilterModel = PhotoFilterModel()
    
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
    func didSuccessPhotoList(_ result: PhotoListResponse) {
        self.photoListInfo = result
        setupCollectionView()
        self.dismissIndicator()
    }
    
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
    }
    
}

// MARK: CollectionView Layout 설정
extension PhotoViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if (sectionNumber == 0) {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalWidth(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                       heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
                section.orthogonalScrollingBehavior = .continuous
                return section
            }
            else if (sectionNumber == 1) {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                       heightDimension: .estimated(35))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
                section.orthogonalScrollingBehavior = .continuous
                return section
            }
            else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 15)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(300))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitem: item, count: 2)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 15, leading: 10, bottom: 0, trailing: 0)
                return section
            }
            
        }
        
    }
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func setupCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: MAIN_CELL, bundle: nil), forCellWithReuseIdentifier: MAIN_CELL)
        collectionView.register(UINib(nibName: FILTER_CELL, bundle: nil), forCellWithReuseIdentifier: FILTER_CELL)
        collectionView.register(UINib(nibName: PHOTO_CELL, bundle: nil), forCellWithReuseIdentifier: PHOTO_CELL)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return photoMainModel.count
        case 1:
            return photoFilterModel.count
        case 2:
            return 5
        default:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MAIN_CELL, for: indexPath) as! PhotoMainCollectionViewCell
            cell.setData(photoMainModel.itemAt(indexPath.row))
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FILTER_CELL, for: indexPath) as! PhotoFilterCollectionViewCell
            cell.setData(photoFilterModel.itemAt(indexPath.row))
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PHOTO_CELL, for: indexPath) as! PhotoCollectionViewCell
            let cellData = self.photoListInfo.result[indexPath.row].baseInformation
            cell.setData([cellData.thumbnailUrl, cellData.description])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
