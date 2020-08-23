//
//  ContentView.swift
//  iOS CCSDS
//
//  Created by Brent Forsyth on 8/21/20.
//  Copyright © 2020 Brent Forsyth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30){
                Text("Encode/Decode CCSDS")
                NavigationLink(destination: SpacePacketHeaderView()) { Text("Space Packet Header")}
                Text("Commands")
                NavigationLink(destination: Text("Not implemented yet")) { Text("TC Transfer Frame")}
                Text("Telemetry")
                NavigationLink(destination: Text("Not implemented yet")) { Text("AOS Transfer Frame")}
            }
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
