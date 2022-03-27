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
    
    open func homeType(_ num: Int) -> String {
        switch num {
        case 1:
            return "원룸&오피스텔"
        case 2:
            return "아파트"
        case 3:
            return "빌라&연립"
        case 4:
            return "단독주택"
        case 5:
            return "사무공간"
        case 6:
            return "상업공간"
        default:
            return "기타"
        }
    }
    
}
