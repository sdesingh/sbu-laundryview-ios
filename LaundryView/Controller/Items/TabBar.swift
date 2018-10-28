//
//  TabBar.swift
//  LaundryView
//
//  Created by Sam Singh on 8/22/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class TabBar: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var WasherButton: UIButton!
    @IBOutlet weak var HomeButton: UIButton!
    @IBOutlet weak var DryerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeViews()
    }
    
    
    private func initializeViews(){
        
        Bundle.main.loadNibNamed("TabBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
    }
}
