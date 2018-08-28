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
    
    func getLaundryData() -> LaundryRoom{
        
        if let laundryData = laundryRoom {
            return laundryData
        }else {
            return LaundryRoom(quadName: "No Internet", roomName: "Try Again", totalWashers: 0, totalDryers: 0)
        }
        
    }
    
    
    
}
