//  AppStoreDetailsViewController.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 5/31/21.
//

import UIKit
import SwiftUI

final class AppStoreDetailsViewController: ScrollStackViewController {
    // MARK: - Properties
    
    private let detailsLabel = UILabel()
    private let shareButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Share", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.setImage(UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20,
                                                                                                                                       weight: .medium))),          for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    private let isMyPost = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        stack {
            UIHostingController(rootView: AppStoreHeader())
                .height(max: 400)
            
            detailsLabel
                .padding(top: 30)
               
            UISpacer()
            
            if isMyPost {
                UIHostingController(rootView: FooterView())
            } else {
                shareButton
            }
        }
        
        detailsLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
        }
                
        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .justified
        detailsLabel.text = """
            The Northern Lights are actually the result of collisions between gaseous particles in the Earth's atmosphere with charged particles released from the sun's atmosphere. Variations in colour are due to the type of gas particles that are colliding. The most common auroral color, a pale yellowish-green, is produced by oxygen molecules located about 60 miles above the earth. Rare, all-red auroras are produced by high-altitude oxygen, at heights of up to 200 miles. Nitrogen produces blue or purplish-red aurora.
            The bright dancing lights of the aurora are actually collisions between electrically charged particles from the sun that enter the earth's atmosphere. The lights are seen above the magnetic poles of the northern and southern hemispheres. They are known as 'Aurora borealis' in the north and 'Aurora australis' in the south..
            Auroral displays appear in many colours although pale green and pink are the most common. Shades of red, yellow, green, blue, and violet have been reported. The lights appear in many forms from patches or scattered clouds of light to streamers, arcs, rippling curtains or shooting rays that light up the sky with an eerie glow.
        """
        
        shareButton.snp.makeConstraints {
            $0.size.equalTo(70)
        }
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
    }
    
    @objc private func share() {
        detailsLabel.text = """
                        Auroral displays appear in many colours although pale green and pink are the most common. Shades of red, yellow, green, blue, and violet have been reported. The lights appear in many forms from patches or scattered clouds of light to streamers, arcs, rippling curtains or shooting rays that light up the sky with an eerie glow.
            """
    }
}
