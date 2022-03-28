//
//  StoreHomeViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/23.
//

import UIKit

class StoreHomeViewController: UIViewController {
    
    lazy var recentDataManager = RecentDataManager()
    var recentModel: [ViewProductList]!
    @IBOutlet weak var recentCollectionView: UICollectionView!
    
    @IBOutlet weak var bestCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var nowPage: Int = 0
    var images:[String] = ["스토어광고1", "스토어광고2", "스토어광고3","스토어광고4"]
    
    let AD_CELL = "StoreAdCollectionViewCell"
    let RECENT_CELL = "RecentCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPageControl()
        bannerTimer()
        setupCategory()
        getRecentAPI()
    }
    
    @IBOutlet weak var categoryView: UIView!
    
    @IBAction func moreBtnClick(_ sender: Any) {
        presentTodayDeal()
    }
    
    @IBAction func moreBtnClick2(_ sender: Any) {
        presentTodayDeal()
    }
}

// MARK: 카테고리 (가전>주방가전>커피메이커/머신)
extension StoreHomeViewController {
    private func setupCategory() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goCategory(_:)))
        self.categoryView.addGestureRecognizer(gesture)
    }
    
    @objc func goCategory(_ sender: Any) {
        self.presentNVC(CategoryViewController())
    }
}

// MARK: 오늘의딜
extension StoreHomeViewController {
    private func presentTodayDeal() {
        let vc = TodayDealViewController()
        vc.hidesBottomBarWhenPushed = true
        self.presentNVC(vc)
    }
}

// MARK: 최근 본 상품
extension StoreHomeViewController {
    private func getRecentAPI() {
        self.showIndicator()
        self.recentDataManager.getRecnet(self)
    }
    func didSuccessRecent(_ result: RecentResult){
        recentModel = result.viewProductList
        setupRecentCollectionView()
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
    }
    
    private func setupRecentCollectionView() {
        recentCollectionView.delegate = self
        recentCollectionView.dataSource = self
        recentCollectionView.register(UINib(nibName: RECENT_CELL, bundle: nil), forCellWithReuseIdentifier: RECENT_CELL)
    }
}

// MARK: 광고 배너
extension StoreHomeViewController {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: AD_CELL, bundle: nil), forCellWithReuseIdentifier: AD_CELL)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .init(hex: 0xFFFFFF, alpha: 0.3)
        pageControl.currentPageIndicatorTintColor = .white
    }
    
    private func bannerTimer(){
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    // 배너 움직이는 메서드
    private func bannerMove() {
        // 마지막 페이지인 경우
        if nowPage == images.count - 1 {
            // 맨 처음 페이지로 돌아감
            collectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        collectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
}

// MARK: collectionView들 설정
extension StoreHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return images.count
        case self.recentCollectionView:
            return recentModel.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.collectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AD_CELL, for: indexPath) as! StoreAdCollectionViewCell
            cell.setData(images[indexPath.row])
            return cell
        case self.recentCollectionView:
            let cell = recentCollectionView.dequeueReusableCell(withReuseIdentifier: RECENT_CELL, for: indexPath) as! RecentCollectionViewCell
            cell.setData(recentModel[indexPath.row])
            return cell
        default:
            let cell = UICollectionViewCell()
            return cell
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

extension StoreHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.collectionView:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        case self.recentCollectionView:
            return CGSize(width: 170, height: collectionView.frame.size.height)
        default:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }
    }
    
}

extension StoreHomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        // 좌표 보정을 위해 절반의 너비 더해줌
        let x = scrollView.contentOffset.x + (width / 2)
        let newPage = Int(x / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}
