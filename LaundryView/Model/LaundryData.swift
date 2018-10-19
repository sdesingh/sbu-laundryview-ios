//
//  LaundryData.swift
//  LaundryView
//
//  Created by Sam Singh on 8/12/18.
//  Copyright © 2018 Mango Hut. All rights reserved.
//

import Foundation

struct LaundryRoom {

    var quadName: String
    var roomName: String
    
    var washersAvailable: Int {
        
        var available = 0
        for machine in machines{
            
            if(machine.machineType == .Washer && machine.currentStatus == .Available){
                available += 1
            }
            
        }
        
        return available
    }
    
    
    var dryersAvailable: Int {
        
        var available = 0
        for machine in machines{
            
            if(machine.machineType == .Dryer && machine.currentStatus == .Available){
                available += 1
            }
            
        }
        
        return available
    }
    
    
    var machines: [Machine] = []
    
    init(quadName: String, roomName: String){
        
        self.quadName = quadName
        self.roomName = roomName
        
    }
    
    func getMachinesOfType(type: Machine.MachineType) -> [Machine] {
        
        var machinesOfType: [Machine] = [Machine]()
        
        for machine in machines {
            
            if(machine.machineType == type){
                machinesOfType.append(machine)
            }
            
        }
        
        return machinesOfType
        
    }
    
}

struct Machine {
    
    enum MachineType {
        case Washer
        case Dryer
        case Other
    }
    
    enum MachineStatus: String {
        
        case Available = "Available"
        case In_Progress = "In Progress"
        case Done_Door_Closed = "Done. Door Closed."
        case Out_Of_Order = "Out of order."
        case Unknown = "Unknown status."
        
    }
    
    var machineType: MachineType
    var currentStatus: MachineStatus
    var machineID: Int
    var timeLeft: Int
    
    init(machineType: MachineType, currentStatus: MachineStatus, machineID: Int) {
        self.machineType = machineType
        self.currentStatus = currentStatus
        self.machineID = machineID
        
        // Default Time Left
        timeLeft = 0
    }
    
    
}
