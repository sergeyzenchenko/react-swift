//
//  ViewController.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/1/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

func horizontalLayout(block: () -> Void) -> Node {
    return Node()
}

func verticalLayout(block: () -> Void) -> Node {
    return Node()
}

func padding(left:Int = 0, top:Int = 0, right:Int = 0, bottom:Int = 0) -> Node {
    return Node()
}

class SampleComponent : Component {
    override func render() -> Node {
        return Switch()
    }
}

class SampleDSLComponent : Component {
    override func render() -> Node {
        return verticalLayout {
            padding(left: 0, top: 10)

            horizontalLayout {
                View()
                View()
                View()
            }

            Button()
        }
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
        renderingEngine = RenderingEngine({
            [weak self]
            (view) in
            self!.currentView = view
        })
        renderingEngine!.render(SampleComponent());
    }

}

