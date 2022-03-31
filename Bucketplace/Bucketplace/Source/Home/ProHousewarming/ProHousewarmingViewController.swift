//
//  ProHousewarmingViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/29.
//

import UIKit

class ProHousewarmingViewController: UIViewController {

    lazy var proDataManager = ProDataManager()
    var proModel: [ProHomewarmingFeed]!
    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "ProHousewarmingCollectionViewCell"
    @IBOutlet weak var totalCnt: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProAPI()
        scrollView.delegate = self
    }

}

// MARK: API 호출
extension ProHousewarmingViewController {
    private func getProAPI() {
        self.showIndicator()
        self.proDataManager.getPro(self)
    }
    func didSuccessPro(_ result: ProResult){
        totalCnt.text = "전체 \(result.feedCount)"
        proModel = result.homewarmingFeeds
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}


extension ProHousewarmingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return proModel.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! ProHousewarmingCollectionViewCell
        cell.setData(proModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2, height: 300)
    }
}

extension ProHousewarmingViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
       if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
           self.navigationController?.setNavigationBarHidden(true, animated: true)

       } else {
           self.navigationController?.setNavigationBarHidden(false, animated: true)
       }
    }
}
