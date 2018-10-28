//
//  ViewController.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tabView: UICollectionView!
    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var TabBar: TabBar!
    
    var cells: [LaundryTabCollectionViewCell] = [LaundryTabCollectionViewCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Adding Shadows
        Header.layer.shadowColor = UIColor.black.cgColor
        Header.layer.shadowOpacity = 0.10
        Header.layer.shadowRadius = 5
        Header.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        TabBar.layer.shadowColor = UIColor.black.cgColor
        TabBar.layer.shadowOpacity = 0.05
        TabBar.layer.shadowRadius = 4
        TabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
        
        tabView.isPagingEnabled = true
        
        if let flowLayout = tabView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
            flowLayout.scrollDirection = .horizontal
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMachineModal), name: NSNotification.Name(rawValue: BASE_NOTIFICATION_KEY + SHOW_MACHINE_MODAL), object: nil)
        
        
        
        DATA_MANAGER.getLaundryData()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        tabView?.setContentOffset(CGPoint.zero, animated: false)
        tabView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return { () -> UICollectionViewCell in

            let setupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabCell", for: indexPath) as! LaundryTabCollectionViewCell


            setupCell.setupCell(index: indexPath.row)

            return setupCell

            }()

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: tabView.frame.width, height: tabView.frame.height)
    }
    
    
    @IBAction func getData(_ sender: Any) {
        print("Getting laundry data...")
        DATA_MANAGER.getLaundryData()
        
    }
    
    @objc func showMachineModal(_ notification: Notification){
        let storyboard = UIStoryboard(name: "MachineInfoModal", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "MachineInfoModal") as! MachineInfoModal
        secondViewController.index = notification.userInfo?["index"] as! Int
        self.present(secondViewController, animated: true, completion: nil)
    }
    
}

