//
//  PrimitiveNodes.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import Foundation
import UIKit

class ViewNode : Node {
    
}

class Button : Node {
    var title:String = ""
}

class Label : Node {
    var text:String = ""
}


class TextField : Node {
    
}

class Switch : Node {
    let onSwitch:(isOn:Bool) -> Void
    let isOn = false
    
    init(isOn:Bool, block:(isOn:Bool) -> Void) {
        self.isOn = isOn
        self.onSwitch = block
    }
    
    func handleChange(s:UISwitch) {
        onSwitch(isOn: s.on)
    }
}