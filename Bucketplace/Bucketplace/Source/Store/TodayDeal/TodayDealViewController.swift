//
//  TodayDealViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/24.
//

import UIKit

class TodayDealViewController: UIViewController {
    
    lazy var todayDealDataManager = TodayDealDataManager()
    
    @IBOutlet weak var todayDealCollectionView: UICollectionView!
    var todayDealModel: [TodayDealList]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTodayDealAPI()
        setupControllers()
    }
    
    private func setupControllers() {
        self.title = "오늘의딜"
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
}

extension TodayDealViewController {
    private func getTodayDealAPI() {
        self.showIndicator()
        self.todayDealDataManager.getTodayDeal(self)
    }
    
    func didSuccessTodayDeal(_ result: TodayDealResponse) {
        todayDealModel = result.result.todayDealList
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}

extension TodayDealViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func setupCollectionView() {
        todayDealCollectionView.delegate = self
        todayDealCollectionView.dataSource = self
        todayDealCollectionView.register(UINib(nibName: "TodayDealHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TodayDealHeaderCollectionReusableView")
        todayDealCollectionView.register(UINib(nibName: "TodayDealCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TodayDealCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayDealModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodayDealHeaderCollectionReusableView", for: indexPath) as! TodayDealHeaderCollectionReusableView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = todayDealCollectionView.dequeueReusableCell(withReuseIdentifier: "TodayDealCollectionViewCell", for: indexPath) as! TodayDealCollectionViewCell
        cell.setData(todayDealModel[indexPath.row])
        return cell
    }
}

extension TodayDealViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 200)
    }
}

