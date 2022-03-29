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
    
    lazy var topListDataManager = TopListDataManager()
    var topVideoModel: [TopVideoResult]!
    var topPhotoModel: [TopPhotoResult]!
    let VIDEO_CELL = "TopVideoCollectionViewCell"
    let PHOTO_CELL = "TopPhotoCollectionViewCell"
    
    @IBOutlet weak var videoCollectionView: UICollectionView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 광고 마지막 페이지면 다시 처음부터 자동 스크롤 해주기 위해 선언한 변수
    var nowPage: Int = 0
    
    var images:[String] = ["광고1", "광고2", "광고3","광고4"]
    
    @IBOutlet weak var topScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topScrollView.delegate = self
        setupCollectionView()
        setupCategoryCollectionView()
        setupPageControl()
        bannerTimer()
        setupSections()
        getAPI()
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
    
    // MARK: Sections
    lazy var homeFirstDataManager = HomeFirstDataManager()
    lazy var homeSecondDataManager = HomeSecondDataManager()
    lazy var homeThirdDataManager = HomeThirdDataManager()
    
    @IBOutlet weak var f_img1: UIImageView!
    @IBOutlet weak var f_img2: UIImageView!
    @IBOutlet weak var f_img3: UIImageView!
    @IBOutlet weak var f_img4: UIImageView!
    
    @IBOutlet weak var f_label1: UILabel!
    @IBOutlet weak var f_label2: UILabel!
    @IBOutlet weak var f_label3: UILabel!
    @IBOutlet weak var f_label4: UILabel!
    
    @IBOutlet weak var s_img1: UIImageView!
    @IBOutlet weak var s_img2: UIImageView!
    @IBOutlet weak var s_img3: UIImageView!
    @IBOutlet weak var s_img4: UIImageView!
    
    @IBOutlet weak var s_label1: UILabel!
    @IBOutlet weak var s_label2: UILabel!
    @IBOutlet weak var s_label3: UILabel!
    @IBOutlet weak var s_label4: UILabel!
    
    @IBOutlet weak var t_img1: UIImageView!
    @IBOutlet weak var t_img2: UIImageView!
    @IBOutlet weak var t_img3: UIImageView!
    @IBOutlet weak var t_img4: UIImageView!
    
    @IBOutlet weak var t_label1: UILabel!
    @IBOutlet weak var t_label2: UILabel!
    @IBOutlet weak var t_label3: UILabel!
    @IBOutlet weak var t_label4: UILabel!
    
    var firstImgs: [UIImageView]!
    var firstLabels: [UILabel]!
    var secondImgs: [UIImageView]!
    var secondLabels: [UILabel]!
    var thirdImgs: [UIImageView]!
    var thirdLabels: [UILabel]!
    
    var secondFlag = false
    var thirdFlag = false
    var videoFlag = false
    var photoFlag = false
    
    private func setupSections() {
        self.firstImgs = [f_img1, f_img2, f_img3, f_img4]
        self.firstLabels = [f_label1, f_label2, f_label3, f_label4]
        self.secondImgs = [s_img1, s_img2, s_img3, s_img4]
        self.secondLabels = [s_label1, s_label2, s_label3, s_label4]
        self.thirdImgs = [t_img1, t_img2, t_img3, t_img4]
        self.thirdLabels = [t_label1, t_label2, t_label3, t_label4]
    }
    
    private func getAPI() {
        //self.showIndicator()
        //self.homeFirstDataManager.getHomeFirst(self)
    }
    
    // 집들이로 화면전환
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

extension TopViewController {
    func didSuccessFirst(_ result: HomeFirstResponse) {
        let firstInfo = result.result
        for i in 0 ... 3 {
            Functions.shared.urlToImg(firstInfo[i].thumbnailUrl, self.firstImgs[i])
            firstLabels[i].text = firstInfo[i].description + firstInfo[i].title
        }
        self.dismissIndicator()
    }
    
    func didSuccessSecond(_ result: HomeSecondResponse) {
        let secondInfo = result.result
        for i in 0 ... 3 {
            Functions.shared.urlToImg(secondInfo[i].thumbnailUrl, self.secondImgs[i])
            secondLabels[i].text = secondInfo[i].description + secondInfo[i].title
        }
        self.dismissIndicator()
    }
    
    func didSuccessThird(_ result: HomeThirdResponse) {
        let thirdInfo = result.result
        for i in 0 ... 3 {
            Functions.shared.urlToImg(thirdInfo[i].thumbnailUrl, self.thirdImgs[i])
            thirdLabels[i].text = thirdInfo[i].description + thirdInfo[i].title
        }
        self.dismissIndicator()
    }
    
    func didSuccessTopVideo(_ result: [TopVideoResult]) {
        topVideoModel = result
        setupVideoCollectionView()
        self.dismissIndicator()
    }
    
    func didSuccessTopPhoto(_ result: [TopPhotoResult]) {
        topPhotoModel = result
        setupPhotoCollectionView()
        self.dismissIndicator()
    }
    
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
    }
    
}

// MARK: collectionView 설정
extension TopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: 인기 동영상
    private func setupVideoCollectionView() {
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        videoCollectionView.register(UINib(nibName: VIDEO_CELL, bundle: nil), forCellWithReuseIdentifier: VIDEO_CELL)
    }
    
    private func setupPhotoCollectionView() {
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: PHOTO_CELL, bundle: nil), forCellWithReuseIdentifier: PHOTO_CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return images.count
        case self.categoryCollectionView:
            return categoryModel.count
        default:
            return 10
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
        case self.videoCollectionView:
            let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: VIDEO_CELL, for: indexPath) as! TopVideoCollectionViewCell
            cell.setData(topVideoModel[indexPath.row])
            return cell
        case self.photoCollectionView:
            let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PHOTO_CELL, for: indexPath) as! TopPhotoCollectionViewCell
            cell.setData(topPhotoModel[indexPath.row])
            return cell
        default:
            let cell = UICollectionViewCell()
            return cell
        }
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
            return CGSize(width: 190, height: collectionView.frame.size.height)
        }
    }
    
}


extension TopViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if secondFlag == false {
            if ((topScrollView.contentOffset.y) >= 290) {
                //self.showIndicator()
                //self.homeSecondDataManager.getHomeSecond(self)
                secondFlag = true
            }
        }
        if thirdFlag == false {
            if (topScrollView.contentOffset.y) >= 870 {
                //self.showIndicator()
                //self.homeThirdDataManager.getHomeThird(self)
                thirdFlag = true
            }
        }
        if videoFlag == false {
            if (topScrollView.contentOffset.y) >= 2090 {
                self.showIndicator()
                self.topListDataManager.getVideo(self)
                videoFlag = true
            }
        }
        if photoFlag == false {
            if (topScrollView.contentOffset.y) >= 2630 {
                self.showIndicator()
                self.topListDataManager.getPhoto(self)
                photoFlag = true
            }
        }
    }
}

