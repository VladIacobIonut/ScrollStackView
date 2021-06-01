//
//  StackedView.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

protocol StackedView {
    var stackedView: [ViewStackable] { get }
}

extension StackedView {
    func padding(top: CGFloat = 5) -> StackedView {
        stackedView.map { $0.padding(top) }
    }
    
    func height(absolute: CGFloat) -> StackedView {
        stackedView.map { $0._height(absolute) }
    }
    
    func height(min: CGFloat) -> StackedView {
        stackedView.map { $0._height(minHeight: min) }
    }
    
    func height(max: CGFloat) -> StackedView {
        stackedView.map { $0._height(maxHeight: max) }
    }
}

extension Array: StackedView where Element == StackedView {
    var stackedView: [ViewStackable] {
        compactMap { $0 as? ViewStackable }
    }
}
