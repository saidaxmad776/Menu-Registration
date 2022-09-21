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
        
        backgroundColor = #colorLiteral(red: 0.6017745733, green: 0.4919376969, blue: 0.7290791273, alpha: 1)
        setTitle("Verification Button", for: .normal)
        let color = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        setTitleColor(color, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
