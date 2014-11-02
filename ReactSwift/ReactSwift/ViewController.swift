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

class StateHolder<S> {
    var invalidate:() -> Void
    
    init(state:S) {
        self.state = state
        self.invalidate = {}
    }
    
    var state:S {
        didSet {
            invalidate()
        }
    }
}

class TestComponent : Component {
    override func render() -> Node {
        let view = ViewNode()
        
        view.frame = self.frame
        view.backgroundColor = UIColor.greenColor()

        return view
    }
}

class SampleComponent : Component {
    
    struct State {
        var enabled = false
    }
    
    let stateHolder:StateHolder<State> = StateHolder<State>(state: State(enabled: false))
    
    func state() -> State {
        return super.state() as State
    }
    
    override func getInitialState() -> StateType {
        return State(enabled: false)
    }
    
    override func render() -> Node {
        let view = ViewNode()
        
        view.add(Switch(isOn: self.state().enabled) {[weak self] isOn in
            self!.setState(State(enabled: isOn))
        });
        
        view.frame = CGRectMake(100, 100, 100, 100)
        
        if self.state().enabled {
            view.backgroundColor = UIColor.redColor()
        }
        
        let testComponent = TestComponent()
        
        testComponent.frame = CGRectMake(0, 50, 100, 30)
        
        view.add(testComponent)
        
        return view
    }
}

func ComponentSample(title:String) -> () -> Node {
    
    struct State {
        let enabled = false
    }
    
    let state = State(enabled: false)
    
    func render() -> Node {
        let view = ViewNode()
        
        return view
    }
    
    return render
}

class SampleDSLComponent : Component {
    override func render() -> Node {
        return verticalLayout {
            padding(left: 0, top: 10)

            horizontalLayout {
                ViewNode()
                ViewNode()
                ViewNode()
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

