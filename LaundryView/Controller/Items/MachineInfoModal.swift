//
//  MachineInfoModal.swift
//  LaundryView
//
//  Created by Sam Singh on 8/29/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class MachineInfoModal: UIViewController {

    @IBOutlet weak var menuBG: UIView!
    @IBOutlet weak var machineNumberContainer: UIView!
    @IBOutlet weak var machineTypeContainer: UIView!
    @IBOutlet weak var machineStatusContainer: UIView!
    @IBOutlet weak var FavoriteButton: UIView!
    
    
    
    override func viewDidLoad() {
        initializeViews()
    }
    
    func initializeViews(){
        machineTypeContainer.layer.cornerRadius = machineTypeContainer.frame.height / 2
        machineNumberContainer.layer.cornerRadius = machineTypeContainer.frame.height / 2
        FavoriteButton.layer.cornerRadius = machineTypeContainer.frame.height / 2
        machineStatusContainer.layer.cornerRadius = 10
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.hideMenu))
        menuBG.addGestureRecognizer(gesture)
    }
    
    func showMenu() {
        
    }
    
    @objc func hideMenu(){
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
