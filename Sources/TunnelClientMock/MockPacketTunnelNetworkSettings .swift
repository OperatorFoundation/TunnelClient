//
//  MockPacketTunnelNetworkSettings.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient

public class MockPacketTunnelNetworkSettings: PacketTunnelNetworkSettings
{
    public var tunnelRemoteAddress: String
    public var dns: DNSSettings?

    public var ipv4: IPv4Settings?
    public var ipv6: IPv6Settings?
    public var tunnelOverheadBytes: NSNumber?
    public var mtu: NSNumber?

    public required init(tunnelRemoteAddress address: String)
    {
        self.tunnelRemoteAddress = address
    }
}

public class MockIPv4Settings: IPv4Settings
{
    public var addresses: [String]
    public var subnetMasks: [String]

    required public init(addresses: [String], subnetMasks: [String])
    {
        self.addresses = addresses
        self.subnetMasks = subnetMasks
    }
}

public class MockIPv6Settings: IPv6Settings
{
    public var addresses: [String]
    public var networkPrefixLengths: [NSNumber]

    required public init(addresses: [String], networkPrefixLengths: [NSNumber])
    {
        self.addresses = addresses
        self.networkPrefixLengths = networkPrefixLengths
    }
}
