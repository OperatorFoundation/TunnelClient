//
//  TunnelClient.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

#if (os(macOS) || os(iOS) || os(watchOS) || os(tvOS))

@_exported import TunnelClientMacOS

extension NEDNSSettings: DNSSettings {}
extension NEPacketTunnelFlow: PacketTunnelFlow {}

extension NEPacketTunnelNetworkSettings: PacketTunnelNetworkSettings
{
    public var ipv4: IPv4Settings?
    {
        get
        {
            return self.ipv4Settings
        }

        set(newValue)
        {
            guard let value = newValue else
            {
                self.ipv4Settings = nil
                return
            }

            self.ipv4Settings = NEIPv4Settings(addresses: value.addresses, subnetMasks: value.subnetMasks)
        }
    }

    public var ipv6: IPv6Settings?
    {
        get
        {
            return self.ipv6Settings
        }

        set(newValue)
        {
            guard let value = newValue else
            {
                self.ipv6Settings = nil
                return
            }

            self.ipv6Settings = NEIPv6Settings(addresses: value.addresses, networkPrefixLengths: value.networkPrefixLengths)
        }
    }
}

extension NEPacketTunnelProvider: PacketTunnelProvider {
    public var packets: PacketTunnelFlow
    {
        return self.packetFlow
    }

    public func stopTunnel(with reason: ProviderStopReason, completionHandler: @escaping () -> Void) {
        switch reason
        {
            case .appUpdate:
                self.stopTunnel(with: NEProviderStopReason.appUpdate, completionHandler: completionHandler)
            // FIXME - add other cases
            default:
                return
        }
    }
}

extension NEProvider: Provider {}

extension NETunnelProvider: TunnelProvider
{
    public func setNetworkSettings(_ tunnelNetworkSettings: TunnelNetworkSettings, completionHandler: @escaping ((Error?) -> Void))
    {
        let settings = NETunnelNetworkSettings(tunnelRemoteAddress: tunnelNetworkSettings.tunnelRemoteAddress)
        self.setTunnelNetworkSettings(settings, completionHandler: completionHandler)
    }
}

extension NETunnelNetworkSettings: TunnelNetworkSettings
{
    public var dns: DNSSettings?
    {
        get
        {
            return self.dnsSettings
        }

        set(newValue)
        {
            guard let value = newValue else
            {
                self.dnsSettings = nil
                return
            }

            self.dnsSettings = NEDNSSettings(servers: value.servers)
        }
    }
}

extension NEIPv4Settings: IPv4Settings {}
extension NEIPv6Settings: IPv6Settings {}

#endif
