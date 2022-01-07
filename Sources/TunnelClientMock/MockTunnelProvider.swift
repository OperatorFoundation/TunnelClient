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
    public init()
    {
    }

    open func setNetworkSettings(_ tunnelNetworkSettings: TunnelNetworkSettings, completionHandler: @escaping ((Error?) -> Void))
    {
        completionHandler(nil)
    }

    open func handleAppMessage(_ messageData: Data, completionHandler: ((Data?) -> Void)?)
    {
        if let completionHandler = completionHandler
        {
            completionHandler(nil)
        }
    }
}
