//
//  TodayDealViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/24.
//

import UIKit

class TodayDealViewController: UIViewController {
    
    @IBOutlet weak var todayDealCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupCollectionView()
    }
    
    private func setupControllers() {
        self.title = "오늘의딜"
    }
    
    private func setupCollectionView() {
        todayDealCollectionView.delegate = self
        todayDealCollectionView.dataSource = self
        todayDealCollectionView.register(UINib(nibName: "TodayDealHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TodayDealHeaderCollectionReusableView")
        todayDealCollectionView.register(UINib(nibName: "TodayDealCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TodayDealCollectionViewCell")
    }
    
}

extension TodayDealViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodayDealHeaderCollectionReusableView", for: indexPath) as! TodayDealHeaderCollectionReusableView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = todayDealCollectionView.dequeueReusableCell(withReuseIdentifier: "TodayDealCollectionViewCell", for: indexPath) as! TodayDealCollectionViewCell
        return cell
    }
}

extension TodayDealViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 200)
    }
}

