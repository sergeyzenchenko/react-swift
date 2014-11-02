//
//  Dispatcher.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

class Action {
    
}

protocol ActionDispatching {
    func dispatch(action:Action);
}

typealias ActionCallback = (action:Action) -> Void

protocol ActionObserving {
    
    func register(callback:ActionCallback);
}

class Dispatcher: NSObject, ActionDispatching, ActionObserving {
 
    class func defaultDispatcher() -> Dispatcher {
        return Dispatcher()
    }
    
    func dispatch(action:Action) {
        print(action)
    }
    
    func register(callback:ActionCallback) {
        
    }
}
