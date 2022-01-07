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

    open init()
    {
    }

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

    open func setNetworkSettings(_ tunnelNetworkSettings: TunnelNetworkSettings, completionHandler: @escaping ((Error?) -> Void))
    {
        completionHandler(nil)
    }

    open func handleAppMessage(_ messageData: Data, completionHandler: ((Data?) -> Void)?)
    {
        self.messageWriteQueue.enqueue(element: messageData)

        let response = messageReadQueue.dequeue()

        if let completionHandler = completionHandler
        {
            completionHandler(response)
        }
    }
}
