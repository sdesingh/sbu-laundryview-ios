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
    
    var laundryData: LaundryRoom?
    
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
        
        initializeListeners()
        
    }
    
    func initializeListeners() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewsWithData), name: NSNotification.Name(rawValue: NOTIFICATION_KEY), object: nil)
        
        
    }
    
    @objc func updateViewsWithData(){
        print("Updating data!")
        laundryData = dataManager.laundryRoom!
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfMachines: Int = 0
        
        if(laundryData != nil){
            print("Not nil!")
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
        cell.MachineNum.text = "\(indexPath.row + 1)"
        
        if let machines = laundryData?.machines {
            
            cell.MachineStatus.text = "\(machines[indexPath.row].currentStatus)"
            
        }
        
        
        return cell
    }
    
    
    
}
