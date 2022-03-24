//
//  MyPageTabManViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/20.
//

import UIKit

import Pageboy
import Tabman

class MyPageTabManViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    private let bar = TMBar.ButtonBar()
    
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupVCs()
        setupTabMan()
    }
    
    private func setupControllers() {
        self.tabBarController?.setupTabBarLine()
    }
    
    // MARK: 프로필 / 나의 쇼핑
    private func setupVCs() {
        let sb = UIStoryboard(name: "MyPage", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let vc2 = sb.instantiateViewController(withIdentifier: "MyShoppingViewController") as! MyShoppingViewController
        viewControllers = [vc1, vc2]
    }
    
    // MARK: TabMan
    private func setupTabMan() {
        self.dataSource = self
        
        let spacer = self.view.bounds.width
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: spacer / 5, bottom: 0, right: 0)
        bar.layout.interButtonSpacing = spacer / 3
        //bar.layout.contentMode = .fit   // view 크기에 맞게 나눔
        
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray
            button.selectedTintColor = .mainBlue
            button.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        }
        
        bar.indicator.weight = .custom(value: 3)
        bar.indicator.tintColor = .mainBlue
        
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
    
}

extension MyPageTabManViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "프로필")
        case 1:
            return TMBarItem(title: "나의 쇼핑")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

}
