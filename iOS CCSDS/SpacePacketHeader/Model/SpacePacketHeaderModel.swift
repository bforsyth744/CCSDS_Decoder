//
//  SpacePacketHeaderModel.swift
//  iOS CCSDS
//
//  Created by Brent Forsyth on 8/21/20.
//  Copyright © 2020 Brent Forsyth. All rights reserved.
//

import Foundation
import Combine

struct SpacePacketStringStruct {
    var hex_str: String = "0x000000000000"
    var version: String = "0"
    var type: String = "0"
    var secondaryHeaderFlag: String = "0"
    var apid: String = "0"
    var groupingFlags: String = "0"
    var sequenceCount: String = "0"
    var length: String = "0"
}

class SpacePacketModel: ObservableObject {
    
    @Published var packet:SpacePacketStringStruct
    private let versionShift = 13
    private let typeShift = 12
    private let secondaryHeaderFlagShift = 11
    private let apidShift = 0
    private let groupingFlagsShift = 14
    private let sequenceCountShift = 0

    init() {
        self.packet = SpacePacketStringStruct()
    }
    
    func encode() {
        
        let version = (Int(self.packet.version) ?? 0) << self.versionShift
        let type = (Int(self.packet.type) ?? 0) << self.typeShift
        let secondaryHeaderFlag = (Int(self.packet.secondaryHeaderFlag) ?? 0) << self.secondaryHeaderFlagShift
        let apid = Int(self.packet.apid) ?? 0
        let grouping = (Int(self.packet.groupingFlags) ?? 0) << self.groupingFlagsShift
        let sequenceCount = Int(self.packet.sequenceCount) ?? 0
        let length = Int(self.packet.length) ?? 0
        
        var hex_str = String(format:"0x%04X", version + type + secondaryHeaderFlag + apid)
        print(hex_str)
        hex_str += String(format:"%04X", grouping + sequenceCount)
        print(hex_str)
        hex_str += String(format:"%04X", length)
        print(hex_str)
        
        print(self.packet.apid)
        
        self.packet.hex_str = hex_str
        
        
    }
    
    func subString(str:String, start:Int, end:Int) -> String{
        let start_index = str.index(str.startIndex, offsetBy: start)
        let end_index = str.index(str.startIndex, offsetBy: end)
        let range = start_index..<end_index

        return String(str[range])
        
    }
    
    func decode() {
        
        let w1 = UInt16(subString(str:  self.packet.hex_str, start: 3, end: 6), radix:16) ?? 0
        let w2 = UInt16(subString(str:  self.packet.hex_str, start: 7, end: 10), radix:16) ?? 0
        let w3 = UInt16(subString(str:  self.packet.hex_str, start: 11, end: 14), radix:16) ?? 0
        
        self.packet.version = String((w1 & 0xE000) >> self.versionShift)
        self.packet.type = String((w1 & 0x1000) >> self.typeShift)
        self.packet.secondaryHeaderFlag = String((w1 & 0x0800) >> self.secondaryHeaderFlagShift)
        self.packet.apid = String((w1 & 0x07FF) >> self.apidShift)
        self.packet.groupingFlags = String((w1 & 0xC000) >> self.groupingFlagsShift)
        self.packet.sequenceCount = String((w2 & 0x07FF) >> self.sequenceCountShift)
        self.packet.length = String(w3)
    }

}

