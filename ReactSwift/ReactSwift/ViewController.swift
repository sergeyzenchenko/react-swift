//
//  ViewController.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

class SampleComponent : Component {
    override func render() -> Node {
        return Switch()
    }
}

class ViewController: UIViewController {

    var renderingEngine:RenderingEngine?;
    
    var currentView:UIView? {
        willSet(newView) {
            if let view = self.currentView {
               view.removeFromSuperview()
            }
        }
        didSet {
            self.view.addSubview(self.currentView!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderingEngine = RenderingEngine({view in self.currentView = view;});
        renderingEngine!.render(SampleComponent());
    }

}

