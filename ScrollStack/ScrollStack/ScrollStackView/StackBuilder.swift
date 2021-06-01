//
//  StackBuilder.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import Foundation

@resultBuilder
struct StackBuilder {
    static func buildOptional(_ component: [StackedView]?) -> [StackedView] {
        component?.flatMap { $0.stackedView } ?? []
    }

    static func buildEither(second component: [StackedView]) -> [StackedView] {
        component.flatMap { $0.stackedView }
    }

    static func buildEither(first component: [StackedView]) -> [StackedView] {
        component.flatMap { $0.stackedView }
    }

    static func buildBlock(_ components: StackedView...) -> [StackedView] {
        components.flatMap { $0.stackedView }
    }
}
