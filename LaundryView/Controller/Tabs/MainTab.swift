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
    
    @IBOutlet weak var washerStatusIcon: UIView!
    @IBOutlet weak var dryerStatusIcon: UIView!
    @IBOutlet weak var washersAvailable_Lbl: UILabel!
    @IBOutlet weak var dryersAvailable_Lbl: UILabel!
    
    var laundryData: LaundryRoom?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeViews()
    }

    private func initializeViews(){
        Bundle.main.loadNibNamed("MainTab", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib.init(nibName: "MachineInfoCell", bundle: nil), forCellWithReuseIdentifier: "infoCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewsWithData), name: NSNotification.Name(rawValue: BASE_NOTIFICATION_KEY + DATA_RETRIEVED_SUCCESS), object: nil)
    }
    
    
    @objc func updateViewsWithData(){

        laundryData = DATA_MANAGER.laundryRoom!
        
        let red = "#D84556"
        let green = "#42D879"
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        let dryersAvailable = laundryData?.dryersAvailable
        let washersAvailable = laundryData?.washersAvailable
        
        if(dryersAvailable != 0){
            dryerStatusIcon.backgroundColor = Utilities.hexStringToUIColor(hex: green)
            dryersAvailable_Lbl.text = "\(Utilities.integerToString(number: dryersAvailable!)) available."
        }else {
            dryerStatusIcon.backgroundColor = Utilities.hexStringToUIColor(hex: red)
            dryersAvailable_Lbl.text = "None."
        }
        
        if(washersAvailable != 0){
            washerStatusIcon.backgroundColor = Utilities.hexStringToUIColor(hex: green)
            washersAvailable_Lbl.text = "\(Utilities.integerToString(number: washersAvailable!)) available."
        }else {
            washerStatusIcon.backgroundColor = Utilities.hexStringToUIColor(hex: red)
            washersAvailable_Lbl.text = "None."
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
        let cellSize = (contentView.frame.size.width / 2) - 35
        
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! MachineInfoCollectionViewCell
        
        if let machine = laundryData?.machines[indexPath.row] {
            
            cell.updateCellData(machine: machine)
            
        }else {
            // Do nothing
        }
    
        return cell
        
    }
    
    
    
}
