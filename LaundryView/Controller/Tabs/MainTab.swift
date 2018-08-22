//
//  MainTab.swift
//  LaundryView
//
//  Created by Sam Singh on 8/17/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MainTab: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }
    
    
    private func initializeView(){
        Bundle.main.loadNibNamed("MainTab", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.collectionView.register(UINib.init(nibName: "MachineInfoCell", bundle: nil), forCellWithReuseIdentifier: "infoCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (contentView.frame.size.width / 2) - 30
        
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! MachineInfoCollectionViewCell
        
        return cell
    }
    
    
    
}
