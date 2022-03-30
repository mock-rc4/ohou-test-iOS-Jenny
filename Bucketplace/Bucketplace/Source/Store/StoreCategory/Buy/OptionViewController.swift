//
//  OptionViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/30.
//

import UIKit

class OptionViewController: UIViewController {

    lazy var optionDataManager = ProductDataManager()
    var optionModel: [ColorOption]!
    var prices = [19500, 20500, 18000]
    
    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "OptionCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getOptionAPI()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.view.isOpaque = false
    }
}

// MARK: API 호출
extension OptionViewController {
    private func getOptionAPI() {
        self.optionDataManager.getOption(9, self)
    }
    func didSuccessOption(_ result: OptionResult) {
        optionModel = result.colorOptions
        setupCollectionView()
    }
    func failedToRequest(_ message: String) {
        self.presentAlert(title: message)
    }
}

extension OptionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! OptionCollectionViewCell
        cell.setData(optionModel[indexPath.row].color, prices[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Buy.shared.option = optionModel[indexPath.row].color
        Buy.shared.price = prices[indexPath.row]
        Buy.shared.optionId = optionModel[indexPath.row].optionId
        let vc = UIStoryboard(name: "Buy", bundle: nil).instantiateViewController(withIdentifier: "OptionSelectViewController")
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 60)
    }
}

