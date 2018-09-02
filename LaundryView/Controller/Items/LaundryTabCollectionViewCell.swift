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
    
    func setupCell(index: Int){
        
        switch(index){
        case 1:
//            print(frame)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            let newView = MainTab(frame: contentView.frame)

            
            contentView.addSubview(newView)
//            self.contentView.layer.borderWidth = 5
//            self.contentView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
//            contentView.backgroundColor = UIColor.red
        default: return
        }
        
        
    }
    
}
