//
//  DNSSettings.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

public protocol DNSSettings
{
    var servers: [String] { get }

    init(servers: [String])
}
