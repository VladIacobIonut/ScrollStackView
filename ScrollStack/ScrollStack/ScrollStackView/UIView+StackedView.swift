//
//  UIView+StackedView.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

extension UIView: StackedView {
    var stackedView: [ViewStackable] {
        [DecoratedStackedView(view: self)]
    }
}
