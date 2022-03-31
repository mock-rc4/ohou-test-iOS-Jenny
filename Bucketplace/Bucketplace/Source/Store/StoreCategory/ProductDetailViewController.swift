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
        setupRightItems()
    }
    
    private func setupRightItems() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        let searchBtn = makeBtn("nv_search")
        let cartBtn = makeBtn("nv_cart")
        // 공백 만들기
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 12
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartBtn), spacer, UIBarButtonItem(customView: searchBtn)]
    }
    
    @IBAction func buyBtnClick(_ sender: Any) {
        let vc = UIStoryboard(name: "Buy", bundle: nil).instantiateViewController(withIdentifier: "BuyViewController")
        vc.hidesBottomBarWhenPushed = true
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
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
