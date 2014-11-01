//
//  RenderingEngine.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

class RenderingEngine: NSObject {
    typealias RenderingCallBack = (view: UIView) -> Void;
    
    let onRender:RenderingCallBack
    
    init(onRender:RenderingCallBack) {
        self.onRender = onRender
    }
    
    func render(renderable:Renderable) {
        let rootNode = renderable.render();
        let view = buildView(rootNode)
        
        self.onRender(view: view)
    }
    
    func buildView(node:Node) -> UIView {
        let view = UIView()
        
        view.frame = CGRectMake(0, 0, 100, 100)
        view.backgroundColor = UIColor.redColor()
        
        return view
    }
}
