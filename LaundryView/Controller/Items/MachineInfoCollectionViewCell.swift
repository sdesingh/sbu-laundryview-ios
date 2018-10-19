//
//  MachineInfoTableViewCell.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MachineInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var InfoContainer: UIView!
    @IBOutlet weak var CellContainer: UIView!
    @IBOutlet weak var MachineStatus: UILabel!
    @IBOutlet weak var MachineNumContainer: UIView!
    @IBOutlet weak var MachineNum: UILabel!
    @IBOutlet weak var MachineStatusIcon: UIView!
    
    var cellIndex: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        CellContainer.layer.cornerRadius = 10
        CellContainer.layer.shadowColor = UIColor.black.cgColor
        CellContainer.layer.shadowOpacity = 0.3
        CellContainer.layer.shadowRadius = 2
        CellContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        InfoContainer.layer.cornerRadius = InfoContainer.frame.size.height / 2
        InfoContainer.layer.shadowColor = UIColor.black.cgColor
        InfoContainer.layer.shadowOpacity = 0.2
        InfoContainer.layer.shadowRadius = 2
        InfoContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        MachineNumContainer.layer.cornerRadius = MachineNumContainer.frame.size.height / 2
        MachineNumContainer.layer.shadowColor = UIColor.black.cgColor
        MachineNumContainer.layer.shadowOpacity = 0.2
        MachineNumContainer.layer.shadowRadius = 2
        MachineNumContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        MachineStatusIcon.layer.cornerRadius = MachineStatusIcon.frame.size.height / 2
        MachineStatusIcon.layer.shadowColor = UIColor.black.cgColor
        MachineStatusIcon.layer.shadowOpacity = 0.3
        MachineStatusIcon.layer.shadowRadius = 2
        MachineStatusIcon.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        
        
    }
    
    


}
