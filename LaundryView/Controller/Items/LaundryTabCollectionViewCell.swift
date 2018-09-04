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
            
            case 0:
                contentView.frame = self.bounds
                let newView = MachineTab(frame: contentView.frame, type: .Washer)
                newView.updateViewsData()
//                newView.backgroundColor = .red
                
                contentView.addSubview(newView)
            
            case 2:
                contentView.frame = self.bounds
                let view = MachineTab(frame: contentView.frame, type: .Dryer)
                view.updateViewsData()
//                newView.backgroundColor = .green
                
                contentView.addSubview(view)
            

            case 1:
                contentView.frame = self.bounds
                let newView = MainTab(frame: contentView.frame)
                
                contentView.addSubview(newView)
            
            default: return
        }
        
        
    }
    
}
