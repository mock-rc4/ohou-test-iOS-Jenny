//
//  HomeTabManViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

import Pageboy
import Tabman

class HomeTabManViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    private let bar = TMBar.ButtonBar()
    
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        setupTabMan()
    }
    
    // MARK: 상단바
    private func setupVCs() {
        viewControllers = [TopViewController(), FollowingViewController(), PhotoViewController(), HousewarmingViewController(), KnowHowViewController(), UIViewController(), QnAViewController()]
    }
    
    
    private func setupTabMan() {
        self.dataSource = self
        
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        
        bar.buttons.customize { (button) in
            button.tintColor = .darkGray
            button.selectedTintColor = .mainBlue
            button.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        }
        
        bar.indicator.weight = .custom(value: 3)
        bar.indicator.tintColor = .mainBlue
        
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
    
}

extension HomeTabManViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "인기")
        case 1:
            return TMBarItem(title: "팔로잉")
        case 2:
            return TMBarItem(title: "사진")
        case 3:
            return TMBarItem(title: "집들이")
        case 4:
            return TMBarItem(title: "노하우")
        case 5:
            return TMBarItem(title: "전문가집들이")
        case 6:
            return TMBarItem(title: "질문과답변")
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
        return .at(index: TabManIndex.shared.index)
    }
    
}
