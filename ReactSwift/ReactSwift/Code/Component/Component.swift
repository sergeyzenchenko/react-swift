//
//  Component.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

protocol Stateful {
    typealias StateType;
    
    func state() -> StateType;
    func setState(state:StateType)
}

class Component: Node, Stateful {
    var dispatcher:ActionDispatching = Dispatcher.defaultDispatcher();
    
    typealias StateType = Any?
    
    var internalState:Any?

    func state() -> StateType {
        return internalState as StateType
    }
    
    func setState(state:StateType) {
        internalState = state
        invalidate()
    }
    
    func getInitialState() -> StateType {
        return nil
    }
    
    override init() {
        super.init()
        setState(getInitialState())
    }
    
    override func render() -> Node {
        return ViewNode()
    }
}
