//
//  NEPacketTunnelNetworkSettings.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

public protocol PacketTunnelNetworkSettings: TunnelNetworkSettings
{
    var ipv4Settings: IPv4Settings? { get set }
    var ipv6Settings: IPv6Settings? { get set }
    var tunnelOverheadBytes: NSNumber? { get set }
    var mtu: NSNumber? { get set }
}

public protocol IPv4Settings
{
    var addresses: [String] { get }
    var subnetMasks: [String] { get }


    init(addresses: [String], subnetMasks: [String])
}

public protocol IPv6Settings
{
    var addresses: [String] { get }
    var networkPrefixLengths: [NSNumber] { get }

    init(addresses: [String], networkPrefixLengths: [NSNumber])
}
