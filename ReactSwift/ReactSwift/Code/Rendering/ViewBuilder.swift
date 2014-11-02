//
//  ViewBuilder.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/2/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

protocol ViewBuilding {
    func build(node:Node) -> UIView
}

class ViewBuilder<V:UIView, N:Node>: NSObject, ViewBuilding {
    typealias ViewBuilderBody = (node:N) -> V
    
    let builderBody:ViewBuilderBody;
    
    init(body:ViewBuilderBody) {
        builderBody = body
    }
    
    func build(node:Node) -> UIView {
        let view = builderBody(node:node as N)
        
        if node.frame != CGRectNull {
            view.frame = node.frame
        }
        
        view.backgroundColor = node.backgroundColor
        
        return view
    }
}



