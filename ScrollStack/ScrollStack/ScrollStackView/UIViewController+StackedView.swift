//
//  UIViewController+StackedView.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

extension UIViewController: StackedView {
    var stackedView: [ViewStackable] {
        [DecoratedStackedView(view: view, viewController: self)]
    }
}
