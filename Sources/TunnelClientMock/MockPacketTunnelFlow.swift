//
//  MockPacketTunnelFlow.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation
import TunnelClient
import Chord

public typealias PacketTunnelFlowPacket = (Data, NSNumber)

public class MockPacketTunnelFlow: PacketTunnelFlow
{
    let readQueue: BlockingQueue<PacketTunnelFlowPacket>
    let writeQueue: BlockingQueue<PacketTunnelFlowPacket>
    let readTaskQueue: DispatchQueue = DispatchQueue(label: "MockPacketTunnelFlow.readPackets")
    let writeTaskQueue: DispatchQueue = DispatchQueue(label: "MockPacketTunnelFlow.writePackets")

    public init(readQueue: BlockingQueue<PacketTunnelFlowPacket>, writeQueue: BlockingQueue<PacketTunnelFlowPacket>)
    {
        self.readQueue = readQueue
        self.writeQueue = writeQueue
    }

    public func readPackets(completionHandler: @escaping ([Data], [NSNumber]) -> Void)
    {
        readTaskQueue.async
        {
            while true
            {
                let packet = self.readQueue.dequeue()
                let (data, number) = packet
                completionHandler([data], [number])
            }
        }
    }

    public func writePackets(_ packets: [Data], withProtocols protocols: [NSNumber]) -> Bool
    {
        for index in 0..<packets.count
        {
            let data = packets[index]
            let number = protocols[index]

            let packet = (data, number)
            writeQueue.enqueue(element: packet)
        }

        return true
    }
}
