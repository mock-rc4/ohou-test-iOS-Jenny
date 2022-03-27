//
//  PhotoDetailViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import UIKit

class PhotoDetailViewController: FollowViewController {

    lazy var photoDetailDataManager = PhotoDetailDataManager()
    lazy var feedUserDataManager = FeedUserDataManager()
    lazy var followDataManager = FollowDataManager()
    let feedId = FeedId.shared.feedId
    var userId = UserId.shared.userId
    var followFlag: Int = 0
    
    @IBOutlet weak var homeType: UILabel!
    @IBOutlet weak var thumailImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "KeywordsCollectionViewCell"
    var keywordsCount: Int!
    var keywords: [Keyword]!
    
    @IBOutlet weak var feedUserImg: UIImageView!
    @IBOutlet weak var feedUserName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeedUserAPI()
        getPhotoDetailAPI()
    }
    
    @IBAction func followBtnClick(_ sender: Any) {
        let followId = userId
        if followFlag == 0 {
        self.followDataManager.postFollow(FollowRequest(userId: followId), self)
            followBtn.setTitle("팔로잉", for: .normal)
            followBtn.backgroundColor = .lightGray
            followFlag = 1
        } else {
            self.followDataManager.unFollow(FollowRequest(userId: followId), self)
            followBtn.setTitle("팔로우", for: .normal)
            followBtn.backgroundColor = .mainBlue
            followFlag = 0
        }
    }
    
}

// MARK: 피드 유저 API 조회
extension PhotoDetailViewController {
    private func getFeedUserAPI() {
        self.showIndicator()
        self.feedUserDataManager.getFeedUser(feedId, self)
    }
    func didSuccessFeedUser(_ result: FeedUserResponse) {
        userId = result.result.userId
        followFlag = result.result.isFollowed
        print("📎\(userId)")
        if followFlag == 1 {
            followBtn.setTitle("팔로잉", for: .normal)
            followBtn.backgroundColor = .lightGray
        }
        Functions.shared.urlToImg(result.result.profileImageUrl, feedUserImg)
        let url = URL(string: result.result.profileImageUrl)
        let data = try? Data(contentsOf: url!)
        feedUserImg.image = UIImage(data: data!)
        feedUserName.text = result.result.nickname
        time.text = result.result.uploadedAt
        self.dismissIndicator()
    }
    
    func failedToRequestFeedUser(_ message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}

// MARK: 사진 상세 페이지 API 조회
extension PhotoDetailViewController {
    private func getPhotoDetailAPI() {
        self.showIndicator()
        self.photoDetailDataManager.getPhotoDetail(feedId, self)
    }
    func didSuccessPhotoDetail(_ result: PhotoDetailResponse) {
        let photoDetailInfo = result.result.medias[0].media
        print(photoDetailInfo)
        Functions.shared.urlToImg(photoDetailInfo.thumbnailUrl, thumailImg)
        let type = photoDetailInfo.mediaSpaceTypeId
        homeType.text = Functions.shared.homeType(type)
        descriptionLabel.text = photoDetailInfo.description
        
        self.keywordsCount = result.result.medias[0].keywords.count
        self.keywords = result.result.medias[0].keywords
        self.dismissIndicator()
        setupCollectionView()
    }
    
    func failedToRequest(_ message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}

// MARK: 키워드 collectionView 생성
extension PhotoDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.keywordsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! KeywordsCollectionViewCell
        print("⭐️\(self.keywords[indexPath.row].name)⭐️")
        cell.setData(self.keywords[indexPath.row].name)
        return cell
    }
}

extension PhotoDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = self.keywords[indexPath.row].name.count
        if size > 3 { size *= 23 }
        else { size *= 32 }
        return CGSize(width: size , height: 30)
    }
}
