//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation
import TunnelClient

public class MockTunnelProviderProtocol: TunnelProviderProtocol
{
    public var providerConfiguration: [String : Any]?
    public var providerBundleIdentifier: String?

    public init()
    {
        self.providerConfiguration = nil
        self.providerBundleIdentifier = nil
    }
}
