//
//  VPNProtocol.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public protocol VPNProtocol: TunnelProviderProtocol
{
    var serverAddress: String? { get set }
}
