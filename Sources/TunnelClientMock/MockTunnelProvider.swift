//
//  MockTunnelProvider.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient

open class MockTunnelProvider: TunnelProvider
{
    public func setNetworkSettings(_ tunnelNetworkSettings: TunnelNetworkSettings, completionHandler: @escaping ((Error?) -> Void))
    {

    }

    public func handleAppMessage(_ messageData: Data, completionHandler: ((Data?) -> Void)?)
    {
        
    }
}
