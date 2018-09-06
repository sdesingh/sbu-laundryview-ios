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
    
    var cells: [LaundryTabCollectionViewCell] = [LaundryTabCollectionViewCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabView.isPagingEnabled = true
        
        if let flowLayout = tabView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }

        
//        tabView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .init(rawValue: 0), animated: false)
        
        DATA_MANAGER.getLaundryData()
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
    
}

