//
//  UITextField.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/31.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
      }
    
    func addleftimage(image: UIImage) {
        let leftimage = UIImageView(frame: CGRect(x: 10, y: 0, width: image.size.width, height: image.size.height))
        leftimage.contentMode = .scaleAspectFit
        leftimage.tintColor = .lightGray
        leftimage.image = image
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width+10, height: image.size.height))
        view.addSubview(leftimage)
        self.leftViewMode = .always
        self.leftView = view
    }
    
    
}
