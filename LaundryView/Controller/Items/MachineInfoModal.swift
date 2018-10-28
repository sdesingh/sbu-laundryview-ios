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
    @IBOutlet weak var FavoriteButtonImage: UIImageView!
    @IBOutlet weak var NotifyButton: UIView!
    @IBOutlet weak var NotifyButtonImage: UIImageView!
    
    @IBOutlet weak var StatusText: UILabel!
    @IBOutlet weak var MachineIDText: UILabel!
    @IBOutlet weak var MachineTypeText: UILabel!
    
    var index = 0
    
    override func viewDidLoad() {
        initializeViews()
    }
    
    func initializeViews(){
        
        machineTypeContainer.layer.cornerRadius = machineTypeContainer.frame.height / 2
        machineNumberContainer.layer.cornerRadius = machineTypeContainer.frame.height / 2
        FavoriteButton.layer.cornerRadius = machineTypeContainer.frame.height / 2
        NotifyButton.layer.cornerRadius = NotifyButton.frame.height / 2
        machineStatusContainer.layer.cornerRadius = 10
        
        // Changing the colors of the two images for state disabled.
        NotifyButtonImage.image = NotifyButtonImage.image!.withRenderingMode(.alwaysTemplate)
        NotifyButtonImage.tintColor = Utilities.hexStringToUIColor(hex: Colors.STATE_DISABLED.rawValue)
        FavoriteButtonImage.image = FavoriteButtonImage.image!.withRenderingMode(.alwaysTemplate)
        FavoriteButtonImage.tintColor = Utilities.hexStringToUIColor(hex: Colors.STATE_DISABLED.rawValue)
        
        if let machine = DATA_MANAGER.laundryRoom?.machines[index] {
            
            StatusText.text = machine.currentStatus.rawValue
            MachineTypeText.text = machine.machineType.rawValue
            MachineIDText.text = "\(machine.machineID)"
            
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.hideMenu))
        menuBG.addGestureRecognizer(gesture)
    }
    

    @objc func hideMenu(){
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
