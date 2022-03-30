//
//  OptionSelectViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class OptionSelectViewController: UIViewController {
    
    lazy var orderDataManager = OrderDataManager()

    var cnt = 1
    var total = Buy.shared.price
    
    @IBOutlet weak var option: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDisplay()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.view.isOpaque = false
    }

    @IBAction func minus(_ sender: Any) {
        if (cnt >= 2) {
            cnt -= 1
            total -= Buy.shared.price
            count.text = "\(cnt)"
            price.text = String(total).insertComma + "원"
            totalLabel.text = String(total).insertComma + "원"
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        cnt += 1
        total += Buy.shared.price
        count.text = "\(cnt)"
        price.text = String(total).insertComma + "원"
        totalLabel.text = String(total).insertComma + "원"
    }
    
    private func setupDisplay() {
        option.text = Buy.shared.option
        price.text = String(Buy.shared.price).insertComma + "원"
        
    }
    
    // 장바구니
    @IBAction func cartBtnClick(_ sender: Any) {
        print("🛺 장바구니")
    }
    
    // 구매하기
    @IBAction func buyBtnClick(_ sender: Any) {
        postOrderAPI()
        print("🛺 구매하기")
    }
}

extension OptionSelectViewController {
    func postOrderAPI() {
        self.orderDataManager.postOrder(self)
    }
    func didSuccessOrder(_ result: OrderResult){
        self.presentVCAlert(title: "\(result.orderId)번 상품 구매완료", sb: "MyPage", vc: "BuyDetailViewController")
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
    }
}
