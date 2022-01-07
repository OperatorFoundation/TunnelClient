//
//  TunnelProviderProtocol.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public protocol TunnelProviderProtocol
{
    var providerConfiguration: [String : Any]? { get set }
    var providerBundleIdentifier: String? { get set }
}
