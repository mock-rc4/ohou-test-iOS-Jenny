//
//  PhotoViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let MAIN_CELL = "PhotoMainCollectionViewCell"
    let FILTER_CELL = "PhotoFilterCollectionViewCell"
    let PHOTO_CELL = "PhotoCollectionViewCell"
    
    var photoMainModel = PhotoMainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                       heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            }
            else if (sectionNumber == 1) {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalWidth(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                                       heightDimension: .estimated(1000))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                               subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            }
            else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(140),
                                                      heightDimension: .absolute(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2),
                                                       heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
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
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch section {
            case 0:
                return photoMainModel.count
            case 1:
                return 10
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
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PHOTO_CELL, for: indexPath) as! PhotoCollectionViewCell
                return cell
            default:
                return UICollectionViewCell()
            }
        }
    }
    
