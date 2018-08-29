//
//  API.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import Foundation

class API {
    
    func retrieveData(apiURL: URL, callback: @escaping (_ jsonData: [String:Any]) -> LaundryRoom) {
        
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
        
        let quadName = jsonData["name"]! as! String
        let totalWashers = jsonData["totalWashers"]! as! Int
        let totalDryers = jsonData["totalDryers"]! as! Int
        
        if let machineData = jsonData["machines"] as? [Any] {
            
            for machine in machineData {
                
                if let machineStatus = machine as? [String:Any] {
                    print(machineStatus["status"]!)
                }
                
            }
            
            return LaundryRoom(quadName: quadName, roomName: "Mendelsohn", totalWashers: totalWashers, totalDryers: totalDryers)
            
        }
    }
    
    func getLaundryData() -> LaundryRoom{
        return retrieveData(apiURL: URL(string: API_URL + "Mendelsohn/Irving")!, callback: parseData)
    }
    
}
