//
//  MachineInfoModal.swift
//  LaundryView
//
//  Created by Sam Singh on 8/29/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MachineInfoModal: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var currentStatus: UILabel!
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var machineNumber: UILabel!
    @IBOutlet weak var machineType: UILabel!
    @IBOutlet weak var machineTypeContainer: UIView!
    @IBOutlet weak var machineNumberContainer: UIView!
    @IBOutlet weak var machineStatusContainer: UIView!
    @IBOutlet weak var menuBG: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeViews()
    }
    
    func initializeViews(){
        machineTypeContainer.layer.cornerRadius = 5
        machineNumberContainer.layer.cornerRadius = 5
        machineStatusContainer.layer.cornerRadius = 5
    }
    
    func showMenu() {
        
    }
    
    func hideMenu(){
        
    }
    

    
}
