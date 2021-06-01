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
    
    private let header = ProfileHeader()
    private let header2 = ProfileHeader()
    private let label = UILabel()
    private let imageView = UIImageView(image: UIImage(named: "lake"))
    private let shouldShowCheckout = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        stack {
            imageView
                .height(max: 50)
            header
            label
                .height(max: 100)
            
            UISpacer()
                        
            if shouldShowCheckout {
                CheckoutViewController()
            } else {
                header2.padding(top: 50)
            }
        }
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
        }
               
        label.numberOfLines = 0
        label.text = "Mention audio processing to most iOS developers, and they’ll give you a look of fear and trepidation. That’s because, prior to iOS 8, it meant diving into the depths of the low-level Core Audio framework — a trip only a few brave souls dared to make. Thankfully, that all changed in 2014 with the release of iOS 8 and AVAudioEngine. This AVAudioEngine tutorial will show you how to use Apple’s new, higher-level audio toolkit to make audio processing apps without the need to dive into Core Audio.That’s right! No longer do you need to search through obscure pointer-based C/C++ structures and memory buffers to gather your raw audio data. If you understand basic Swift code, this tutorial will guide you through the adding audio features to an app."
    }
}
