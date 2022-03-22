//
//  SignInViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import UIKit

// MARK: 이메일로 로그인
class SignInViewController: UIViewController {
    
    lazy var dataManager: SignInDataManager = SignInDataManager()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: 로그인 완료 버튼
    @IBAction func loginBtnClick(_ sender: Any) {
        // 이메일 존재 여부
        guard let email = emailTextField.text?.trim, email.isExists else {
            self.presentAlert(title: "이메일을 입력해주세요")
            return
        }
        
        // 비밀번호 존재 여부
        guard let password = pwTextField.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        // 로그인 요청
        self.dismissKeyboard()
        self.showIndicator()
        let input = SignInRequest(email: email, password: password)
        dataManager.postSignUp(input, delegate: self)
    }
    
}

extension SignInViewController {
    func didSuccessSignUp() {
        self.presentAlert(title: "로그인이 완료되었습니다.")
    }
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
