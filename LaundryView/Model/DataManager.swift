//
//  DataManager.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import Foundation

class DataManager {
    
    var laundryRoom: LaundryRoom?
    let api: API = API()
    
    init(quadName: String, roomName: String) {
        
    }
    
    func updateData(data: LaundryRoom) {
        self.laundryRoom = data
    }
    
    func getLaundryData(){
        
        api.getLaundryData(callback: {
            
            (jsonData: [String:Any]) in
            
            self.laundryRoom = self.api.parseData(jsonData: jsonData)
            
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: NOTIFICATION_KEY), object: nil)
            }
            
            
            
            
        })
        
    }
    
    
    
}
