//
//  ViewController.swift
//  SimpleMesh
//
//  Created by Laura Skelton on 6/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, SimpleMeshDelegate, MCBrowserViewControllerDelegate {
    
    // View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SimpleMesh.sharedInstance.delegate = self
        
        SimpleMesh.sharedInstance.shareMyItems()
        
    }

    // Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBAction
    
    @IBAction func buttonPressed()
    {
        SimpleMesh.sharedInstance.stopSharingMyItems()
        
        SimpleMesh.sharedInstance.myItemIDs = ["newItem1", "newItem2", "newItem3"]
        
        SimpleMesh.sharedInstance.shareMyItems()
    }
    
    @IBAction func browseButtonClicked()
    {
    // open up the browsing services
        
        var browserViewController = MCBrowserViewController(serviceType: "simplemesh", session: PeerHelper.sharedInstance.peer!.session)
        
        browserViewController.delegate = self
        
        presentModalViewController(browserViewController, animated: true)
    
    }
    
    @IBAction func startAdvertising()
    {
        PeerHelper.sharedInstance.start()
    }
    
    // MCBrowserViewController Delegate
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController!)
    {
        browserViewController.dismissModalViewControllerAnimated(true)
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController!)
    {
        browserViewController.dismissViewControllerAnimated(true, completion: {
                println("browser completion block called")
                PeerHelper.sharedInstance.sendData()
            })
    }
    
    // SimpleMesh Delegate
    
    func simpleMeshStartedSharing(itemIDs: NSArray)
    {
        println(itemIDs)
    }
    
    func simpleMeshStoppedSharing()
    {
        println("simplemesh stopped sharing")
    }

}

