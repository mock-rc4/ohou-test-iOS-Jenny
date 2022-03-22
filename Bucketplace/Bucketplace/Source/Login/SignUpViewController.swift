//
//  SignUpViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import UIKit

// MARK: 이메일로 가입
class SignUpViewController: UIViewController {
    
    lazy var dataManager: SignUpDataManager = SignUpDataManager()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    var agreeList: [Bool] = [false, false, false, false]
    var allAgree: Bool = false  // 하위 항목 다 누르면 전체동의 되도록
    var signInFlag: Bool = false    // 필수 세가지 항목 다 눌러야 약관 동의 가능
    
    @IBOutlet weak var agreeView: UIView!
    @IBOutlet weak var agreeTitleView: UIView!
    
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    
    var btns: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValues()
        setupDisplay()
    }
    
    // MARK: 값들 초기화
    private func setupValues() {
        btns = [allBtn, firstBtn, secondBtn, thirdBtn, fourthBtn]
    }
    
    // MARK: 회원가입 완료 버튼
    @IBAction func signupBtnClick(_ sender: Any) {
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
        
        // 별명 존재 여부
        guard let nickname = nicknameTextField.text, nickname.isExists else {
            self.presentAlert(title: "별명을 입력해주세요")
            return
        }
        
        if signInFlag == false {
            self.presentAlert(title: "필수 약관에 동의해주세요")
        }
        
        // 회원가입 요청
        self.dismissKeyboard()
        self.showIndicator()
        let input = SignUpRequest(email: email, password: password, nickname: nickname)
        dataManager.postSignUp(input, delegate: self)
    }
    
    // MARK: 약관 동의
    @IBAction func allBtnClick(_ sender: UIButton) {
        checkAll(sender)
    }
    
    @IBAction func firstBtnClick(_ sender: UIButton) {
        checkBox(sender)
    }
    
    @IBAction func secondBtnClick(_ sender: UIButton) {
        checkBox(sender)
    }
    
    @IBAction func thirdBtnClick(_ sender: UIButton) {
        checkBox(sender)
    }
    
    @IBAction func fourthBtnClick(_ sender: UIButton) {
        checkBox(sender)
    }
    
    private func checkAll(_ btn: UIButton) {
        if(btn.isSelected) {
            agreeList = [false, false, false, false]
            signInFlag = false
            for btn in btns {
                noCheck(btn)
            }
        } else {
            agreeList = [true, true, true, true]
            signInFlag = true
            for btn in btns {
                check(btn)
            }
        }
    }
    
    private func checkBox(_ btn: UIButton) {
        if(btn.isSelected) {
            agreeList[btn.tag - 1] = false
            if btn.tag != 4 {
                signInFlag = false
            }
            allAgree = agreeList.allSatisfy { $0 }
            if allAgree == false {
                noCheck(allBtn)
            }
            noCheck(btn)
        } else {
            agreeList[btn.tag - 1] = true
            allAgree = agreeList.allSatisfy { $0 }
            if allAgree == true {
                check(allBtn)
            }
            check(btn)
        }
        if (agreeList[0] == true && agreeList[1] == true && agreeList[2] == true) {
            signInFlag = true
        }
    }
    
    // 체크 해제
    private func noCheck(_ btn: UIButton) {
        btn.setImage(UIImage(systemName: "square"), for: .normal)
        btn.tintColor = .lightGray
        btn.isSelected = false
    }
    
    // 체크
    private func check(_ btn: UIButton) {
        btn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        btn.tintColor = .mainBlue
        btn.isSelected = true
    }
    
    // MARK: 커스텀
    private func setupDisplay() {
        agreeTitleView.layer.borderColor = UIColor.lightGray.cgColor
        agreeTitleView.layer.borderWidth = 0.5
        agreeView.layer.borderColor = UIColor.lightGray.cgColor
        agreeView.layer.borderWidth = 0.5
    }
    
}


extension SignUpViewController {
    func didSuccessSignUp() {
        self.presentAlert(title: "회원가입이 완료되었습니다.")
    }
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
