//
//  HousewarmingViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

class HousewarmingViewController: UIViewController {

    lazy var housewarmingDataManager = HousewarmingDataManager()
    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "HousewarmingCollectionViewCell"
    var housewarmingModel: [HomewarmingFeed]!
    @IBOutlet weak var totalCnt: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHousewarmingAPI()
        scrollView.delegate = self
    }

}

extension HousewarmingViewController {
    private func getHousewarmingAPI() {
        self.showIndicator()
        self.housewarmingDataManager.getHousewarming(self)
    }
    func didSuccessHousewarming(_ result: HousewarmingResult){
        housewarmingModel = result.homewarmingFeeds
        totalCnt.text = "전체 \(result.feedCount)"
        setupCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}


extension HousewarmingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return housewarmingModel.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! HousewarmingCollectionViewCell
        cell.delegate = self
        cell.setData(housewarmingModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 370)
    }
}

extension HousewarmingViewController: BookMarkDelegate {
    func presentView() {
        self.presentBookmark()
    }
}

extension HousewarmingViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
       if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
           self.navigationController?.setNavigationBarHidden(true, animated: true)

       } else {
           self.navigationController?.setNavigationBarHidden(false, animated: true)
       }
    }
}
