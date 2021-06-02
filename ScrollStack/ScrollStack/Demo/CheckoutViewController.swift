//
//  CheckoutViewController.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit

final class CheckoutViewController: UIViewController {
    // MARK: - Properties
    
    private let totalLabel = UILabel()
    private let priceLabel = UILabel()
    private let buyButton = UIButton()
    
    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        view.addSubview(totalLabel)
        view.addSubview(priceLabel)
        view.addSubview(buyButton)
        
        totalLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(totalLabel.snp.bottom).offset(10)
            $0.leading.equalTo(totalLabel)
            $0.bottom.equalToSuperview().offset(-50)
        }
        
        buyButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(100)
            $0.height.equalTo(60)
            $0.bottom.equalToSuperview().offset(-50)
        }
        
        totalLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        totalLabel.textColor = .secondaryLabel
        totalLabel.text = "Total"
        
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        priceLabel.textColor = .black
        priceLabel.text = "0.0 $"
        
        buyButton.backgroundColor = .systemBlue
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.layer.cornerRadius = 15
        buyButton.setTitle("Order", for: .normal)
    }
}
