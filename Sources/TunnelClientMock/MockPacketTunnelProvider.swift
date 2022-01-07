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
    public var packets: PacketTunnelFlow

    let messageReadQueue: BlockingQueue<Data>
    let messageWriteQueue: BlockingQueue<Data>

    public init(packetReadQueue: BlockingQueue<PacketTunnelFlowPacket>, packetWriteQueue: BlockingQueue<PacketTunnelFlowPacket>, messageReadQueue: BlockingQueue<Data>, messageWriteQueue: BlockingQueue<Data>)
    {
        self.messageReadQueue = messageReadQueue
        self.messageWriteQueue = messageWriteQueue

        self.packets = MockPacketTunnelFlow(readQueue: packetReadQueue, writeQueue: packetWriteQueue)
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
