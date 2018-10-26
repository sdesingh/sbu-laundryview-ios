//
//  WasherTab.swift
//  LaundryView
//
//  Created by Sam Singh on 8/22/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MachineTab: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var machineType: UILabel!
    
    var machineData: [Machine]?
    var gridType: Machine.MachineType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeViews()
    }
    
    init(frame: CGRect, type: Machine.MachineType) {
        super.init(frame: frame)
        self.gridType = type
        initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initializeViews()
    }
    
    
    func initializeViews(){
        
        Bundle.main.loadNibNamed("MachineTab", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.register(UINib.init(nibName: "MachineInfoCell", bundle: nil), forCellWithReuseIdentifier: "machineCell")
        
        if(gridType == .Washer){
            machineType.text = "Washers"
        }else {
            machineType.text = "Dryers"
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewsData), name: NSNotification.Name(rawValue: BASE_NOTIFICATION_KEY + DATA_RETRIEVED_SUCCESS), object: nil)
        
    }
    
    @objc func updateViewsData() {
        machineData = DATA_MANAGER.laundryRoom?.getMachinesOfType(type: gridType!)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "machineCell", for: indexPath) as! MachineInfoCollectionViewCell
        
        if let machine = machineData?[indexPath.row] {
           
            cell.updateCellData(machine: machine)
           
            
        }else {
            // Do nothing
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number_of_machines = machineData?.count {
            return number_of_machines
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (self.contentView.frame.size.width / 2) - 15
        
        return CGSize(width: cellSize, height: cellSize)
    }
    

}
