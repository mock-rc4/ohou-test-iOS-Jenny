//
//  ScrapBookTabManViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

import Pageboy
import Tabman

class ScrapBookTabManViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    private let bar = TMBar.ButtonBar()
    private var viewControllers: [UIViewController] = []
    
    var nums: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupVCs()
        setupTabMan()
    }
    
    private func setupControllers() {
        self.tabBarController?.setupTabBarLine()
    }

    private func setupVCs() {
        nums = ScrapIndex.shared.index
        viewControllers = [AllScrapViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController()]
    }
    
    private func setupTabMan() {
        self.dataSource = self
        
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        bar.layout.interButtonSpacing = 35
        
        bar.buttons.customize { (button) in
            button.tintColor = .darkGray
            button.selectedTintColor = .mainBlue
            button.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        }
        
        bar.indicator.weight = .custom(value: 3)
        bar.indicator.tintColor = .mainBlue
        
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
    
}

extension ScrapBookTabManViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "모두(\(nums[0]))")
        case 1:
            return TMBarItem(title: "폴더")
        case 2:
            return TMBarItem(title: "사진(\(nums[1]))")
        case 3:
            return TMBarItem(title: "집들이(\(nums[2]))")
        case 4:
            return TMBarItem(title: "노하우(\(nums[3]))")
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
