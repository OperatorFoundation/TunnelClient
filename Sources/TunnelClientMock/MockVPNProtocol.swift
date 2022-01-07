//
//  MockVPNProtocol.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation
import TunnelClient

public struct MockVPNProtocol: VPNProtocol
{
    public var serverAddress: String?

    public init()
    {
        self.serverAddress = nil
    }
}
