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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabView.isPagingEnabled = true
        
        if let flowLayout = tabView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabCell", for: indexPath) as! LaundryTabCollectionViewCell
        
        let colors: [UIColor] = [.blue, .red, .green]
        
        
        cell.backgroundColor = colors[indexPath.row]
        cell.setupCell(index: indexPath.row)
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: view.frame.width, height: view.frame.height)
    }
    
    
    
    @IBAction func getData(_ sender: Any) {
        print("Getting laundry data...")
        dataManager.getLaundryData()
        
    }
    
}

