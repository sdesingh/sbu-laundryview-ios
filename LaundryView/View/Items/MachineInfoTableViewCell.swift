//
//  MachineInfoTableViewCell.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MachineInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var InfoContainer: UIView!
    @IBOutlet weak var CellContainer: UIView!
    @IBOutlet weak var TimeRemaining: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
