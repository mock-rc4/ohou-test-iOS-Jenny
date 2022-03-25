//
//  LoginViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/20.
//

import UIKit

import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    lazy var dataManager: KakaoDataManager = KakaoDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goMainBtnClick(_ sender: Any) {
        self.dismiss(animated: true)
        Constant.firstFlag = false
    }
    
    @IBAction func kakaoBtnClick(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인 -> API 호출 결과를 클로저로 전달
            loginWithApp()
        } else {
            // 카카오톡 깔려있지 않을 경우, 웹 브라우저로 카카오 로그인
            loginWithWeb()
        }
    }
    
    
    // MARK: 토큰 존재 여부 확인
    // AppDelegate.swift에서 앱 실행시, 첫 화면의 분기처리 위해 사용가능
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 유효한 토큰 검사
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (accessTokenInfo , error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        print(error)
                    }
                    else {
                        print(error)
                    }
                }
                else {
                    print("🟨 토큰 유효성 체크 성공")
                    // ✅ 사용자 정보를 가져오고 화면전환을 하는 커스텀 메서드
                    self.getUserInfo()
                }
            }
        }
        else {
            print("❌ 로그인 필요")
        }
    }
    
    
}



// MARK: 로그인
extension LoginViewController {
    // MARK: 카카오톡 앱으로 로그인
    private func loginWithApp() {
        UserApi.shared.loginWithKakaoTalk { (oauthToken , error) in
            if let error = error {
                print(error)
            } else {
                print("🟨 로그인 성공")
                self.getUserInfo()
            }
        }
    }
    
    // MARK: 카카오톡 웹으로 로그인
    private func loginWithWeb() {
        UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
            if let error = error {
                print(error)
            } else {
                print("🟨 로그인 성공")
                self.dataManager.getKakaoLogin(oauthToken?.accessToken ?? "")
                //print(oauthToken?.accessToken)
                self.getUserInfo()
                self.dismiss(animated: false)
            }
        }
    }
    
}


extension LoginViewController {
    private func getAccessTokenInfo() {
        
    }
}

// MARK: 사용자 정보 가져오기
extension LoginViewController {
    private func getUserInfo() {
        UserApi.shared.me {(user, error) in
            if let error = error {
                print(error)
            } else {
                let nickname = user?.kakaoAccount?.profile?.nickname
                let email = user?.kakaoAccount?.email
                print("🟨 사용자 정보: \(nickname ?? "") \(email ?? "")")
            }
        }
    }
}
