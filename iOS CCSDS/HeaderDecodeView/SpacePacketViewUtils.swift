//
//  SpacePacketViewUtils.swift
//  iOS CCSDS
//
//  Created by Brent Forsyth on 8/23/20.
//  Copyright © 2020 Brent Forsyth. All rights reserved.
//

import SwiftUI
import Foundation

func LabelTextField(name: String, binding: Binding<String>, action: @escaping ()->Void) -> some View {
    HStack {
        Text(name)
        Spacer()
        TextField(name, text: binding, onCommit: action ).multilineTextAlignment(.trailing)
        
    }.padding()
    
}
