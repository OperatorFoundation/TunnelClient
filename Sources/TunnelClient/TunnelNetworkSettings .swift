//
//  TunnelNetworkSettings.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

public protocol TunnelNetworkSettings
{
    var tunnelRemoteAddress: String { get }
    var dns: DNSSettings? { get set }

    init(tunnelRemoteAddress address: String)
}
