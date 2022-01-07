//
//  PacketTunnelProvider.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient
import Chord

open class MockPacketTunnelProvider: PacketTunnelProvider
{
    public var packets: PacketTunnelFlow = MockPacketTunnelFlow(readQueue: BlockingQueue<PacketTunnelFlowPacket>(), writeQueue: BlockingQueue<PacketTunnelFlowPacket>())

    public var messageReadQueue: BlockingQueue<Data> = BlockingQueue<Data>()
    public var messageWriteQueue: BlockingQueue<Data> = BlockingQueue<Data>()

    public init()
    {
    }

    public func startTunnel(options: [String : NSObject]?, completionHandler: @escaping (Error?) -> Void)
    {
        completionHandler(nil)
    }

    public func stopTunnel(with reason: ProviderStopReason, completionHandler: @escaping () -> Void)
    {
        completionHandler()
    }

    public func cancelTunnelWithError(_ error: Error?)
    {
    }

    public func setNetworkSettings(_ tunnelNetworkSettings: TunnelNetworkSettings, completionHandler: @escaping ((Error?) -> Void))
    {
        completionHandler(nil)
    }

    public func handleAppMessage(_ messageData: Data, completionHandler: ((Data?) -> Void)?)
    {
        self.messageWriteQueue.enqueue(element: messageData)

        let response = messageReadQueue.dequeue()

        if let completionHandler = completionHandler
        {
            completionHandler(response)
        }
    }
}
