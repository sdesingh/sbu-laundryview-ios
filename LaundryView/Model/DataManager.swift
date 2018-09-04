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
    
    func updateData(data: LaundryRoom) {
        self.laundryRoom = data
    }
    
    func getLaundryData(){
        
        api.getData(callback: {
            
            (jsonData: [String:Any]) in
            
            self.laundryRoom = self.api.parseData(jsonData: jsonData)
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: BASE_NOTIFICATION_KEY + DATA_RETRIEVED_SUCCESS), object: nil)
            }
            
        })
        
    }
    
    
    
}
