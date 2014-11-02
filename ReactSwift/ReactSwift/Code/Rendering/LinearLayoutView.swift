//
//  LinearLayoutView.swift
//  ReactSwift
//
//  Created by Sergey Zenchenko on 11/2/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

import UIKit

class LinearLayoutView: UIView {

    override func layoutSubviews() {
        var prevView:View?
        for view in self.subviews {
            view.sizeToFit()
            if let pv = prevView? {
                layout(view as View, pv, { v1, v2 in
                    v1.top == v2.bottom
                    v1.left == v2.left
                    v1.width == v2.width
                })
            } else {
                layout(view as View, { v in
                    v.top == v.superview!.top
                    v.left == v.superview!.left
                    v.width == v.superview!.width
                })
            }
            
            prevView = view as? View
        }
    }

}
