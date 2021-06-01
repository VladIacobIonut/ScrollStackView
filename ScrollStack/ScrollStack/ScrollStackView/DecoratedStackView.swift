//
//  DecoratedStackView.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

struct DecoratedStackedView: ViewStackable {
    var stackedView: [ViewStackable] {
        [self]
    }
    let view: UIView
    let padding: UIEdgeInsets?
    let viewController: UIViewController?
    let height: HeightTuple?
    
    init(view: UIView, padding: UIEdgeInsets? = nil, height: HeightTuple? = nil, viewController: UIViewController? = nil) {
        self.view = view
        self.padding = padding
        self.height = height
        self.viewController = viewController
    }
        
    public func padding(_ top: CGFloat) -> StackedView {
        DecoratedStackedView(view: view,
                             padding: UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0),
                             height: height,
                             viewController: viewController)
    }
        
    public func height(_ height: CGFloat?, minHeight: CGFloat?, maxHeight: CGFloat?) -> StackedView {
        DecoratedStackedView(view: view,
                             padding: padding,
                             height: (height, minHeight, maxHeight),
                             viewController: viewController)
    }
}
