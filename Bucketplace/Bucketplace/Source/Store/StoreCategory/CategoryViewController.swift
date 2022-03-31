//
//  CategoryViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var adCollectionView: UICollectionView!
    let CELL = "ProductCollectionViewCell"
    
    private var nowPage: Int = 0
    var images:[String] = ["광고1", "광고2", "광고3","광고4"]
    var products: [String] = ["deal1", "deal2", "deal3", "deal4","deal1", "deal2", "deal3", "deal4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "커피메이커/머신"
        setupCollectionView()
        bannerTimer()
        setupRightItems()
    }
    
    private func setupRightItems() {
        let backImg = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorImage = backImg
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImg
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        // back 버튼과 leftitem 같이 넣기 위함
        self.navigationItem.leftItemsSupplementBackButton = true
        let homeBtn = makeBtn("nv_home")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homeBtn)
        let searchBtn = makeBtn("nv_search")
        let cartBtn = makeBtn("nv_cart")
        // 공백 만들기
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 12
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartBtn), spacer, UIBarButtonItem(customView: searchBtn)]
    }
    
    // MARK: 자동 스크롤 설정 (Timer)
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
            adCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        adCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }

}

// MARK: 커피관련 상품 리스트
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
        adCollectionView.delegate = self
        adCollectionView.dataSource = self
        adCollectionView.layer.cornerRadius = 10
        adCollectionView.register(UINib(nibName: "AdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AdCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.adCollectionView:
            return images.count
        default:
            return products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.adCollectionView:
            let cell = adCollectionView.dequeueReusableCell(withReuseIdentifier: "AdCollectionViewCell", for: indexPath) as! AdCollectionViewCell
            cell.setData(images[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! ProductCollectionViewCell
            cell.setData(products[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presentNVC(ProductDetailViewController())
    }
}


extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.adCollectionView:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        default:
            let numberOfCells: CGFloat = 2
            let width = collectionView.frame.size.width - 10
            return CGSize(width: width/(numberOfCells), height: 370)
        }
    }
}
