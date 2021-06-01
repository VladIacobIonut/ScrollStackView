//
//  UISpacer.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

class SpacerView: UIView {}

struct UISpacer: ViewStackable {
    var stackedView: [ViewStackable] {
        [self]
    }
    let height: HeightTuple?
    let padding: UIEdgeInsets?
    let view: UIView
    let viewController: UIViewController?
    
    // MARK: - Init
    
    init() {
        self.view = SpacerView()
        self.padding = nil
        self.viewController = nil
        self.height = nil
    }
    
    func padding(_ top: CGFloat) -> StackedView {
        self
    }
    
    func height(_ height: CGFloat?, minHeight: CGFloat?, maxHeight: CGFloat?) -> StackedView {
        self
    }
}
