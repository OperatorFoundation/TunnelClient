//
//  MockVPNProtocol.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation
import TunnelClient

public class MockVPNProtocol: MockTunnelProviderProtocol, VPNProtocol
{
    public var serverAddress: String?

    public override init()
    {
        self.serverAddress = nil
    }
}
