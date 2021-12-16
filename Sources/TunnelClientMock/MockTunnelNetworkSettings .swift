//
//  MockTunnelNetworkSettings.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient

public class MockTunnelNetworkSettings: TunnelNetworkSettings
{
    public var tunnelRemoteAddress: String
    public var dns: DNSSettings?

    required public init(tunnelRemoteAddress address: String)
    {
        self.tunnelRemoteAddress = address
    }
}
