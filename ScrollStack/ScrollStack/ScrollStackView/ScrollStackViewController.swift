//
//  ScrollStackView.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 5/28/21.
//

import UIKit
import SnapKit

class ScrollStackViewController: UIViewController {
    // MARK: - Properties
    
    private let scrollView = UIScrollView()
    private var views: [StackedView] = []
    private lazy var stackView = UIStackView()
    private var stackViewHeightWithoutSpacers: CGFloat {
        stackView.arrangedSubviews
            .filter { !($0 is SpacerView) }
            .reduce(CGFloat(0)) { $0 + $1.frame.height }
    }
    private var stackViewHeightWithSpacers: CGFloat {
        stackView.arrangedSubviews.reduce(CGFloat(0)) { $0 + $1.frame.height }
    }
    
    // MARK: - ViewController
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard stackViewHeightWithoutSpacers < UIScreen.main.bounds.height else {
            removeSpacersIfNeeded()
            return
        }

        guard views.contains(where: { $0 is UISpacer }) else {
            return
        }

        guard stackViewHeightWithSpacers < UIScreen.main.bounds.height else { return }

        stack(ignoreSpacers: false, views: views)
    }
    
    override func viewDidLoad() {
        setupScrollView()
    }
    
    // MARK: - Functions
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().priority(.low)
        }
        
        stackView.backgroundColor = .white
        stackView.axis = .vertical
    }
        
    func stack(@StackBuilder views: () -> [StackedView]) {
        self.views = views()
        
        stack(ignoreSpacers: true, views: self.views)
    }
    
    private func stack(ignoreSpacers: Bool = true, views: [StackedView]) {
        var previousView: UIView?
        
        for stackedView in self.views {
            switch stackedView {
            case is DecoratedStackedView:
                let currentView = add(stackedView as? DecoratedStackedView, after: previousView)
                previousView = currentView?.view
            case is UISpacer:
                guard !ignoreSpacers else { continue }
                add(stackedView as? UISpacer, after: previousView)
            default:
                return
            }
        }
    }
    
    private func removeSpacersIfNeeded() {
        for spacer in stackView.arrangedSubviews where spacer is SpacerView {
            stackView.removeArrangedSubview(spacer)
        }
    }
    
    private func add(_ decoratedStackView: DecoratedStackedView?, after previousView: UIView?) -> DecoratedStackedView? {
        guard let stackedView = decoratedStackView else { return nil }
        performPreEntranceSetup(on: stackedView.viewController)
        
        stackView.addArrangedSubview(stackedView.view)
        
        setupHeight(for: stackedView.view, using: stackedView.height)
        if let previousView = previousView {
            stackView.setCustomSpacing(stackedView.padding?.top ?? 0, after: previousView)
        }
        
        performPostEntranceSetup(on: stackedView.viewController)
        
        return stackedView
    }
    
    private func add(_ spacerStackView: UISpacer?, after view: UIView?) {
        guard let spacerView = spacerStackView?.stackedView.first?.view else { return }
        
        guard let previousView = view, let previousViewIndex = stackView.arrangedSubviews.firstIndex(of: previousView) else {
            stackView.insertArrangedSubview(spacerView, at: 0)
            return
        }

        stackView.insertArrangedSubview(spacerView, at: previousViewIndex + 1)
    }
    
    private func setupHeight(for view: UIView, using height: HeightTuple?) {
        guard let height = height else { return }
        switch height {
        case (.some(let absolute), _, _):
            view.snp.makeConstraints {
                $0.height.equalTo(absolute)
            }
        case (_, .some(let min), _):
            view.snp.makeConstraints {
                $0.height.greaterThanOrEqualTo(min)
            }
        case (_, _, .some(let max)):
            view.snp.makeConstraints {
                $0.height.lessThanOrEqualTo(max)
            }
        default:
            return
        }
    }
    
    private func performPreEntranceSetup(on viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        addChild(viewController)
        viewController.willMove(toParent: self)
    }
    
    private func performPostEntranceSetup(on viewController: UIViewController?) {
        viewController?.didMove(toParent: self)
    }
}
