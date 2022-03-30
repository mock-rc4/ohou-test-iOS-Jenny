//
//  ProfileViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var nowPage: Int = 0
    var images:[String] = ["광고1", "광고2", "광고3","광고4"]
    
    lazy var scrapbookDataManager = ScrapBookDataManager()
    
    lazy var profileDataManager = ProfileDataManager()
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var follower: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var scrapBook: UILabel!
    @IBOutlet weak var like: UILabel!
    @IBOutlet weak var photoNum: UILabel!
    
    @IBOutlet weak var scrapBookView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        setupProfile()
        setupCollectionView()
        setupPageControl()
        setupScrapBook()
        bannerTimer()
    }
    
    // MARK: 스크랩북으로 이동
    private func setupScrapBook() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goScrapBook(_:)))
        scrapBookView.addGestureRecognizer(gesture)
    }
    
    @objc func goScrapBook(_ sender: Any) {
        let vc = UIStoryboard(name: "ScrapBook", bundle: nil).instantiateViewController(withIdentifier: "ScrapBookViewController") as! ScrapBookViewController
        vc.hidesBottomBarWhenPushed = true
        self.presentNVC(vc)
    }
}

// MARK: 내 정보 불러오기
extension ProfileViewController {
    private func setupProfile() {
        self.showIndicator()
        self.profileDataManager.getProfile(self)
        self.profileDataManager.getPhotoNum(UserId.shared.userId, self)
    }
    
    func didSuccessProfile(_ result: ProfileResponse) {
        let info = result.result
        Functions.shared.urlToImg(info.profileImageUrl, profileImg)
        nickname.text = info.nickname
        follower.text = "\(info.follower)"
        following.text = "\(info.followee)"
        scrapBook.text = "\(info.scrapBookFeeds)"
        like.text = "\(info.likeFeed)"
        UserId.shared.userId = info.id
        self.dismissIndicator()
        getScrapBookAPI()
    }
    
    func didSuccessPhotoNum(_ result: PhotoNumResponse) {
        photoNum.text = "\(result.result)"
        self.dismissIndicator()
    }
    
    func failedToProfile(_ message: String) {
        self.presentAlert(title: message)
    }
}


// MARK: 광고 배너
extension ProfileViewController {
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
        pageControl.pageIndicatorTintColor = .systemGray3
        pageControl.currentPageIndicatorTintColor = .black  // 현재 페이지
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
}

// 광고 collectionView 설정
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCollectionViewCell", for: indexPath) as! AdCollectionViewCell
        cell.setData(images[indexPath.row])
        return cell
    }
    
    // collectionView 스크롤 끝났을 때 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        // 가로 사이즈 = 300 일 경우,
        // 컨텐츠의 x위치 0/300 = 0 (0번째 페이지) | 1/300 = 1 (1번째 페이지) | 2/300 = 2 (2번째 페이지)
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}

// PageControl 설정
extension ProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        // 좌표 보정을 위해 절반의 너비 더해줌
        let x = scrollView.contentOffset.x + (width / 2)
        let newPage = Int(x / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
    // 아래로 당겨서 새로고침
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView.contentOffset.y < -200) {
            setupProfile()
            print("🌳 새로고침")
        }
    }
}

extension ProfileViewController {
    private func getScrapBookAPI() {
        self.showIndicator()
        print("✨ \(UserId.shared.userId)")
        self.scrapbookDataManager.getScrapBook(UserId.shared.userId, self)
    }
    func didSuccessScrapBook(_ result: ScrapBookResult) {
        ScrapBookId.shared.scrapbookId = result.scrapbookId
        ScrapIndex.shared.index = [result.allCount, result.mediaCount, result.homewarmingCount, result.knowhowCount]
        ScrapBook.shared.info = result
        self.dismissIndicator()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
        self.dismissIndicator()
    }
}
