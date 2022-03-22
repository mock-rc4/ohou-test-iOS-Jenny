//
//  SignUpViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/22.
//

import UIKit

// MARK: 이메일로 가입
class SignUpViewController: UIViewController {
    
    var agreeList: [Bool] = [false, false, false, false]
    var allAgree:Bool = false
    
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
    
    private func setupValues() {
        btns = [allBtn, firstBtn, secondBtn, thirdBtn, fourthBtn]
    }
    
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
            for btn in btns {
                noCheck(btn)
            }
        } else {
            agreeList = [true, true, true, true]
            for btn in btns {
                check(btn)
            }
        }
    }
    
    private func checkBox(_ btn: UIButton) {
        if(btn.isSelected) {
            agreeList[btn.tag - 1] = false
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
    
    private func setupDisplay() {
        agreeTitleView.layer.borderColor = UIColor.lightGray.cgColor
        agreeTitleView.layer.borderWidth = 0.5
        agreeView.layer.borderColor = UIColor.lightGray.cgColor
        agreeView.layer.borderWidth = 0.5
    }
    
}
