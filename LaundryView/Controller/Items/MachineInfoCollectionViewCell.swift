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
    @IBOutlet weak var TimeRemaining: UILabel!
    @IBOutlet weak var MachineNumContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        CellContainer.layer.cornerRadius = 10
        InfoContainer.layer.cornerRadius = InfoContainer.frame.size.height / 2
        MachineNumContainer.layer.cornerRadius = MachineNumContainer.frame.size.height / 2
        
    }
    
    


}
