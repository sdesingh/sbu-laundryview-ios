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
    
    func parseData(jsonData: [String:Any]) -> LaundryRoom{
        
        let roomName = jsonData["name"]! as! String
        let totalWashers = jsonData["totalWashers"]! as! Int
        let totalDryers = jsonData["totalDryers"]! as! Int
        
        var room: LaundryRoom = LaundryRoom(quadName: "Mendelsohn", roomName: roomName, totalWashers: totalWashers, totalDryers: totalDryers)
        
        let machineData = jsonData["machines"] as? [Any]
            
        for machine in machineData! {
                
            if let machineData = machine as? [String:Any] {
                
                let number = machineData["machineNumber"] as! Int
                let status = machineData["statusCode"] as! Int
                let type = machineData["machineType"] as! String
                
                
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
                
                let newMachine = Machine(machineType: machineType, currentStatus: machineStatus, machineID: number)
                room.machines.append(newMachine)
                
            }
                
        }
            
        return room
        
    }
    
    func getData(callback: @escaping (_ jsonData: [String:Any]) -> Void){
        retrieveData(apiURL: URL(string: API_URL + "Mendelsohn/Irving")!, callback: callback)
    }
    
}
