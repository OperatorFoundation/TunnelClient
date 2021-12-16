//
//  PacketTunnelProvider.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/15/21.
//

import Foundation

public protocol PacketTunnelProvider: TunnelProvider
{
    var packets: PacketTunnelFlow {get}

    func startTunnel(options: [String : NSObject]?, completionHandler: @escaping (Error?) -> Void)
    func stopTunnel(with reason: ProviderStopReason, completionHandler: @escaping () -> Void)
    func cancelTunnelWithError(_ error: Error?)
}

public enum ProviderStopReason
{
    case none
//    No specific reason.
    case userInitiated
//    The user stopped the provider extension.
    case providerFailed
//    The provider failed to function correctly.
    case noNetworkAvailable
//    No network connectivity is currently available.
    case unrecoverableNetworkChange
//    The device’s network connectivity changed.
    case providerDisabled
//    The provider was disabled.
    case authenticationCanceled
//    The authentication process was canceled.
    case configurationFailed
//    The configuration is invalid.
    case idleTimeout
//    The session timed out.
    case configurationDisabled
//    The configuration was disabled.
    case configurationRemoved
//    The configuration was removed.
    case superceded
//    The configuration was superceded by a higher-priority configuration.
    case userLogout
//    The user logged out.
    case userSwitch
//    The current console user changed.
    case appUpdate
    case connectionFailed
//    The connection failed.
    case sleep
//    A stop reason indicating the configuration enabled disconnect on sleep and the device went to sleep.
}
