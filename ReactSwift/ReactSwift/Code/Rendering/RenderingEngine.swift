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
    var viewNodeMapping = [String:AnyClass]()
    
    init(onRender:RenderingCallBack) {
        self.onRender = onRender
        
        viewNodeMapping[NSStringFromClass(View)] = UIView.self
        viewNodeMapping[NSStringFromClass(Button)] = UIButton.self
        viewNodeMapping[NSStringFromClass(TextField)] = UITextField.self
        viewNodeMapping[NSStringFromClass(Switch)] = UISwitch.self
    }
    
    func render(renderable:Renderable) {
        let rootNode = renderable.render();
        let view = buildView(rootNode)
        
        self.onRender(view: view)
    }
    
    func buildView(node:Node) -> UIView {
        var anyobjectype : AnyObject.Type = viewNodeMapping[NSStringFromClass(node.dynamicType)]!
        var nsobjectype : NSObject.Type = anyobjectype as NSObject.Type
        let view = nsobjectype() as UIView
        
        
        return view
    }
}
