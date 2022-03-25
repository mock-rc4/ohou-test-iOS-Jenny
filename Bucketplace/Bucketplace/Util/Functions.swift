//
//  Functions.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/25.
//

import UIKit

open class Functions: UIViewController {
    static let shared = Functions()
    
    // MARK: url 이미지 바꾸는 함수
    open func urlToImg(_ urlImg: String, _ img: UIImageView) {
        let url = URL(string: urlImg)
        let data = try? Data(contentsOf: url!)
        img.image = UIImage(data: data!)
    }
    
}
