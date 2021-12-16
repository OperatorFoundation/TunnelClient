//
//  MockDNSSettings.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient

public class MockDNSSettings: DNSSettings
{
    public var servers: [String]

    required public init(servers: [String])
    {
        self.servers = servers
    }
}
