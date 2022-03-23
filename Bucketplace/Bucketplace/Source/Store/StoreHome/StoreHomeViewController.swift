//
//  StoreHomeViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/23.
//

import UIKit

class StoreHomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    var nowPage: Int = 0

    var images:[String] = ["스토어광고1", "스토어광고2", "스토어광고3","스토어광고4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        //setupCategory()
        setupPageControl()
        bannerTimer()
    }

}

// MARK: 광고 배너
extension StoreHomeViewController {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "StoreAdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreAdCollectionViewCell")
    }

    private func setupPageControl() {
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .init(hex: 0xFFFFFF, alpha: 0.3)
        pageControl.currentPageIndicatorTintColor = .white  // 현재 페이지
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

extension StoreHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreAdCollectionViewCell", for: indexPath) as! StoreAdCollectionViewCell
        cell.setData(images[indexPath.row])
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}

extension StoreHomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
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

//// MARK: 카테고리 설정
//extension StoreHomeViewController {
//    private func setupCategory() {
//        categoryCollectionView.delegate = self
//        categoryCollectionView.dataSource = self
//        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
//    }
//}
