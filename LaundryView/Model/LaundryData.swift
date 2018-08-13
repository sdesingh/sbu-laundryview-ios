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
    
    var totalWashers: Int
    var totalDryers: Int
    var washersAvailable: Int
    var dryersAvailable: Int
    var machines: [Machine] = []
    
    init(quadName: String, roomName: String, totalWashers: Int, totalDryers: Int){
        
        self.quadName = quadName
        self.roomName = roomName
        self.totalWashers = totalWashers
        self.totalDryers = totalDryers
        
        self.washersAvailable = 0
        self.dryersAvailable = 0
        
    }
    
}

struct Machine {
    
    enum MachineType {
        case Washer
        case Dryer
    }
    
    enum MachineStatus {
        case Available
        case In_Progress
        case Done_Door_Closed
        case Out_Of_Order
        case Unknown
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
