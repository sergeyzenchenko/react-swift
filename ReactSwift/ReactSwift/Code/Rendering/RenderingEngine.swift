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
    var viewNodeMapping = [String:ViewBuilding]()
    
    var root:Node
    var renderedRoot:Node
    
    init(onRender:RenderingCallBack) {
        self.onRender = onRender
        root = ViewNode()
        renderedRoot = ViewNode()
        
        viewNodeMapping[NSStringFromClass(ViewNode)] = ViewBuilder<UIView, ViewNode>({ node in
            UIView()
        })
        
        viewNodeMapping[NSStringFromClass(Button)] = ViewBuilder<UIButton, Button>({ node in
            UIButton()
        })
        
        viewNodeMapping[NSStringFromClass(Switch)] = ViewBuilder<UISwitch, Switch>({ node in
            let s = UISwitch()

            s.on = node.isOn
            s.addTarget(node, action: "handleChange:", forControlEvents: .ValueChanged)
            
            return s
        })
    }
    
    func renderComponent(node:Node) -> Node {
        let rootNode = node.render()
        
        rootNode.children = rootNode.children.map({ (node) -> Node in
            self.renderComponent(node)
        })
        
        return rootNode
    }
    
    func render(renderable:Node) {
        root = renderable;
        renderedRoot = renderComponent(root)
        
        root.invalidate = {
            self.render(renderable)
        }
        
        let view = buildView(renderedRoot)
        
        self.onRender(view: view)
    }
    
    func buildView(node:Node) -> UIView {
        let builder = viewNodeMapping[NSStringFromClass(node.dynamicType)]!
        
        let view = builder.build(node)
        
        for child in node.children {
            let childView = buildView(child)
            view.addSubview(childView)
        }
        
        return view
    }
}
