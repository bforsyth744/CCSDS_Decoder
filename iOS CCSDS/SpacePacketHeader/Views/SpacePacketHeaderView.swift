//
//  SpacePacketDecoderView.swift
//  iOS CCSDS
//
//  Created by Brent Forsyth on 8/22/20.
//  Copyright © 2020 Brent Forsyth. All rights reserved.
//

import SwiftUI

struct SpacePacketHeaderView: View {
    @ObservedObject var spacePacketModel: SpacePacketModel = SpacePacketModel()

    var body: some View {
        VStack {
            Text("Decode Space Packet Header").font(.title)
            LabelTextField(name: "Space Packet Header (Hex)", binding: $spacePacketModel.packet.hex_str, action: { self.spacePacketModel.decode() })
            Divider()
            LabelTextField(name: "Version Number", binding: $spacePacketModel.packet.version, action: { self.spacePacketModel.encode() })
            LabelTextField(name: "Secondary Header Flag", binding: $spacePacketModel.packet.secondaryHeaderFlag, action: { self.spacePacketModel.encode() })
            LabelTextField(name: "Type", binding: $spacePacketModel.packet.type, action: { self.spacePacketModel.encode() })
            LabelTextField(name: "APID", binding: $spacePacketModel.packet.apid, action: { self.spacePacketModel.encode() })
            LabelTextField(name: "Grouping Flags", binding: $spacePacketModel.packet.groupingFlags, action: { self.spacePacketModel.encode() })
            LabelTextField(name: "Sequence Count", binding: $spacePacketModel.packet.sequenceCount, action: { self.spacePacketModel.encode() })
            LabelTextField(name: "Length", binding: $spacePacketModel.packet.length, action: { self.spacePacketModel.encode() })
        }
    }
}

struct SpacePacketHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SpacePacketHeaderView(spacePacketModel: SpacePacketModel())
    }
}
