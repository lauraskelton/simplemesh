//
//  PeerManager.swift
//  SimpleMesh
//
//  Created by Laura Skelton on 6/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class PeerHelper {
    
    class var sharedInstance:PeerHelper {
        return PeerHelperSharedInstance
    }
    
    var peer: Peer?
    
    init()
    {
        
    }
    
    func setupPeer()
    {
        var peerName = UIDevice.currentDevice().name
        var peerid : MCPeerID = MCPeerID(displayName:peerName)
        var session : MCSession = MCSession(peer:peerid)
        var assistant : MCAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "simplemesh", discoveryInfo: nil, session: session)
        self.peer = Peer(peerID: peerid,session: session,assistant: assistant)
    }
    
    func sendData()
    {
        println("should send data")
        
        var itemIDs = SimpleMesh.sharedInstance.myItemIDs
        
        var itemString = itemIDs.componentsJoinedByString(", ")
        var itemData = itemString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        self.peer?.sessionSendData(itemData)
        
    }
    
    func start()
    {
        self.peer?.assistantStart()
    }
    
    func stop()
    {
        self.peer?.assistantStop()
    }
    
    func restart()
    {
        stop()
        setupPeer()
        start()
    }
}

let PeerHelperSharedInstance = PeerHelper()