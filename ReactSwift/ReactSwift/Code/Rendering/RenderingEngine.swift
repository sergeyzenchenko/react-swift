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
    
    func render() {
        let view = UIView()
        
        view.frame = CGRectMake(0, 0, 100, 100)
        view.backgroundColor = UIColor.redColor()
        
        self.onRender(view: view)
    }
}
