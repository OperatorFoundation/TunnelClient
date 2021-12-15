//
//  NETunnelProvider.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

public protocol TunnelProvider: Provider
{
    func setTunnelNetworkSettings(_ tunnelNetworkSettings: TunnelNetworkSettings?, completionHandler: ((Error?) -> Void)?)
    func handleAppMessage(_ messageData: Data, completionHandler: ((Data?) -> Void)?)
}
