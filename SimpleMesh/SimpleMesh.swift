//
//  SimpleMesh.swift
//  SimpleMesh
//
//  Created by Laura Skelton on 6/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

import Foundation

protocol SimpleMeshDelegate {
    
    func simpleMeshStartedSharing(itemIDs: NSArray)
    func simpleMeshStoppedSharing()

}

class SimpleMesh {
    
    class var sharedInstance:SimpleMesh {
        return SimpleMeshSharedInstance
    }
    
    // testing items
    var delegate: SimpleMeshDelegate?
    
    var myItemIDs: NSMutableArray
    
    var simpleMeshAppID: String
    
    init(simpleMeshAppID: String) {
        self.simpleMeshAppID = simpleMeshAppID
        self.myItemIDs = ["first", "second", "third", "fourth", "fifth"]
    }
    convenience init() {
        self.init(simpleMeshAppID: "[NO ID]")
    }
    
    func setMyItemIDs(newMyItemIDs: NSMutableArray) {
        println(newMyItemIDs)
    }
    
    func shareMyItems() {
        println("should share items!")
        delegate?.simpleMeshStartedSharing(self.myItemIDs)
    }
    
    func stopSharingMyItems()
    {
        println("should stop sharing items!")
        delegate?.simpleMeshStoppedSharing()
    }

}

let SimpleMeshSharedInstance = SimpleMesh()
