//
//  FollowViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/27.
//

import UIKit

class FollowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didSuccessFollow(_ result: FollowResponse) {
        self.presentAlert(title: "팔로우가 요청되었습니다.")
    }
    
    func failedToRequestFollow(_ message: String) {
        self.presentAlert(title: message)
    }
    
}
