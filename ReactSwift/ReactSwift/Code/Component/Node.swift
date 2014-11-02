//
//  Node.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

class Node: NSObject, Renderable {
    internal var children = [Node]()
    
    internal var invalidate:() -> Void {
        didSet {
            for child in children {
                child.invalidate = invalidate
            }
        }
    }
    
    override init() {
        invalidate = {}
    }
    
    func add(node:Node) -> Self {
        children.append(node)
        relayout()
        return self
    }
    
    internal func relayout() {
        
    }
    
    var frame:CGRect = CGRectNull;
    var backgroundColor:UIColor?;
    
    func render() -> Node {
        return self
    }
}
