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
    var searchDomains: [String]? { get set }
    var domainName: String? { get set }
    var matchDomains: [String]? { get set }
    var matchDomainsNoSearch: Bool { get set }

    init(servers: [String])
}
