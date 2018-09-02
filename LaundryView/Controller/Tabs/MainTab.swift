//
//  MainTab.swift
//  LaundryView
//
//  Created by Sam Singh on 8/17/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MainTab: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var laundryData: LaundryRoom?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeView()
        initializeListeners()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
        initializeListeners()
    }

    private func initializeView(){
        Bundle.main.loadNibNamed("MainTab", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib.init(nibName: "MachineInfoCell", bundle: nil), forCellWithReuseIdentifier: "infoCell")
        
    }
    
    func initializeListeners() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewsWithData), name: NSNotification.Name(rawValue: NOTIFICATION_KEY), object: nil)
        
    }
    
    @objc func updateViewsWithData(){

        laundryData = dataManager.laundryRoom!
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfMachines: Int = 0
        
        if(laundryData != nil){
            numberOfMachines = (laundryData?.machines.count)!
        }
        
        return numberOfMachines
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (contentView.frame.size.width / 2) - 30
        
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! MachineInfoCollectionViewCell
        
        if let machine = laundryData?.machines[indexPath.row] {
            cell.MachineNum.text = "\(indexPath.row + 1)"
            
            cell.MachineStatus.text = "\(machine.currentStatus.rawValue)"
            
        }else {
            // Do nothing
        }
    
        return cell
        
    }
    
    
    
}
