//
//  LaundryTabCollectionViewCell.swift
//  LaundryView
//
//  Created by Sam Singh on 8/31/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class LaundryTabCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(index: Int) {
        
        switch(index){
        case 1:
            contentView.addSubview(MainTab.init(frame: contentView.frame))
            contentView.backgroundColor = UIColor.red
        default: return
        }
        
        
    }
    
}
