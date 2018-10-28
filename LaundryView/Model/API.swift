//
//  API.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import Foundation

class API {
    
    func retrieveData(apiURL: URL, callback: @escaping (_ jsonData: [String:Any]) -> Void) {
        
        let task = URLSession.shared.dataTask(with: apiURL){
            (data, response, error) in
            
            if error != nil {
                print(error!)
            }
            else {
                
                if let jsonData = data {
                    
                    do {
                        if let parsedJSON = try JSONSerialization.jsonObject(with: jsonData) as? [String:AnyObject] {
                            callback(parsedJSON)
                        }
                        
                    } catch let jsonError {
                        print("An error has occured.", jsonError)
                    }
                    
                }
            }
            
        }
        
        task.resume()
        
    }
    
    func parseData(jsonData: [String:Any]) -> LaundryRoom {
        
        let roomName = "Irving"
        
        var room: LaundryRoom = LaundryRoom(quadName: "Mendelsohn", roomName: roomName)
        
        let machineData = jsonData["objects"] as? [Any]
            
        for machine in machineData! {
                
            if let machineData = machine as? [String:Any] {
                
                if(machineData["appliance_desc"] == nil){
                    continue
                }
                
                let numberString = machineData["appliance_desc"] as! String
                let number = Int(numberString) // Convert to integer
                let status = machineData["status_toggle"] as! Int
                let type = machineData["appliance_type"] as! String
                let progress = machineData["percentage"] as! Double
                let timeLeft = machineData["time_remaining"] as! Int
                
                var machineStatus: Machine.MachineStatus {
                    
                    switch (status){
                        
                        case 0: return .Available
                        case 1: return .Done_Door_Closed
                        case 2: return .In_Progress
                        case 3: return .Out_Of_Order
                        case 4: return .Unknown
                        default: return .Unknown
                        
                    }
                    
                }
                
                var machineType: Machine.MachineType {
                    
                    switch(type){
                        
                        case "W": return .Washer
                        case "D": return .Dryer
                        default: return .Other
        
                    }
                    
                }
                
                var newMachine = Machine(machineType: machineType, currentStatus: machineStatus, machineID: number!)
                newMachine.timeLeft = timeLeft
                newMachine.progress = progress
                room.machines.append(newMachine)
                
            }
                
        }
            
        return room
        
    }
    
    func getData(callback: @escaping (_ jsonData: [String:Any]) -> Void){
        retrieveData(apiURL: URL(string: API_URL + "88000529")!, callback: callback)
    }
    
}
