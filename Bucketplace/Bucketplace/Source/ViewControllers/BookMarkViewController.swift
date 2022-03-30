//
//  BookMarkViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class BookMarkViewController: UIViewController {
    
    var timer: Timer!
    var timerCnt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDisplay()
        startTimer()
    }
    
    private func setupDisplay() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        self.view.isOpaque = false
    }
    
    // 자동으로 사라지게
    private func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            self.dismiss(animated: true)
        }
    }
    
}
