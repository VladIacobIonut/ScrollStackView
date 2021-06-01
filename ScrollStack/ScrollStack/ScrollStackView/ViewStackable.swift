//
//  ViewStackable.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

typealias HeightTuple = (height: CGFloat?, minHeight: CGFloat?, maxHeight: CGFloat?)

protocol ViewStackable: StackedView {
    var stackedView: [ViewStackable] { get }
    var view: UIView { get }
    var padding: UIEdgeInsets? { get }
    var viewController: UIViewController? { get }
    var height: HeightTuple? { get }
    
    func padding(_ top: CGFloat) -> StackedView
    func height(_ height: CGFloat?, minHeight: CGFloat?, maxHeight: CGFloat?) -> StackedView
}

extension ViewStackable {
    func _height(_ absolute: CGFloat? = nil, minHeight: CGFloat? = nil, maxHeight: CGFloat? = nil) -> StackedView {
        height(absolute, minHeight: minHeight, maxHeight: maxHeight)
    }
}
