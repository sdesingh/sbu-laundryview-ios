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
                    do{
                        if let parsedJSON = try JSONSerialization.jsonObject(with: jsonData) as? [String:AnyObject] {
                            callback(parsedJSON)
                        }
                        
                        
                    } catch let jsonError {
                        print("error", jsonError)
                    }
                    
                }
            }
            
        }
        
        
        task.resume()
        
    }
    
    func parseData(jsonData: [String:Any]) {
        print(jsonData["name"]!)
        print("Washers Available", jsonData["washersAvailable"]!)
        print("Dryers Available", jsonData["dryersAvailable"]!)
    }
    
    func getWeatherData(){
        retrieveData(apiURL: URL(string: API_URL + "Mendelsohn/Irving")!, callback: parseData)
    }
    
}
