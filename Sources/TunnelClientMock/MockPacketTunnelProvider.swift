//
//  PacketTunnelProvider.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient
import Chord

open class MockPacketTunnelProvider: MockTunnelProvider, PacketTunnelProvider
{
    override public init()
    {
    }

    public var packets: PacketTunnelFlow = MockPacketTunnelFlow()

    public var configuration: VPNProtocol = MockVPNProtocol()

    open func startTunnel(options: [String : NSObject]?, completionHandler: @escaping (Error?) -> Void)
    {
        completionHandler(nil)
    }

    open func stopTunnel(with reason: ProviderStopReason, completionHandler: @escaping () -> Void)
    {
        completionHandler()
    }

    open func cancelTunnelWithError(_ error: Error?)
    {
    }
}
