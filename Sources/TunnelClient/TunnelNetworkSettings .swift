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
    var dnsSettings: DNSSettings? { get set }

    init(tunnelRemoteAddress address: String)
}
