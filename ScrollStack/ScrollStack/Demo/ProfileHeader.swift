//
//  ProfileHeader.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import UIKit
import SnapKit

class ProfileHeader: UIView {
    let imageView = UIImageView(image: UIImage(named: ""))
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(imageView)
        addSubview(nameLabel)
        backgroundColor = .secondarySystemBackground
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.size.equalTo(70)
            $0.centerX.equalToSuperview()
        }
        
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "cart.circle.fill")
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        nameLabel.text = "Checkout"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
}
