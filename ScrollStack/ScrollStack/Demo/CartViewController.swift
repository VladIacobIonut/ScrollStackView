//
//  CartViewController.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit
import SnapKit

final class CartViewController: ScrollStackViewController {
    // MARK: - Properties
    
    private let cartHeader = ProfileHeader()
    private let emptyLabel = UILabel()
    private let imageView = UIImageView(image: UIImage(named: "lake"))
    private let shouldShowCheckout = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stack {
            cartHeader
            UISpacer()
            emptyLabel
            CheckoutViewController()
        }
        
        emptyLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
        }
               
        emptyLabel.numberOfLines = 0
        emptyLabel.text = "Your cart is empty."
        
        emptyLabel.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        emptyLabel.textColor = .secondaryLabel
        
        emptyLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-50)
        }
    }
}
