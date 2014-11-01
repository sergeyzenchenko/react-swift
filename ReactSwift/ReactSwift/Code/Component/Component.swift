//
//  Component.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

class Component: Node {
    override func render() -> Node {
        return View()
    }
}
