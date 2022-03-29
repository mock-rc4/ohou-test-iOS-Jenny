//
//  ProductDetailViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/28.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    lazy var productDataManager = ProductDataManager()
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var review: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var beforePrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var brandHome: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductAPI()
    }
    
    @IBAction func buyBtnClick(_ sender: Any) {
        let vc = BuyViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}

extension ProductDetailViewController {
    private func getProductAPI() {
        self.showIndicator()
        self.productDataManager.getProduct(ProductId.shared.productId, self)
    }
    func didSuccessProduct(_ result: ProductResult) {
        let info = result.detailProductInfoResList
        category.text = info.category
        image.image = UIImage(named: info.brand)
        brand.text = info.brand
        brandHome.text = info.brand
        productName.text = info.name
        review.text = "리뷰 \(String(info.reviewCount).insertComma)"
        beforePrice.text = "\(String(info.price).insertComma)"
        let calculatePrice = info.price * (100 - info.discountRate) / 100
        price.text = String(calculatePrice).insertComma
        point.text = "\(info.point)P"
        content.text = info.description
        self.dismissIndicator()
    }
    func failedToRequestProduct(_ messsage: String) {
        self.dismissIndicator()
        self.presentAlert(title: messsage)
    }
}