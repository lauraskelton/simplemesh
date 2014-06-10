//
//  Peer.swift
//  SimpleMesh
//
//  Created by Laura Skelton on 6/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class Peer: NSObject, MCSessionDelegate
    {
    
    var peerID: MCPeerID
    var session: MCSession
    var assistant: MCAdvertiserAssistant
    
    init(peerID: MCPeerID, session: MCSession, assistant: MCAdvertiserAssistant)
    {
        self.peerID = peerID
        self.session = session
        self.assistant = assistant
        
        super.init()
        self.session.delegate = self
    }
    
    func testingFunc()
    {
        println("testing")
    }
    
    func sessionSendData(data: NSData)
    {
        var error: NSError?
        
        self.session.sendData(data, toPeers: self.session.connectedPeers, withMode: MCSessionSendDataMode.Reliable, error: &error)

    }
    
    func assistantStart()
    {
        assistant.start()
    }
    
    func assistantStop()
    {
        assistant.stop()
    }
    
    func session(_session: MCSession!,
        didReceiveData data: NSData!,
        fromPeer peerID: MCPeerID!)
    {
        
        var tmpString = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        println(tmpString)
        
    //Card *card = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"CardReceivedNotification" object:card userInfo:@{@"Card":card}];
    }
    
    func session(_session: MCSession!,
        didStartReceivingResourceWithName resourceName: String!,
        fromPeer peerID: MCPeerID!,
        withProgress progress: NSProgress!)
    {
        println("didStartReceivingResourceWithName")
    }
    
    func session(_session: MCSession!,
        peer peerID: MCPeerID!,
        didChangeState state: MCSessionState)
    {
        println("didChangeState")
    }
    
    func session(_session: MCSession!,
        didFinishReceivingResourceWithName resourceName: String!,
        fromPeer peerID: MCPeerID!,
        atURL localURL: NSURL!,
        withError error: NSError!)
    {
        println("didFinishReceivingResourceWithName")
    }
    
    func session(_session: MCSession!,
        didReceiveStream stream: NSInputStream!,
        withName streamName: String!,
        fromPeer peerID: MCPeerID!)
    {
        println("didReceiveStream")
    }
    
    func session(_session: MCSession!,
        didReceiveCertificate certificate: AnyObject[]!,
        fromPeer peerID: MCPeerID!,
        certificateHandler certificateHandler: ((Bool) -> Void)!)
    {
        certificateHandler(true);
    }

}
