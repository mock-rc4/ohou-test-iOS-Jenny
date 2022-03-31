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
        print("📲 \(url) \(data)")
        //img.image = UIImage()
        img.image = UIImage(data: data!)
    }
    
    open func homeType(_ photo: Int, _ media: Int,_ home: Int,
                       _ knowhow: Int) -> String {
        if (photo == 1 || media == 1) {
            return "   사진   "
        } else if home == 1 {
            return "   집들이   "
        } else if knowhow == 1 {
            return "   노하우   "
        } else {
            return "   기타   "
        }
    }
    
}
