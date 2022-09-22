//
//  VerificationButton.swift
//  Menu Registration
//
//  Created by Saidaxmad on 21/09/22.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        backgroundColor = .systemGray3
        setTitle("Verification Button", for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
