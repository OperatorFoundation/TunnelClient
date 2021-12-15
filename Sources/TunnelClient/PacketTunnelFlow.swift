//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

public protocol PacketTunnelFlow
{
    func readPackets(completionHandler: ([Data], [NSNumber]) -> Void)
    func writePackets(_ packets: [Data], withProtocols protocols: [NSNumber]) -> Bool
}
