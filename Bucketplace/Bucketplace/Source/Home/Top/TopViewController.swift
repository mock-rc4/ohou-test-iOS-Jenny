//
//  TopViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

import Pageboy
import Tabman

class TopViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 광고 마지막 페이지면 다시 처음부터 자동 스크롤 해주기 위해 선언한 변수
    var nowPage: Int = 0
    
    var images:[String] = ["광고1", "광고2", "광고3","광고4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupCategoryCollectionView()
        setupPageControl()
        bannerTimer()
    }
    
    // 광고 배너 넣는 collectionView 설정
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 10
        collectionView.register(UINib(nibName: "AdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AdCollectionViewCell")
    }
    
    // pageControl 설정
    private func setupPageControl() {
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .init(hex: 0xFFFFFF, alpha: 0.3)
        pageControl.currentPageIndicatorTintColor = .white
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
            collectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        collectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    // MARK: 집들이로 화면 전환
    @IBAction func moreBtnClick(_ sender: Any) {
        TabManIndex.shared.index = 3
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
        self.changeRootViewController(vc)
    }
    
    
    // MARK: 카테고리
    var categoryModel: CategoryModel = CategoryModel()
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private func setupCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "HomeCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryCollectionViewCell")
    }
    
    // MARK: 오늘의딜
    @IBAction func TodayDealBtnClick(_ sender: Any) {
        let vc = TodayDealViewController()
        vc.hidesBottomBarWhenPushed = true
        self.presentNVC(vc)
    }
    
}

// MARK: collectionView 설정
extension TopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return images.count
        case self.categoryCollectionView:
            return categoryModel.count
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.collectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCollectionViewCell", for: indexPath) as! AdCollectionViewCell
            cell.setData(images[indexPath.row])
            return cell
        case self.categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
            let cellData = categoryModel.itemAt(indexPath.row)
            cell.setData(cellData)
            return cell
        default:
            let cell = UICollectionViewCell()
            return cell
        }
    }
    
    // collectionView 스크롤 끝났을 때 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        // 가로 사이즈 = 300 일 경우,
        // 컨텐츠의 x위치 0/300 = 0 (0번째 페이지) | 1/300 = 1 (1번째 페이지) | 2/300 = 2 (2번째 페이지)
    }
    
}

extension TopViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.collectionView:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        case self.categoryCollectionView:
            return CGSize(width: 80, height: collectionView.frame.size.height)
        default:
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }
    }
    
}

// MARK: PageControl 설정
extension TopViewController: UIScrollViewDelegate {
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
