//
//  KnowHowViewController.swift
//  Bucketplace
//
//  Created by 김영인 on 2022/03/21.
//

import UIKit

class KnowHowViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let CELL = "KnowHowCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    @IBAction func btn1Click(_ btn: UIButton) {
        btnClick(btn)
    }
    @IBAction func btn2Click(_ btn: UIButton) {
        btnClick(btn)
    }
    @IBAction func btn3Click(_ btn: UIButton) {
        btnClick(btn)
    }
    
    private func btnClick(_ btn: UIButton) {
        if(btn.isSelected) {
            btn.isSelected = false
            btn.backgroundColor = .systemGray6
        } else {
            btn.isSelected = true
            btn.backgroundColor = .mainBlue.withAlphaComponent(0.5)
        }
    }
}

extension KnowHowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CELL, bundle: nil), forCellWithReuseIdentifier: CELL)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! KnowHowCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 140)
    }
}
